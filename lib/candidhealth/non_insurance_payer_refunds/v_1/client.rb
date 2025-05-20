# frozen_string_literal: true

require_relative "../../../requests"
require_relative "types/non_insurance_payer_refund_sort_field"
require_relative "../../commons/types/sort_direction"
require_relative "types/non_insurance_payer_refunds_page"
require_relative "types/non_insurance_payer_refund"
require_relative "types/non_insurance_payer_refund_create"
require "date"
require_relative "../../financials/types/note_update"
require_relative "../../financials/types/refund_reason_update"
require_relative "../../financials/types/invoice_update"
require "async"

module CandidApiClient
  module NonInsurancePayerRefunds
    module V1
      class V1Client
        # @return [CandidApiClient::RequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::RequestClient]
        # @return [CandidApiClient::NonInsurancePayerRefunds::V1::V1Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # Returns all non-insurance payer refunds satisfying the search criteria
        #
        # @param limit [Integer] Defaults to 100. The value must be greater than 0 and less than 1000.
        # @param non_insurance_payer_id [String]
        # @param check_number [String]
        # @param invoice_id [String]
        # @param sort [CandidApiClient::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefundSortField] Defaults to refund_timestamp
        # @param sort_direction [CandidApiClient::Commons::Types::SortDirection] Sort direction. Defaults to descending order if not provided.
        # @param page_token [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefundsPage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.non_insurance_payer_refunds.v_1.get_multi
        def get_multi(limit: nil, non_insurance_payer_id: nil, check_number: nil, invoice_id: nil, sort: nil,
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
              "non_insurance_payer_id": non_insurance_payer_id,
              "check_number": check_number,
              "invoice_id": invoice_id,
              "sort": sort,
              "sort_direction": sort_direction,
              "page_token": page_token
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/non-insurance-payer-refunds/v1"
          end
          CandidApiClient::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefundsPage.from_json(json_object: response.body)
        end

        # Retrieves a previously created non-insurance payer refund by its
        #  `non_insurance_payer_refund_id`.
        #
        # @param non_insurance_payer_refund_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefund]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.non_insurance_payer_refunds.v_1.get(non_insurance_payer_refund_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get(non_insurance_payer_refund_id:, request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/non-insurance-payer-refunds/v1/#{non_insurance_payer_refund_id}"
          end
          CandidApiClient::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefund.from_json(json_object: response.body)
        end

        # Creates a new non-insurance payer refund record and returns the newly created
        #  `NonInsurancePayerRefund` object.
        #  The allocations can describe whether the refund is being applied toward a
        #  specific service line,
        #  claim, or billing provider.
        #
        # @param request [Hash] Request of type CandidApiClient::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefundCreate, as a Hash
        #   * :non_insurance_payer_id (String)
        #   * :invoice_id (String)
        #   * :amount_cents (Integer)
        #   * :refund_timestamp (DateTime)
        #   * :refund_note (String)
        #   * :check_number (String)
        #   * :allocations (Array<CandidApiClient::Financials::Types::AllocationCreate>)
        #   * :refund_reason (CandidApiClient::Financials::Types::RefundReason)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefund]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.non_insurance_payer_refunds.v_1.create(request: { non_insurance_payer_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", amount_cents: 1, allocations: [{ amount_cents: 1 }, { amount_cents: 1 }] })
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
                                               request_options: request_options)}/api/non-insurance-payer-refunds/v1"
          end
          CandidApiClient::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefund.from_json(json_object: response.body)
        end

        # Updates the non-insurance payer refund record matching the provided
        #  non_insurance_payer_refund_id. If updating the refund amount,
        #  then the allocations must be appropriately updated as well.
        #
        # @param non_insurance_payer_refund_id [String]
        # @param refund_timestamp [DateTime]
        # @param refund_note [CandidApiClient::Financials::Types::NoteUpdate]
        # @param refund_reason [CandidApiClient::Financials::Types::RefundReasonUpdate]
        # @param invoice_id [CandidApiClient::Financials::Types::InvoiceUpdate]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefund]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.non_insurance_payer_refunds.v_1.update(non_insurance_payer_refund_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def update(non_insurance_payer_refund_id:, refund_timestamp: nil, refund_note: nil, refund_reason: nil,
                   invoice_id: nil, request_options: nil)
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
              refund_timestamp: refund_timestamp,
              refund_note: refund_note,
              refund_reason: refund_reason,
              invoice_id: invoice_id
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/non-insurance-payer-refunds/v1/#{non_insurance_payer_refund_id}"
          end
          CandidApiClient::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefund.from_json(json_object: response.body)
        end

        # Deletes the non-insurance payer refund record matching the provided
        #  `non_insurance_payer_refund_id`.
        #
        # @param non_insurance_payer_refund_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Void]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.non_insurance_payer_refunds.v_1.delete(non_insurance_payer_refund_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def delete(non_insurance_payer_refund_id:, request_options: nil)
          @request_client.conn.delete do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/non-insurance-payer-refunds/v1/#{non_insurance_payer_refund_id}"
          end
        end
      end

      class AsyncV1Client
        # @return [CandidApiClient::AsyncRequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::AsyncRequestClient]
        # @return [CandidApiClient::NonInsurancePayerRefunds::V1::AsyncV1Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # Returns all non-insurance payer refunds satisfying the search criteria
        #
        # @param limit [Integer] Defaults to 100. The value must be greater than 0 and less than 1000.
        # @param non_insurance_payer_id [String]
        # @param check_number [String]
        # @param invoice_id [String]
        # @param sort [CandidApiClient::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefundSortField] Defaults to refund_timestamp
        # @param sort_direction [CandidApiClient::Commons::Types::SortDirection] Sort direction. Defaults to descending order if not provided.
        # @param page_token [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefundsPage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.non_insurance_payer_refunds.v_1.get_multi
        def get_multi(limit: nil, non_insurance_payer_id: nil, check_number: nil, invoice_id: nil, sort: nil,
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
                "non_insurance_payer_id": non_insurance_payer_id,
                "check_number": check_number,
                "invoice_id": invoice_id,
                "sort": sort,
                "sort_direction": sort_direction,
                "page_token": page_token
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/non-insurance-payer-refunds/v1"
            end
            CandidApiClient::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefundsPage.from_json(json_object: response.body)
          end
        end

        # Retrieves a previously created non-insurance payer refund by its
        #  `non_insurance_payer_refund_id`.
        #
        # @param non_insurance_payer_refund_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefund]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.non_insurance_payer_refunds.v_1.get(non_insurance_payer_refund_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get(non_insurance_payer_refund_id:, request_options: nil)
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
                                                 request_options: request_options)}/api/non-insurance-payer-refunds/v1/#{non_insurance_payer_refund_id}"
            end
            CandidApiClient::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefund.from_json(json_object: response.body)
          end
        end

        # Creates a new non-insurance payer refund record and returns the newly created
        #  `NonInsurancePayerRefund` object.
        #  The allocations can describe whether the refund is being applied toward a
        #  specific service line,
        #  claim, or billing provider.
        #
        # @param request [Hash] Request of type CandidApiClient::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefundCreate, as a Hash
        #   * :non_insurance_payer_id (String)
        #   * :invoice_id (String)
        #   * :amount_cents (Integer)
        #   * :refund_timestamp (DateTime)
        #   * :refund_note (String)
        #   * :check_number (String)
        #   * :allocations (Array<CandidApiClient::Financials::Types::AllocationCreate>)
        #   * :refund_reason (CandidApiClient::Financials::Types::RefundReason)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefund]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.non_insurance_payer_refunds.v_1.create(request: { non_insurance_payer_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", amount_cents: 1, allocations: [{ amount_cents: 1 }, { amount_cents: 1 }] })
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
                                                 request_options: request_options)}/api/non-insurance-payer-refunds/v1"
            end
            CandidApiClient::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefund.from_json(json_object: response.body)
          end
        end

        # Updates the non-insurance payer refund record matching the provided
        #  non_insurance_payer_refund_id. If updating the refund amount,
        #  then the allocations must be appropriately updated as well.
        #
        # @param non_insurance_payer_refund_id [String]
        # @param refund_timestamp [DateTime]
        # @param refund_note [CandidApiClient::Financials::Types::NoteUpdate]
        # @param refund_reason [CandidApiClient::Financials::Types::RefundReasonUpdate]
        # @param invoice_id [CandidApiClient::Financials::Types::InvoiceUpdate]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefund]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.non_insurance_payer_refunds.v_1.update(non_insurance_payer_refund_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def update(non_insurance_payer_refund_id:, refund_timestamp: nil, refund_note: nil, refund_reason: nil,
                   invoice_id: nil, request_options: nil)
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
                refund_timestamp: refund_timestamp,
                refund_note: refund_note,
                refund_reason: refund_reason,
                invoice_id: invoice_id
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/non-insurance-payer-refunds/v1/#{non_insurance_payer_refund_id}"
            end
            CandidApiClient::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefund.from_json(json_object: response.body)
          end
        end

        # Deletes the non-insurance payer refund record matching the provided
        #  `non_insurance_payer_refund_id`.
        #
        # @param non_insurance_payer_refund_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Void]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.non_insurance_payer_refunds.v_1.delete(non_insurance_payer_refund_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def delete(non_insurance_payer_refund_id:, request_options: nil)
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
                                                 request_options: request_options)}/api/non-insurance-payer-refunds/v1/#{non_insurance_payer_refund_id}"
            end
          end
        end
      end
    end
  end
end
