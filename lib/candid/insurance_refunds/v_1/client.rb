# frozen_string_literal: true

module Candid
  module InsuranceRefunds
    module V1
      class Client
        # @param client [Candid::Internal::Http::RawClient]
        # @param base_url [String, nil]
        # @param environment [Hash[Symbol, String], nil]
        #
        # @return [void]
        def initialize(client:, base_url: nil, environment: nil)
          @client = client
          @base_url = base_url
          @environment = environment
        end

        # Returns all insurance refunds satisfying the search criteria AND whose organization_id matches
        # the current organization_id of the authenticated user.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Integer, nil] :limit
        # @option params [String, nil] :payer_uuid
        # @option params [String, nil] :claim_id
        # @option params [String, nil] :service_line_id
        # @option params [String, nil] :billing_provider_id
        # @option params [Candid::InsuranceRefunds::V1::Types::InsuranceRefundSortField, nil] :sort
        # @option params [Candid::Commons::Types::SortDirection, nil] :sort_direction
        # @option params [String, nil] :page_token
        #
        # @return [Candid::InsuranceRefunds::V1::Types::InsuranceRefundsPage]
        def get_multi(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[limit payer_uuid claim_id service_line_id billing_provider_id sort sort_direction page_token]
          query_params = {}
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["payer_uuid"] = params[:payer_uuid] if params.key?(:payer_uuid)
          query_params["claim_id"] = params[:claim_id] if params.key?(:claim_id)
          query_params["service_line_id"] = params[:service_line_id] if params.key?(:service_line_id)
          query_params["billing_provider_id"] = params[:billing_provider_id] if params.key?(:billing_provider_id)
          query_params["sort"] = params[:sort] if params.key?(:sort)
          query_params["sort_direction"] = params[:sort_direction] if params.key?(:sort_direction)
          query_params["page_token"] = params[:page_token] if params.key?(:page_token)
          params.except(*query_param_names)

          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "GET",
            path: "/api/insurance-refunds/v1",
            query: query_params,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::InsuranceRefunds::V1::Types::InsuranceRefundsPage.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Retrieves a previously created insurance refund by its `insurance_refund_id`.
        # If the refund does not exist, a `403` will be thrown.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::InsuranceRefunds::V1::Types::InsuranceRefundId] :insurance_refund_id
        #
        # @return [Candid::InsuranceRefunds::V1::Types::InsuranceRefund]
        def get(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "GET",
            path: "/api/insurance-refunds/v1/#{params[:insurance_refund_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::InsuranceRefunds::V1::Types::InsuranceRefund.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Creates a new insurance refund record and returns the newly created `InsuranceRefund` object.
        # The allocations can describe whether the refund is being applied toward a specific service line,
        # claim, or billing provider.
        #
        # @param request_options [Hash]
        # @param params [Candid::InsuranceRefunds::V1::Types::InsuranceRefundCreate]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Candid::InsuranceRefunds::V1::Types::InsuranceRefund]
        def create(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "POST",
            path: "/api/insurance-refunds/v1",
            body: Candid::InsuranceRefunds::V1::Types::InsuranceRefundCreate.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::InsuranceRefunds::V1::Types::InsuranceRefund.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Updates the patient refund record matching the provided insurance_refund_id. If updating the refund amount,
        # then the allocations must be appropriately updated as well.
        #
        # @param request_options [Hash]
        # @param params [Candid::InsuranceRefunds::V1::Types::InsuranceRefundUpdate]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::InsuranceRefunds::V1::Types::InsuranceRefundId] :insurance_refund_id
        #
        # @return [Candid::InsuranceRefunds::V1::Types::InsuranceRefund]
        def update(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request_data = Candid::InsuranceRefunds::V1::Types::InsuranceRefundUpdate.new(params).to_h
          non_body_param_names = ["insurance_refund_id"]
          body = request_data.except(*non_body_param_names)

          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "PATCH",
            path: "/api/insurance-refunds/v1/#{params[:insurance_refund_id]}",
            body: body,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::InsuranceRefunds::V1::Types::InsuranceRefund.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Deletes the insurance refund record matching the provided `insurance_refund_id`.
        # If the matching record's organization_id does not match the authenticated user's
        # current organization_id, then a response code of `403` will be returned.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::InsuranceRefunds::V1::Types::InsuranceRefundId] :insurance_refund_id
        #
        # @return [untyped]
        def delete(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "DELETE",
            path: "/api/insurance-refunds/v1/#{params[:insurance_refund_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          return if code.between?(200, 299)

          error_class = Candid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
