# frozen_string_literal: true

require_relative "../../../requests"
require_relative "types/third_party_payer_payment_sort_field"
require_relative "../../commons/types/sort_direction"
require_relative "types/third_party_payer_payments_page"
require_relative "types/third_party_payer_payment"
require_relative "types/third_party_payer_payment_create"
require "date"
require_relative "../../financials/types/note_update"
require_relative "../../financials/types/invoice_update"
require "async"

module CandidApiClient
  module ThirdPartyPayerPayments
    module V1
      class V1Client
        # @return [CandidApiClient::RequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::RequestClient]
        # @return [CandidApiClient::ThirdPartyPayerPayments::V1::V1Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # Returns all third party payer payments
        #
        # @param limit [Integer] Defaults to 100. The value must be greater than 0 and less than 1000.
        # @param third_party_payer_id [String]
        # @param check_number [String]
        # @param invoice_id [String]
        # @param sort [CandidApiClient::ThirdPartyPayerPayments::V1::Types::ThirdPartyPayerPaymentSortField] Defaults to refund_timestamp
        # @param sort_direction [CandidApiClient::Commons::Types::SortDirection] Sort direction. Defaults to descending order if not provided.
        # @param page_token [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ThirdPartyPayerPayments::V1::Types::ThirdPartyPayerPaymentsPage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.third_party_payer_payments.v_1.get_multi(
        #    limit: 1,
        #    third_party_payer_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    check_number: "string",
        #    invoice_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    sort: AMOUNT_CENTS,
        #    sort_direction: ASC,
        #    page_token: "eyJ0b2tlbiI6IjEiLCJwYWdlX3Rva2VuIjoiMiJ9"
        #  )
        def get_multi(limit: nil, third_party_payer_id: nil, check_number: nil, invoice_id: nil, sort: nil,
                      sort_direction: nil, page_token: nil, request_options: nil)
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
              "third_party_payer_id": third_party_payer_id,
              "check_number": check_number,
              "invoice_id": invoice_id,
              "sort": sort,
              "sort_direction": sort_direction,
              "page_token": page_token
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/third-party-payer-payments/v1"
          end
          CandidApiClient::ThirdPartyPayerPayments::V1::Types::ThirdPartyPayerPaymentsPage.from_json(json_object: response.body)
        end

        # Retrieves a previously created third party payer payment by its
        #  `third_party_payer_payment_id`.
        #
        # @param third_party_payer_payment_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ThirdPartyPayerPayments::V1::Types::ThirdPartyPayerPayment]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.third_party_payer_payments.v_1.get(third_party_payer_payment_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get(third_party_payer_payment_id:, request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/third-party-payer-payments/v1/#{third_party_payer_payment_id}"
          end
          CandidApiClient::ThirdPartyPayerPayments::V1::Types::ThirdPartyPayerPayment.from_json(json_object: response.body)
        end

        # @param request [Hash] Request of type CandidApiClient::ThirdPartyPayerPayments::V1::Types::ThirdPartyPayerPaymentCreate, as a Hash
        #   * :third_party_payer_id (String)
        #   * :amount_cents (Integer)
        #   * :payment_timestamp (DateTime)
        #   * :payment_note (String)
        #   * :check_number (String)
        #   * :allocations (Array<CandidApiClient::Financials::Types::AllocationCreate>)
        #   * :invoice_id (String)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ThirdPartyPayerPayments::V1::Types::ThirdPartyPayerPayment]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.third_party_payer_payments.v_1.create(request: { third_party_payer_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", amount_cents: 1, payment_timestamp: DateTime.parse(2024-01-15T09:30:00.000Z), payment_note: "string", check_number: "string", allocations: [{ amount_cents: 1 }], invoice_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32" })
        def create(request:, request_options: nil)
          response = @request_client.conn.post do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/third-party-payer-payments/v1"
          end
          CandidApiClient::ThirdPartyPayerPayments::V1::Types::ThirdPartyPayerPayment.from_json(json_object: response.body)
        end

        # @param third_party_payer_payment_id [String]
        # @param payment_timestamp [DateTime]
        # @param payment_note [CandidApiClient::Financials::Types::NoteUpdate]
        # @param invoice_id [CandidApiClient::Financials::Types::InvoiceUpdate]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ThirdPartyPayerPayments::V1::Types::ThirdPartyPayerPayment]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.third_party_payer_payments.v_1.update(third_party_payer_payment_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", payment_timestamp: DateTime.parse(2024-01-15T09:30:00.000Z))
        def update(third_party_payer_payment_id:, payment_timestamp: nil, payment_note: nil, invoice_id: nil,
                   request_options: nil)
          response = @request_client.conn.patch do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.body = {
              **(request_options&.additional_body_parameters || {}),
              payment_timestamp: payment_timestamp,
              payment_note: payment_note,
              invoice_id: invoice_id
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/third-party-payer-payments/v1/#{third_party_payer_payment_id}"
          end
          CandidApiClient::ThirdPartyPayerPayments::V1::Types::ThirdPartyPayerPayment.from_json(json_object: response.body)
        end

        # Deletes the third party payer payment record matching the provided
        #  `third_party_payer_payment_id`.
        #
        # @param third_party_payer_payment_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Void]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.third_party_payer_payments.v_1.delete(third_party_payer_payment_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def delete(third_party_payer_payment_id:, request_options: nil)
          @request_client.conn.delete do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/third-party-payer-payments/v1/#{third_party_payer_payment_id}"
          end
        end
      end

      class AsyncV1Client
        # @return [CandidApiClient::AsyncRequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::AsyncRequestClient]
        # @return [CandidApiClient::ThirdPartyPayerPayments::V1::AsyncV1Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # Returns all third party payer payments
        #
        # @param limit [Integer] Defaults to 100. The value must be greater than 0 and less than 1000.
        # @param third_party_payer_id [String]
        # @param check_number [String]
        # @param invoice_id [String]
        # @param sort [CandidApiClient::ThirdPartyPayerPayments::V1::Types::ThirdPartyPayerPaymentSortField] Defaults to refund_timestamp
        # @param sort_direction [CandidApiClient::Commons::Types::SortDirection] Sort direction. Defaults to descending order if not provided.
        # @param page_token [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ThirdPartyPayerPayments::V1::Types::ThirdPartyPayerPaymentsPage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.third_party_payer_payments.v_1.get_multi(
        #    limit: 1,
        #    third_party_payer_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    check_number: "string",
        #    invoice_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    sort: AMOUNT_CENTS,
        #    sort_direction: ASC,
        #    page_token: "eyJ0b2tlbiI6IjEiLCJwYWdlX3Rva2VuIjoiMiJ9"
        #  )
        def get_multi(limit: nil, third_party_payer_id: nil, check_number: nil, invoice_id: nil, sort: nil,
                      sort_direction: nil, page_token: nil, request_options: nil)
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
                "third_party_payer_id": third_party_payer_id,
                "check_number": check_number,
                "invoice_id": invoice_id,
                "sort": sort,
                "sort_direction": sort_direction,
                "page_token": page_token
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/third-party-payer-payments/v1"
            end
            CandidApiClient::ThirdPartyPayerPayments::V1::Types::ThirdPartyPayerPaymentsPage.from_json(json_object: response.body)
          end
        end

        # Retrieves a previously created third party payer payment by its
        #  `third_party_payer_payment_id`.
        #
        # @param third_party_payer_payment_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ThirdPartyPayerPayments::V1::Types::ThirdPartyPayerPayment]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.third_party_payer_payments.v_1.get(third_party_payer_payment_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get(third_party_payer_payment_id:, request_options: nil)
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
                                                 request_options: request_options)}/api/third-party-payer-payments/v1/#{third_party_payer_payment_id}"
            end
            CandidApiClient::ThirdPartyPayerPayments::V1::Types::ThirdPartyPayerPayment.from_json(json_object: response.body)
          end
        end

        # @param request [Hash] Request of type CandidApiClient::ThirdPartyPayerPayments::V1::Types::ThirdPartyPayerPaymentCreate, as a Hash
        #   * :third_party_payer_id (String)
        #   * :amount_cents (Integer)
        #   * :payment_timestamp (DateTime)
        #   * :payment_note (String)
        #   * :check_number (String)
        #   * :allocations (Array<CandidApiClient::Financials::Types::AllocationCreate>)
        #   * :invoice_id (String)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ThirdPartyPayerPayments::V1::Types::ThirdPartyPayerPayment]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.third_party_payer_payments.v_1.create(request: { third_party_payer_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", amount_cents: 1, payment_timestamp: DateTime.parse(2024-01-15T09:30:00.000Z), payment_note: "string", check_number: "string", allocations: [{ amount_cents: 1 }], invoice_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32" })
        def create(request:, request_options: nil)
          Async do
            response = @request_client.conn.post do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/third-party-payer-payments/v1"
            end
            CandidApiClient::ThirdPartyPayerPayments::V1::Types::ThirdPartyPayerPayment.from_json(json_object: response.body)
          end
        end

        # @param third_party_payer_payment_id [String]
        # @param payment_timestamp [DateTime]
        # @param payment_note [CandidApiClient::Financials::Types::NoteUpdate]
        # @param invoice_id [CandidApiClient::Financials::Types::InvoiceUpdate]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ThirdPartyPayerPayments::V1::Types::ThirdPartyPayerPayment]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.third_party_payer_payments.v_1.update(third_party_payer_payment_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", payment_timestamp: DateTime.parse(2024-01-15T09:30:00.000Z))
        def update(third_party_payer_payment_id:, payment_timestamp: nil, payment_note: nil, invoice_id: nil,
                   request_options: nil)
          Async do
            response = @request_client.conn.patch do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = {
                **(request_options&.additional_body_parameters || {}),
                payment_timestamp: payment_timestamp,
                payment_note: payment_note,
                invoice_id: invoice_id
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/third-party-payer-payments/v1/#{third_party_payer_payment_id}"
            end
            CandidApiClient::ThirdPartyPayerPayments::V1::Types::ThirdPartyPayerPayment.from_json(json_object: response.body)
          end
        end

        # Deletes the third party payer payment record matching the provided
        #  `third_party_payer_payment_id`.
        #
        # @param third_party_payer_payment_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Void]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.third_party_payer_payments.v_1.delete(third_party_payer_payment_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def delete(third_party_payer_payment_id:, request_options: nil)
          Async do
            @request_client.conn.delete do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/third-party-payer-payments/v1/#{third_party_payer_payment_id}"
            end
          end
        end
      end
    end
  end
end
