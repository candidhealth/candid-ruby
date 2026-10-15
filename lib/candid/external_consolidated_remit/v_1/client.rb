# frozen_string_literal: true

module Candid
  module ExternalConsolidatedRemit
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

        # Returns metadata for every ERA payment (835 transaction set) associated with a
        # consolidated remit, including the source ERA document for each, and indicates which ERA
        # payment is currently elected as primary.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::ConsolidatedRemits::V1::Types::ConsolidatedRemitId] :consolidated_remit_id
        #
        # @return [Candid::ExternalConsolidatedRemit::V1::Types::ExternalConsolidatedRemitEraPaymentsResponse]
        def get_era_payments(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "GET",
            path: "/api/external-consolidated-remit/v1/#{params[:consolidated_remit_id]}/era-payments",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::ExternalConsolidatedRemit::V1::Types::ExternalConsolidatedRemitEraPaymentsResponse.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Paginated, combined list of InsurancePayment and InsuranceAdjustment transactions posted
        # from a consolidated remit's ERA payments - covering service-payment-driven and
        # payment-bundle-driven activity of both kinds, and both the posted and voided sides of each
        # (see is_void). Each item is discriminated by type; fields common to both transaction types
        # are always present alongside the type-specific ones. One combined, single-cursor
        # pagination stream rather than two separate endpoints - filter to a single type with
        # transaction_type if you only care about one.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::ConsolidatedRemits::V1::Types::ConsolidatedRemitId] :consolidated_remit_id
        # @option params [String, nil] :page_token
        # @option params [Integer, nil] :limit
        # @option params [String, nil] :era_payment_id
        # @option params [String, nil] :transaction_id
        # @option params [Candid::ExternalConsolidatedRemit::V1::Types::TransactionType, nil] :transaction_type
        #
        # @return [Candid::ExternalConsolidatedRemit::V1::Types::ExternalConsolidatedRemitTransactionPage]
        def get_transactions(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[page_token limit era_payment_id transaction_id transaction_type]
          query_params = {}
          query_params["page_token"] = params[:page_token] if params.key?(:page_token)
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["era_payment_id"] = params[:era_payment_id] if params.key?(:era_payment_id)
          query_params["transaction_id"] = params[:transaction_id] if params.key?(:transaction_id)
          query_params["transaction_type"] = params[:transaction_type] if params.key?(:transaction_type)
          params = params.except(*query_param_names)

          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "GET",
            path: "/api/external-consolidated-remit/v1/#{params[:consolidated_remit_id]}/transactions",
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
            Candid::ExternalConsolidatedRemit::V1::Types::ExternalConsolidatedRemitTransactionPage.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
