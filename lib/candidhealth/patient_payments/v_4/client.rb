# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../../financials/types/patient_transaction_source"
require_relative "types/patient_payment_sort_field"
require_relative "../../commons/types/sort_direction"
require_relative "types/patient_payments_page"
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
        # @return [CandidApiClient::RequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::RequestClient]
        # @return [CandidApiClient::PatientPayments::V4::V4Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # Returns all patient payments satisfying the search criteria AND whose
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
        # @param sort [CandidApiClient::PatientPayments::V4::Types::PatientPaymentSortField] Defaults to payment_timestamp
        # @param sort_direction [CandidApiClient::Commons::Types::SortDirection] Sort direction. Defaults to descending order if not provided.
        # @param page_token [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::PatientPayments::V4::Types::PatientPaymentsPage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.patient_payments.v_4.get_multi
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
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/patient-payments/v4"
          end
          CandidApiClient::PatientPayments::V4::Types::PatientPaymentsPage.from_json(json_object: response.body)
        end

        # Retrieves a previously created patient payment by its `patient_payment_id`.
        #
        # @param patient_payment_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::PatientPayments::V4::Types::PatientPayment]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.patient_payments.v_4.get(patient_payment_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get(patient_payment_id:, request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/patient-payments/v4/#{patient_payment_id}"
          end
          CandidApiClient::PatientPayments::V4::Types::PatientPayment.from_json(json_object: response.body)
        end

        # Creates a new patient payment record and returns the newly created
        #  PatientPayment object.
        #  The allocations can describe whether the payment is being applied toward a
        #  specific service line,
        #  claim, or billing provider.
        #
        # @param amount_cents [Integer]
        # @param payment_timestamp [DateTime]
        # @param payment_note [String]
        # @param patient_external_id [String]
        # @param allocations [Array<Hash>] Request of type Array<CandidApiClient::Financials::Types::AllocationCreate>, as a Hash
        #   * :amount_cents (Integer)
        #   * :target (Hash)
        # @param invoice [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::PatientPayments::V4::Types::PatientPayment]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.patient_payments.v_4.create(
        #    amount_cents: 1,
        #    patient_external_id: "patient_external_id",
        #    allocations: [{ amount_cents: 1 }, { amount_cents: 1 }]
        #  )
        def create(amount_cents:, patient_external_id:, allocations:, payment_timestamp: nil, payment_note: nil,
                   invoice: nil, request_options: nil)
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
              payment_timestamp: payment_timestamp,
              payment_note: payment_note,
              patient_external_id: patient_external_id,
              allocations: allocations,
              invoice: invoice
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/patient-payments/v4"
          end
          CandidApiClient::PatientPayments::V4::Types::PatientPayment.from_json(json_object: response.body)
        end

        # Updates the patient payment record matching the provided patient_payment_id.
        #
        # @param patient_payment_id [String]
        # @param payment_timestamp [DateTime]
        # @param payment_note [CandidApiClient::Financials::Types::NoteUpdate]
        # @param invoice [CandidApiClient::Financials::Types::InvoiceUpdate]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::PatientPayments::V4::Types::PatientPayment]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.patient_payments.v_4.update(patient_payment_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def update(patient_payment_id:, payment_timestamp: nil, payment_note: nil, invoice: nil, request_options: nil)
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
              invoice: invoice
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/patient-payments/v4/#{patient_payment_id}"
          end
          CandidApiClient::PatientPayments::V4::Types::PatientPayment.from_json(json_object: response.body)
        end

        # Deletes the patient payment record matching the provided patient_payment_id.
        #
        # @param patient_payment_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Void]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.patient_payments.v_4.delete(patient_payment_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def delete(patient_payment_id:, request_options: nil)
          @request_client.conn.delete do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/patient-payments/v4/#{patient_payment_id}"
          end
        end
      end

      class AsyncV4Client
        # @return [CandidApiClient::AsyncRequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::AsyncRequestClient]
        # @return [CandidApiClient::PatientPayments::V4::AsyncV4Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # Returns all patient payments satisfying the search criteria AND whose
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
        # @param sort [CandidApiClient::PatientPayments::V4::Types::PatientPaymentSortField] Defaults to payment_timestamp
        # @param sort_direction [CandidApiClient::Commons::Types::SortDirection] Sort direction. Defaults to descending order if not provided.
        # @param page_token [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::PatientPayments::V4::Types::PatientPaymentsPage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.patient_payments.v_4.get_multi
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
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/patient-payments/v4"
            end
            CandidApiClient::PatientPayments::V4::Types::PatientPaymentsPage.from_json(json_object: response.body)
          end
        end

        # Retrieves a previously created patient payment by its `patient_payment_id`.
        #
        # @param patient_payment_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::PatientPayments::V4::Types::PatientPayment]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.patient_payments.v_4.get(patient_payment_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get(patient_payment_id:, request_options: nil)
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
                                                 request_options: request_options)}/api/patient-payments/v4/#{patient_payment_id}"
            end
            CandidApiClient::PatientPayments::V4::Types::PatientPayment.from_json(json_object: response.body)
          end
        end

        # Creates a new patient payment record and returns the newly created
        #  PatientPayment object.
        #  The allocations can describe whether the payment is being applied toward a
        #  specific service line,
        #  claim, or billing provider.
        #
        # @param amount_cents [Integer]
        # @param payment_timestamp [DateTime]
        # @param payment_note [String]
        # @param patient_external_id [String]
        # @param allocations [Array<Hash>] Request of type Array<CandidApiClient::Financials::Types::AllocationCreate>, as a Hash
        #   * :amount_cents (Integer)
        #   * :target (Hash)
        # @param invoice [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::PatientPayments::V4::Types::PatientPayment]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.patient_payments.v_4.create(
        #    amount_cents: 1,
        #    patient_external_id: "patient_external_id",
        #    allocations: [{ amount_cents: 1 }, { amount_cents: 1 }]
        #  )
        def create(amount_cents:, patient_external_id:, allocations:, payment_timestamp: nil, payment_note: nil,
                   invoice: nil, request_options: nil)
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
                payment_timestamp: payment_timestamp,
                payment_note: payment_note,
                patient_external_id: patient_external_id,
                allocations: allocations,
                invoice: invoice
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/patient-payments/v4"
            end
            CandidApiClient::PatientPayments::V4::Types::PatientPayment.from_json(json_object: response.body)
          end
        end

        # Updates the patient payment record matching the provided patient_payment_id.
        #
        # @param patient_payment_id [String]
        # @param payment_timestamp [DateTime]
        # @param payment_note [CandidApiClient::Financials::Types::NoteUpdate]
        # @param invoice [CandidApiClient::Financials::Types::InvoiceUpdate]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::PatientPayments::V4::Types::PatientPayment]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.patient_payments.v_4.update(patient_payment_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def update(patient_payment_id:, payment_timestamp: nil, payment_note: nil, invoice: nil, request_options: nil)
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
                invoice: invoice
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/patient-payments/v4/#{patient_payment_id}"
            end
            CandidApiClient::PatientPayments::V4::Types::PatientPayment.from_json(json_object: response.body)
          end
        end

        # Deletes the patient payment record matching the provided patient_payment_id.
        #
        # @param patient_payment_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Void]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.patient_payments.v_4.delete(patient_payment_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def delete(patient_payment_id:, request_options: nil)
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
                                                 request_options: request_options)}/api/patient-payments/v4/#{patient_payment_id}"
            end
          end
        end
      end
    end
  end
end
