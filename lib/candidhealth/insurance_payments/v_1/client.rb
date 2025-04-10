# frozen_string_literal: true

require_relative "../../../requests"
require_relative "types/insurance_payment_sort_field"
require_relative "../../commons/types/sort_direction"
require_relative "types/insurance_payments_page"
require_relative "types/insurance_payment"
require "async"

module CandidApiClient
  module InsurancePayments
    module V1
      class V1Client
        # @return [CandidApiClient::RequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::RequestClient]
        # @return [CandidApiClient::InsurancePayments::V1::V1Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # Returns all non-ERA originated insurance payments satisfying the search criteria
        #
        # @param limit [Integer] Defaults to 100. The value must be greater than 0 and less than 1000.
        # @param payer_uuid [String]
        # @param claim_id [String]
        # @param service_line_id [String]
        # @param billing_provider_id [String]
        # @param sort [CandidApiClient::InsurancePayments::V1::Types::InsurancePaymentSortField] Defaults to payment_timestamp
        # @param sort_direction [CandidApiClient::Commons::Types::SortDirection] Sort direction. Defaults to descending order if not provided.
        # @param page_token [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::InsurancePayments::V1::Types::InsurancePaymentsPage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.insurance_payments.v_1.get_multi(
        #    limit: 1,
        #    payer_uuid: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    claim_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    service_line_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    billing_provider_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    sort: AMOUNT_CENTS,
        #    sort_direction: ASC,
        #    page_token: "eyJ0b2tlbiI6IjEiLCJwYWdlX3Rva2VuIjoiMiJ9"
        #  )
        def get_multi(limit: nil, payer_uuid: nil, claim_id: nil, service_line_id: nil, billing_provider_id: nil,
                      sort: nil, sort_direction: nil, page_token: nil, request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "limit": limit,
              "payer_uuid": payer_uuid,
              "claim_id": claim_id,
              "service_line_id": service_line_id,
              "billing_provider_id": billing_provider_id,
              "sort": sort,
              "sort_direction": sort_direction,
              "page_token": page_token
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/insurance-payments/v1"
          end
          CandidApiClient::InsurancePayments::V1::Types::InsurancePaymentsPage.from_json(json_object: response.body)
        end

        # Retrieves a previously created insurance payment by its `insurance_payment_id`.
        #  If the payment does not exist, a `403` will be thrown.
        #
        # @param insurance_payment_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::InsurancePayments::V1::Types::InsurancePayment]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.insurance_payments.v_1.get(insurance_payment_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get(insurance_payment_id:, request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/insurance-payments/v1/#{insurance_payment_id}"
          end
          CandidApiClient::InsurancePayments::V1::Types::InsurancePayment.from_json(json_object: response.body)
        end
      end

      class AsyncV1Client
        # @return [CandidApiClient::AsyncRequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::AsyncRequestClient]
        # @return [CandidApiClient::InsurancePayments::V1::AsyncV1Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # Returns all non-ERA originated insurance payments satisfying the search criteria
        #
        # @param limit [Integer] Defaults to 100. The value must be greater than 0 and less than 1000.
        # @param payer_uuid [String]
        # @param claim_id [String]
        # @param service_line_id [String]
        # @param billing_provider_id [String]
        # @param sort [CandidApiClient::InsurancePayments::V1::Types::InsurancePaymentSortField] Defaults to payment_timestamp
        # @param sort_direction [CandidApiClient::Commons::Types::SortDirection] Sort direction. Defaults to descending order if not provided.
        # @param page_token [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::InsurancePayments::V1::Types::InsurancePaymentsPage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.insurance_payments.v_1.get_multi(
        #    limit: 1,
        #    payer_uuid: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    claim_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    service_line_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    billing_provider_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    sort: AMOUNT_CENTS,
        #    sort_direction: ASC,
        #    page_token: "eyJ0b2tlbiI6IjEiLCJwYWdlX3Rva2VuIjoiMiJ9"
        #  )
        def get_multi(limit: nil, payer_uuid: nil, claim_id: nil, service_line_id: nil, billing_provider_id: nil,
                      sort: nil, sort_direction: nil, page_token: nil, request_options: nil)
          Async do
            response = @request_client.conn.get do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.params = {
                **(request_options&.additional_query_parameters || {}),
                "limit": limit,
                "payer_uuid": payer_uuid,
                "claim_id": claim_id,
                "service_line_id": service_line_id,
                "billing_provider_id": billing_provider_id,
                "sort": sort,
                "sort_direction": sort_direction,
                "page_token": page_token
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/insurance-payments/v1"
            end
            CandidApiClient::InsurancePayments::V1::Types::InsurancePaymentsPage.from_json(json_object: response.body)
          end
        end

        # Retrieves a previously created insurance payment by its `insurance_payment_id`.
        #  If the payment does not exist, a `403` will be thrown.
        #
        # @param insurance_payment_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::InsurancePayments::V1::Types::InsurancePayment]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.insurance_payments.v_1.get(insurance_payment_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get(insurance_payment_id:, request_options: nil)
          Async do
            response = @request_client.conn.get do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/insurance-payments/v1/#{insurance_payment_id}"
            end
            CandidApiClient::InsurancePayments::V1::Types::InsurancePayment.from_json(json_object: response.body)
          end
        end
      end
    end
  end
end
