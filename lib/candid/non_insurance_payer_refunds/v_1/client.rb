# frozen_string_literal: true

module Candid
  module NonInsurancePayerRefunds
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

        # Returns all non-insurance payer refunds satisfying the search criteria
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Integer, nil] :limit
        # @option params [String, nil] :non_insurance_payer_id
        # @option params [String, nil] :check_number
        # @option params [String, nil] :invoice_id
        # @option params [Candid::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefundSortField, nil] :sort
        # @option params [Candid::Commons::Types::SortDirection, nil] :sort_direction
        # @option params [String, nil] :page_token
        #
        # @return [Candid::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefundsPage]
        def get_multi(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[limit non_insurance_payer_id check_number invoice_id sort sort_direction page_token]
          query_params = {}
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["non_insurance_payer_id"] = params[:non_insurance_payer_id] if params.key?(:non_insurance_payer_id)
          query_params["check_number"] = params[:check_number] if params.key?(:check_number)
          query_params["invoice_id"] = params[:invoice_id] if params.key?(:invoice_id)
          query_params["sort"] = params[:sort] if params.key?(:sort)
          query_params["sort_direction"] = params[:sort_direction] if params.key?(:sort_direction)
          query_params["page_token"] = params[:page_token] if params.key?(:page_token)
          params.except(*query_param_names)

          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "GET",
            path: "/api/non-insurance-payer-refunds/v1",
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
            Candid::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefundsPage.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Retrieves a previously created non-insurance payer refund by its `non_insurance_payer_refund_id`.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefundId] :non_insurance_payer_refund_id
        #
        # @return [Candid::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefund]
        def get(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "GET",
            path: "/api/non-insurance-payer-refunds/v1/#{params[:non_insurance_payer_refund_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefund.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Creates a new non-insurance payer refund record and returns the newly created `NonInsurancePayerRefund`
        # object.
        # The allocations can describe whether the refund is being applied toward a specific service line,
        # claim, or billing provider.
        #
        # @param request_options [Hash]
        # @param params [Candid::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefundCreate]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Candid::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefund]
        def create(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "POST",
            path: "/api/non-insurance-payer-refunds/v1",
            body: Candid::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefundCreate.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefund.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Updates the non-insurance payer refund record matching the provided non_insurance_payer_refund_id. If updating
        # the refund amount,
        # then the allocations must be appropriately updated as well.
        #
        # @param request_options [Hash]
        # @param params [Candid::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefundUpdate]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefundId] :non_insurance_payer_refund_id
        #
        # @return [Candid::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefund]
        def update(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request_data = Candid::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefundUpdate.new(params).to_h
          non_body_param_names = ["non_insurance_payer_refund_id"]
          body = request_data.except(*non_body_param_names)

          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "PATCH",
            path: "/api/non-insurance-payer-refunds/v1/#{params[:non_insurance_payer_refund_id]}",
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
            Candid::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefund.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Deletes the non-insurance payer refund record matching the provided `non_insurance_payer_refund_id`.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefundId] :non_insurance_payer_refund_id
        #
        # @return [untyped]
        def delete(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "DELETE",
            path: "/api/non-insurance-payer-refunds/v1/#{params[:non_insurance_payer_refund_id]}",
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
