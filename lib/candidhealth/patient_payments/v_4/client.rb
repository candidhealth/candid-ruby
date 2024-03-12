# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../../commons/types/patient_external_id"
require_relative "../../commons/types/claim_id"
require_relative "../../commons/types/service_line_id"
require_relative "../../commons/types/provider_id"
require_relative "../../commons/types/invoice_id"
require_relative "../../financials/types/patient_transaction_source"
require_relative "types/patient_payment_sort_field"
require_relative "../../commons/types/sort_direction"
require_relative "../../commons/types/page_token"
require_relative "types/patient_payments_page"
require_relative "types/patient_payment_id"
require_relative "types/patient_payment"
require "date"
require_relative "../../financials/types/allocation_create"
require_relative "../../financials/types/note_update"
require_relative "../../financials/types/invoice_update"
require "async"

module CandidApiClient
  module PatientPayments
    module V4
      class V4Client
        attr_reader :request_client

        # @param request_client [RequestClient]
        # @return [PatientPayments::V4::V4Client]
        def initialize(request_client:)
          # @type [RequestClient]
          @request_client = request_client
        end

        # Returns all patient payments satisfying the search criteria AND whose organization_id matches
        # the current organization_id of the authenticated user.
        #
        # @param limit [Integer] Defaults to 100. The value must be greater than 0 and less than 1000.
        # @param patient_external_id [Commons::PATIENT_EXTERNAL_ID]
        # @param claim_id [Commons::CLAIM_ID]
        # @param service_line_id [Commons::SERVICE_LINE_ID]
        # @param billing_provider_id [Commons::PROVIDER_ID]
        # @param unattributed [Boolean] returns payments with unattributed allocations if set to true
        # @param invoice_id [Commons::INVOICE_ID]
        # @param sources [Financials::PatientTransactionSource]
        # @param sort [PatientPayments::V4::PatientPaymentSortField] Defaults to payment_timestamp
        # @param sort_direction [Commons::SortDirection] Sort direction. Defaults to descending order if not provided.
        # @param page_token [Commons::PAGE_TOKEN]
        # @param request_options [RequestOptions]
        # @return [PatientPayments::V4::PatientPaymentsPage]
        def get_multi(limit: nil, patient_external_id: nil, claim_id: nil, service_line_id: nil,
                      billing_provider_id: nil, unattributed: nil, invoice_id: nil, sources: nil, sort: nil, sort_direction: nil, page_token: nil, request_options: nil)
          response = @request_client.conn.get("/api/patient-payments/v4") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
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
          end
          PatientPayments::V4::PatientPaymentsPage.from_json(json_object: response.body)
        end

        # Retrieves a previously created patient payment by its `patient_payment_id`.
        #
        # @param patient_payment_id [PatientPayments::V4::PATIENT_PAYMENT_ID]
        # @param request_options [RequestOptions]
        # @return [PatientPayments::V4::PatientPayment]
        def get(patient_payment_id:, request_options: nil)
          response = @request_client.conn.get("/api/patient-payments/v4/#{patient_payment_id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
          PatientPayments::V4::PatientPayment.from_json(json_object: response.body)
        end

        # Creates a new patient payment record and returns the newly created PatientPayment object.
        # The allocations can describe whether the payment is being applied toward a specific service line,
        # claim, or billing provider.
        #
        # @param amount_cents [Integer]
        # @param payment_timestamp [DateTime]
        # @param payment_note [String]
        # @param patient_external_id [Commons::PATIENT_EXTERNAL_ID]
        # @param allocations [Array<Hash>] Request of type Array<Financials::AllocationCreate>, as a Hash
        #   * :amount_cents (Integer)
        #   * :target (Hash)
        # @param invoice [Commons::INVOICE_ID]
        # @param request_options [RequestOptions]
        # @return [PatientPayments::V4::PatientPayment]
        def create(amount_cents:, patient_external_id:, allocations:, payment_timestamp: nil, payment_note: nil,
                   invoice: nil, request_options: nil)
          response = @request_client.conn.post("/api/patient-payments/v4") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = {
              **(request_options&.additional_body_parameters || {}),
              amount_cents: amount_cents,
              payment_timestamp: payment_timestamp,
              payment_note: payment_note,
              patient_external_id: patient_external_id,
              allocations: allocations,
              invoice: invoice
            }.compact
          end
          PatientPayments::V4::PatientPayment.from_json(json_object: response.body)
        end

        # Updates the patient payment record matching the provided patient_payment_id.
        #
        # @param patient_payment_id [PatientPayments::V4::PATIENT_PAYMENT_ID]
        # @param payment_timestamp [DateTime]
        # @param payment_note [Financials::NoteUpdate]
        # @param invoice [Financials::InvoiceUpdate]
        # @param request_options [RequestOptions]
        # @return [PatientPayments::V4::PatientPayment]
        def update(patient_payment_id:, payment_timestamp: nil, payment_note: nil, invoice: nil, request_options: nil)
          response = @request_client.conn.patch("/api/patient-payments/v4/#{patient_payment_id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = {
              **(request_options&.additional_body_parameters || {}),
              payment_timestamp: payment_timestamp,
              payment_note: payment_note,
              invoice: invoice
            }.compact
          end
          PatientPayments::V4::PatientPayment.from_json(json_object: response.body)
        end

        # Deletes the patient payment record matching the provided patient_payment_id.
        #
        # @param patient_payment_id [PatientPayments::V4::PATIENT_PAYMENT_ID]
        # @param request_options [RequestOptions]
        # @return [Void]
        def delete(patient_payment_id:, request_options: nil)
          @request_client.conn.delete("/api/patient-payments/v4/#{patient_payment_id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
        end
      end

      class AsyncV4Client
        attr_reader :request_client

        # @param request_client [AsyncRequestClient]
        # @return [PatientPayments::V4::AsyncV4Client]
        def initialize(request_client:)
          # @type [AsyncRequestClient]
          @request_client = request_client
        end

        # Returns all patient payments satisfying the search criteria AND whose organization_id matches
        # the current organization_id of the authenticated user.
        #
        # @param limit [Integer] Defaults to 100. The value must be greater than 0 and less than 1000.
        # @param patient_external_id [Commons::PATIENT_EXTERNAL_ID]
        # @param claim_id [Commons::CLAIM_ID]
        # @param service_line_id [Commons::SERVICE_LINE_ID]
        # @param billing_provider_id [Commons::PROVIDER_ID]
        # @param unattributed [Boolean] returns payments with unattributed allocations if set to true
        # @param invoice_id [Commons::INVOICE_ID]
        # @param sources [Financials::PatientTransactionSource]
        # @param sort [PatientPayments::V4::PatientPaymentSortField] Defaults to payment_timestamp
        # @param sort_direction [Commons::SortDirection] Sort direction. Defaults to descending order if not provided.
        # @param page_token [Commons::PAGE_TOKEN]
        # @param request_options [RequestOptions]
        # @return [PatientPayments::V4::PatientPaymentsPage]
        def get_multi(limit: nil, patient_external_id: nil, claim_id: nil, service_line_id: nil,
                      billing_provider_id: nil, unattributed: nil, invoice_id: nil, sources: nil, sort: nil, sort_direction: nil, page_token: nil, request_options: nil)
          Async do
            response = @request_client.conn.get("/api/patient-payments/v4") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
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
            end
            PatientPayments::V4::PatientPaymentsPage.from_json(json_object: response.body)
          end
        end

        # Retrieves a previously created patient payment by its `patient_payment_id`.
        #
        # @param patient_payment_id [PatientPayments::V4::PATIENT_PAYMENT_ID]
        # @param request_options [RequestOptions]
        # @return [PatientPayments::V4::PatientPayment]
        def get(patient_payment_id:, request_options: nil)
          Async do
            response = @request_client.conn.get("/api/patient-payments/v4/#{patient_payment_id}") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            end
            PatientPayments::V4::PatientPayment.from_json(json_object: response.body)
          end
        end

        # Creates a new patient payment record and returns the newly created PatientPayment object.
        # The allocations can describe whether the payment is being applied toward a specific service line,
        # claim, or billing provider.
        #
        # @param amount_cents [Integer]
        # @param payment_timestamp [DateTime]
        # @param payment_note [String]
        # @param patient_external_id [Commons::PATIENT_EXTERNAL_ID]
        # @param allocations [Array<Hash>] Request of type Array<Financials::AllocationCreate>, as a Hash
        #   * :amount_cents (Integer)
        #   * :target (Hash)
        # @param invoice [Commons::INVOICE_ID]
        # @param request_options [RequestOptions]
        # @return [PatientPayments::V4::PatientPayment]
        def create(amount_cents:, patient_external_id:, allocations:, payment_timestamp: nil, payment_note: nil,
                   invoice: nil, request_options: nil)
          Async do
            response = @request_client.conn.post("/api/patient-payments/v4") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
              req.body = {
                **(request_options&.additional_body_parameters || {}),
                amount_cents: amount_cents,
                payment_timestamp: payment_timestamp,
                payment_note: payment_note,
                patient_external_id: patient_external_id,
                allocations: allocations,
                invoice: invoice
              }.compact
            end
            PatientPayments::V4::PatientPayment.from_json(json_object: response.body)
          end
        end

        # Updates the patient payment record matching the provided patient_payment_id.
        #
        # @param patient_payment_id [PatientPayments::V4::PATIENT_PAYMENT_ID]
        # @param payment_timestamp [DateTime]
        # @param payment_note [Financials::NoteUpdate]
        # @param invoice [Financials::InvoiceUpdate]
        # @param request_options [RequestOptions]
        # @return [PatientPayments::V4::PatientPayment]
        def update(patient_payment_id:, payment_timestamp: nil, payment_note: nil, invoice: nil, request_options: nil)
          Async do
            response = @request_client.conn.patch("/api/patient-payments/v4/#{patient_payment_id}") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
              req.body = {
                **(request_options&.additional_body_parameters || {}),
                payment_timestamp: payment_timestamp,
                payment_note: payment_note,
                invoice: invoice
              }.compact
            end
            PatientPayments::V4::PatientPayment.from_json(json_object: response.body)
          end
        end

        # Deletes the patient payment record matching the provided patient_payment_id.
        #
        # @param patient_payment_id [PatientPayments::V4::PATIENT_PAYMENT_ID]
        # @param request_options [RequestOptions]
        # @return [Void]
        def delete(patient_payment_id:, request_options: nil)
          Async do
            @request_client.conn.delete("/api/patient-payments/v4/#{patient_payment_id}") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            end
          end
        end
      end
    end
  end
end
