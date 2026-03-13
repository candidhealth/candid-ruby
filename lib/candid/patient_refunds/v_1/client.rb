# frozen_string_literal: true

module Candid
  module PatientRefunds
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

        # Returns all patient refunds satisfying the search criteria AND whose organization_id matches
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
        # @option params [String, nil] :patient_external_id
        # @option params [String, nil] :claim_id
        # @option params [String, nil] :service_line_id
        # @option params [String, nil] :billing_provider_id
        # @option params [Boolean, nil] :unattributed
        # @option params [String, nil] :invoice_id
        # @option params [Candid::Financials::Types::PatientTransactionSource, nil] :sources
        # @option params [Candid::PatientRefunds::V1::Types::PatientRefundSortField, nil] :sort
        # @option params [Candid::Commons::Types::SortDirection, nil] :sort_direction
        # @option params [String, nil] :page_token
        #
        # @return [Candid::PatientRefunds::V1::Types::PatientRefundsPage]
        def get_multi(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[limit patient_external_id claim_id service_line_id billing_provider_id unattributed invoice_id sources sort sort_direction page_token]
          query_params = {}
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["patient_external_id"] = params[:patient_external_id] if params.key?(:patient_external_id)
          query_params["claim_id"] = params[:claim_id] if params.key?(:claim_id)
          query_params["service_line_id"] = params[:service_line_id] if params.key?(:service_line_id)
          query_params["billing_provider_id"] = params[:billing_provider_id] if params.key?(:billing_provider_id)
          query_params["unattributed"] = params[:unattributed] if params.key?(:unattributed)
          query_params["invoice_id"] = params[:invoice_id] if params.key?(:invoice_id)
          query_params["sources"] = params[:sources] if params.key?(:sources)
          query_params["sort"] = params[:sort] if params.key?(:sort)
          query_params["sort_direction"] = params[:sort_direction] if params.key?(:sort_direction)
          query_params["page_token"] = params[:page_token] if params.key?(:page_token)
          params.except(*query_param_names)

          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "GET",
            path: "/api/patient-refunds/v1",
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
            Candid::PatientRefunds::V1::Types::PatientRefundsPage.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Retrieves a previously created patient refund by its `patient_refund_id`.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::PatientRefunds::V1::Types::PatientRefundId] :patient_refund_id
        #
        # @return [Candid::PatientRefunds::V1::Types::PatientRefund]
        def get(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "GET",
            path: "/api/patient-refunds/v1/#{params[:patient_refund_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::PatientRefunds::V1::Types::PatientRefund.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Creates a new patient refund record and returns the newly created PatientRefund object.
        # The allocations can describe whether the refund is being applied toward a specific service line,
        # claim, or billing provider.
        #
        # @param request_options [Hash]
        # @param params [Candid::PatientRefunds::V1::Types::PatientRefundCreate]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Candid::PatientRefunds::V1::Types::PatientRefund]
        def create(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "POST",
            path: "/api/patient-refunds/v1",
            body: Candid::PatientRefunds::V1::Types::PatientRefundCreate.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::PatientRefunds::V1::Types::PatientRefund.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Updates the patient refund record matching the provided patient_refund_id.
        #
        # @param request_options [Hash]
        # @param params [Candid::PatientRefunds::V1::Types::PatientRefundUpdate]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::PatientRefunds::V1::Types::PatientRefundId] :patient_refund_id
        #
        # @return [Candid::PatientRefunds::V1::Types::PatientRefund]
        def update(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request_data = Candid::PatientRefunds::V1::Types::PatientRefundUpdate.new(params).to_h
          non_body_param_names = ["patient_refund_id"]
          body = request_data.except(*non_body_param_names)

          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "PATCH",
            path: "/api/patient-refunds/v1/#{params[:patient_refund_id]}",
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
            Candid::PatientRefunds::V1::Types::PatientRefund.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Deletes the patient refund record matching the provided patient_refund_id.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::PatientRefunds::V1::Types::PatientRefundId] :patient_refund_id
        #
        # @return [untyped]
        def delete(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "DELETE",
            path: "/api/patient-refunds/v1/#{params[:patient_refund_id]}",
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
