# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../../financials/types/patient_transaction_source"
require_relative "types/patient_refund_sort_field"
require_relative "../../commons/types/sort_direction"
require_relative "types/patient_refunds_page"
require_relative "types/patient_refund"
require "date"
require_relative "../../financials/types/allocation_create"
require_relative "../../financials/types/refund_reason"
require_relative "../../financials/types/note_update"
require_relative "../../financials/types/invoice_update"
require_relative "../../financials/types/refund_reason_update"
require "async"

module CandidApiClient
  module PatientRefunds
    module V1
      class V1Client
        # @return [CandidApiClient::RequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::RequestClient]
        # @return [CandidApiClient::PatientRefunds::V1::V1Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # Returns all patient refunds satisfying the search criteria AND whose
        #  organization_id matches
        #  the current organization_id of the authenticated user.
        #
        # @param limit [Integer] Defaults to 100. The value must be greater than 0 and less than 1000.
        # @param patient_external_id [String]
        # @param claim_id [String]
        # @param service_line_id [String]
        # @param billing_provider_id [String]
        # @param unattributed [Boolean] returns payments with unattributed allocations if set to true
        # @param invoice_id [String]
        # @param sources [CandidApiClient::Financials::Types::PatientTransactionSource]
        # @param sort [CandidApiClient::PatientRefunds::V1::Types::PatientRefundSortField] Defaults to refund_timestamp
        # @param sort_direction [CandidApiClient::Commons::Types::SortDirection] Sort direction. Defaults to descending order if not provided.
        # @param page_token [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::PatientRefunds::V1::Types::PatientRefundsPage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.patient_refunds.v_1.get_multi(
        #    limit: 1,
        #    patient_external_id: "string",
        #    claim_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    service_line_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    billing_provider_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    unattributed: true,
        #    invoice_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    sources: MANUAL_ENTRY,
        #    sort: REFUND_SOURCE,
        #    sort_direction: ASC,
        #    page_token: "eyJ0b2tlbiI6IjEiLCJwYWdlX3Rva2VuIjoiMiJ9"
        #  )
        def get_multi(limit: nil, patient_external_id: nil, claim_id: nil, service_line_id: nil,
                      billing_provider_id: nil, unattributed: nil, invoice_id: nil, sources: nil, sort: nil, sort_direction: nil, page_token: nil, request_options: nil)
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
              "patient_external_id": patient_external_id,
              "claim_id": claim_id,
              "service_line_id": service_line_id,
              "billing_provider_id": billing_provider_id,
              "unattributed": unattributed,
              "invoice_id": invoice_id,
              "sources": sources,
              "sort": sort,
              "sort_direction": sort_direction,
              "page_token": page_token
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/api/patient-refunds/v1"
          end
          CandidApiClient::PatientRefunds::V1::Types::PatientRefundsPage.from_json(json_object: response.body)
        end

        # Retrieves a previously created patient refund by its `patient_refund_id`.
        #
        # @param patient_refund_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::PatientRefunds::V1::Types::PatientRefund]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.patient_refunds.v_1.get(patient_refund_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get(patient_refund_id:, request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/api/patient-refunds/v1/#{patient_refund_id}"
          end
          CandidApiClient::PatientRefunds::V1::Types::PatientRefund.from_json(json_object: response.body)
        end

        # Creates a new patient refund record and returns the newly created PatientRefund
        #  object.
        #  The allocations can describe whether the refund is being applied toward a
        #  specific service line,
        #  claim, or billing provider.
        #
        # @param amount_cents [Integer]
        # @param refund_timestamp [DateTime]
        # @param refund_note [String]
        # @param patient_external_id [String]
        # @param allocations [Array<Hash>] Request of type Array<CandidApiClient::Financials::Types::AllocationCreate>, as a Hash
        #   * :amount_cents (Integer)
        #   * :target (Hash)
        # @param invoice [String]
        # @param refund_reason [CandidApiClient::Financials::Types::RefundReason]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::PatientRefunds::V1::Types::PatientRefund]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.patient_refunds.v_1.create(
        #    amount_cents: 1,
        #    refund_timestamp: DateTime.parse(2024-01-15T09:30:00.000Z),
        #    refund_note: "string",
        #    patient_external_id: "string",
        #    allocations: [{ amount_cents: 1 }],
        #    invoice: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    refund_reason: OVERCHARGED
        #  )
        def create(amount_cents:, patient_external_id:, allocations:, refund_timestamp: nil, refund_note: nil,
                   invoice: nil, refund_reason: nil, request_options: nil)
          response = @request_client.conn.post do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.body = {
              **(request_options&.additional_body_parameters || {}),
              amount_cents: amount_cents,
              refund_timestamp: refund_timestamp,
              refund_note: refund_note,
              patient_external_id: patient_external_id,
              allocations: allocations,
              invoice: invoice,
              refund_reason: refund_reason
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/api/patient-refunds/v1"
          end
          CandidApiClient::PatientRefunds::V1::Types::PatientRefund.from_json(json_object: response.body)
        end

        # Updates the patient refund record matching the provided patient_refund_id.
        #
        # @param patient_refund_id [String]
        # @param refund_timestamp [DateTime]
        # @param refund_note [CandidApiClient::Financials::Types::NoteUpdate]
        # @param invoice [CandidApiClient::Financials::Types::InvoiceUpdate]
        # @param refund_reason [CandidApiClient::Financials::Types::RefundReasonUpdate]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::PatientRefunds::V1::Types::PatientRefund]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.patient_refunds.v_1.update(patient_refund_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", refund_timestamp: DateTime.parse(2024-01-15T09:30:00.000Z))
        def update(patient_refund_id:, refund_timestamp: nil, refund_note: nil, invoice: nil, refund_reason: nil,
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
              refund_timestamp: refund_timestamp,
              refund_note: refund_note,
              invoice: invoice,
              refund_reason: refund_reason
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/api/patient-refunds/v1/#{patient_refund_id}"
          end
          CandidApiClient::PatientRefunds::V1::Types::PatientRefund.from_json(json_object: response.body)
        end

        # Deletes the patient refund record matching the provided patient_refund_id.
        #
        # @param patient_refund_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Void]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.patient_refunds.v_1.delete(patient_refund_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def delete(patient_refund_id:, request_options: nil)
          @request_client.conn.delete do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(request_options: request_options)}/api/patient-refunds/v1/#{patient_refund_id}"
          end
        end
      end

      class AsyncV1Client
        # @return [CandidApiClient::AsyncRequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::AsyncRequestClient]
        # @return [CandidApiClient::PatientRefunds::V1::AsyncV1Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # Returns all patient refunds satisfying the search criteria AND whose
        #  organization_id matches
        #  the current organization_id of the authenticated user.
        #
        # @param limit [Integer] Defaults to 100. The value must be greater than 0 and less than 1000.
        # @param patient_external_id [String]
        # @param claim_id [String]
        # @param service_line_id [String]
        # @param billing_provider_id [String]
        # @param unattributed [Boolean] returns payments with unattributed allocations if set to true
        # @param invoice_id [String]
        # @param sources [CandidApiClient::Financials::Types::PatientTransactionSource]
        # @param sort [CandidApiClient::PatientRefunds::V1::Types::PatientRefundSortField] Defaults to refund_timestamp
        # @param sort_direction [CandidApiClient::Commons::Types::SortDirection] Sort direction. Defaults to descending order if not provided.
        # @param page_token [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::PatientRefunds::V1::Types::PatientRefundsPage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.patient_refunds.v_1.get_multi(
        #    limit: 1,
        #    patient_external_id: "string",
        #    claim_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    service_line_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    billing_provider_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    unattributed: true,
        #    invoice_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    sources: MANUAL_ENTRY,
        #    sort: REFUND_SOURCE,
        #    sort_direction: ASC,
        #    page_token: "eyJ0b2tlbiI6IjEiLCJwYWdlX3Rva2VuIjoiMiJ9"
        #  )
        def get_multi(limit: nil, patient_external_id: nil, claim_id: nil, service_line_id: nil,
                      billing_provider_id: nil, unattributed: nil, invoice_id: nil, sources: nil, sort: nil, sort_direction: nil, page_token: nil, request_options: nil)
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
                "patient_external_id": patient_external_id,
                "claim_id": claim_id,
                "service_line_id": service_line_id,
                "billing_provider_id": billing_provider_id,
                "unattributed": unattributed,
                "invoice_id": invoice_id,
                "sources": sources,
                "sort": sort,
                "sort_direction": sort_direction,
                "page_token": page_token
              }.compact
              req.url "#{@request_client.get_url(request_options: request_options)}/api/patient-refunds/v1"
            end
            CandidApiClient::PatientRefunds::V1::Types::PatientRefundsPage.from_json(json_object: response.body)
          end
        end

        # Retrieves a previously created patient refund by its `patient_refund_id`.
        #
        # @param patient_refund_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::PatientRefunds::V1::Types::PatientRefund]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.patient_refunds.v_1.get(patient_refund_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get(patient_refund_id:, request_options: nil)
          Async do
            response = @request_client.conn.get do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.url "#{@request_client.get_url(request_options: request_options)}/api/patient-refunds/v1/#{patient_refund_id}"
            end
            CandidApiClient::PatientRefunds::V1::Types::PatientRefund.from_json(json_object: response.body)
          end
        end

        # Creates a new patient refund record and returns the newly created PatientRefund
        #  object.
        #  The allocations can describe whether the refund is being applied toward a
        #  specific service line,
        #  claim, or billing provider.
        #
        # @param amount_cents [Integer]
        # @param refund_timestamp [DateTime]
        # @param refund_note [String]
        # @param patient_external_id [String]
        # @param allocations [Array<Hash>] Request of type Array<CandidApiClient::Financials::Types::AllocationCreate>, as a Hash
        #   * :amount_cents (Integer)
        #   * :target (Hash)
        # @param invoice [String]
        # @param refund_reason [CandidApiClient::Financials::Types::RefundReason]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::PatientRefunds::V1::Types::PatientRefund]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.patient_refunds.v_1.create(
        #    amount_cents: 1,
        #    refund_timestamp: DateTime.parse(2024-01-15T09:30:00.000Z),
        #    refund_note: "string",
        #    patient_external_id: "string",
        #    allocations: [{ amount_cents: 1 }],
        #    invoice: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    refund_reason: OVERCHARGED
        #  )
        def create(amount_cents:, patient_external_id:, allocations:, refund_timestamp: nil, refund_note: nil,
                   invoice: nil, refund_reason: nil, request_options: nil)
          Async do
            response = @request_client.conn.post do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = {
                **(request_options&.additional_body_parameters || {}),
                amount_cents: amount_cents,
                refund_timestamp: refund_timestamp,
                refund_note: refund_note,
                patient_external_id: patient_external_id,
                allocations: allocations,
                invoice: invoice,
                refund_reason: refund_reason
              }.compact
              req.url "#{@request_client.get_url(request_options: request_options)}/api/patient-refunds/v1"
            end
            CandidApiClient::PatientRefunds::V1::Types::PatientRefund.from_json(json_object: response.body)
          end
        end

        # Updates the patient refund record matching the provided patient_refund_id.
        #
        # @param patient_refund_id [String]
        # @param refund_timestamp [DateTime]
        # @param refund_note [CandidApiClient::Financials::Types::NoteUpdate]
        # @param invoice [CandidApiClient::Financials::Types::InvoiceUpdate]
        # @param refund_reason [CandidApiClient::Financials::Types::RefundReasonUpdate]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::PatientRefunds::V1::Types::PatientRefund]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.patient_refunds.v_1.update(patient_refund_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", refund_timestamp: DateTime.parse(2024-01-15T09:30:00.000Z))
        def update(patient_refund_id:, refund_timestamp: nil, refund_note: nil, invoice: nil, refund_reason: nil,
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
                refund_timestamp: refund_timestamp,
                refund_note: refund_note,
                invoice: invoice,
                refund_reason: refund_reason
              }.compact
              req.url "#{@request_client.get_url(request_options: request_options)}/api/patient-refunds/v1/#{patient_refund_id}"
            end
            CandidApiClient::PatientRefunds::V1::Types::PatientRefund.from_json(json_object: response.body)
          end
        end

        # Deletes the patient refund record matching the provided patient_refund_id.
        #
        # @param patient_refund_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Void]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.patient_refunds.v_1.delete(patient_refund_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def delete(patient_refund_id:, request_options: nil)
          Async do
            @request_client.conn.delete do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.url "#{@request_client.get_url(request_options: request_options)}/api/patient-refunds/v1/#{patient_refund_id}"
            end
          end
        end
      end
    end
  end
end
