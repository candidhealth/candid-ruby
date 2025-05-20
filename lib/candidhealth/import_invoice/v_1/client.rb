# frozen_string_literal: true

require_relative "../../../requests"
require_relative "types/create_import_invoice_request"
require_relative "types/import_invoice"
require "date"
require_relative "../../invoices/v_2/types/invoice_status"
require_relative "../../invoices/v_2/types/invoice_sort_field"
require_relative "../../commons/types/sort_direction"
require_relative "types/import_invoices_page"
require_relative "types/import_invoice_update_request"
require "async"

module CandidApiClient
  module ImportInvoice
    module V1
      class V1Client
        # @return [CandidApiClient::RequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::RequestClient]
        # @return [CandidApiClient::ImportInvoice::V1::V1Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # Import an existing invoice from a third party service to reflect state in
        #  Candid.
        #
        # @param request [Hash] Request of type CandidApiClient::ImportInvoice::V1::Types::CreateImportInvoiceRequest, as a Hash
        #   * :external_payment_account_config_id (String)
        #   * :patient_external_id (String)
        #   * :external_customer_identifier (String)
        #   * :note (String)
        #   * :due_date (Date)
        #   * :items (Array<CandidApiClient::Invoices::V2::Types::InvoiceItemCreate>)
        #   * :status (CandidApiClient::Invoices::V2::Types::InvoiceStatus)
        #   * :external_identifier (String)
        #   * :customer_invoice_url (String)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ImportInvoice::V1::Types::ImportInvoice]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.import_invoice.v_1.import_invoice(request: { external_payment_account_config_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", patient_external_id: "patient_external_id", external_customer_identifier: "external_customer_identifier", items: [{ amount_cents: 1 }, { amount_cents: 1 }], status: DRAFT, external_identifier: "external_identifier" })
        def import_invoice(request:, request_options: nil)
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
                                               request_options: request_options)}/api/import-invoice/v1"
          end
          CandidApiClient::ImportInvoice::V1::Types::ImportInvoice.from_json(json_object: response.body)
        end

        # Returns all Invoices for the authenticated user's organziation with all filters
        #  applied.
        #
        # @param patient_external_id [String]
        # @param encounter_external_id [String]
        # @param note [String] partial match supported
        # @param due_date_before [Date] all invoices whose due date is before this due date, not inclusive
        # @param due_date_after [Date] all invoices whose due date is after this due date, not inclusive
        # @param status [CandidApiClient::Invoices::V2::Types::InvoiceStatus] all invoices that match any of the provided statuses
        # @param limit [Integer] Defaults to 100
        # @param sort [CandidApiClient::Invoices::V2::Types::InvoiceSortField] Defaults to created_at
        # @param sort_direction [CandidApiClient::Commons::Types::SortDirection] Sort direction. Defaults to descending order
        # @param page_token [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ImportInvoice::V1::Types::ImportInvoicesPage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.import_invoice.v_1.get_multi
        def get_multi(patient_external_id: nil, encounter_external_id: nil, note: nil, due_date_before: nil,
                      due_date_after: nil, status: nil, limit: nil, sort: nil, sort_direction: nil, page_token: nil, request_options: nil)
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
              "patient_external_id": patient_external_id,
              "encounter_external_id": encounter_external_id,
              "note": note,
              "due_date_before": due_date_before,
              "due_date_after": due_date_after,
              "status": status,
              "limit": limit,
              "sort": sort,
              "sort_direction": sort_direction,
              "page_token": page_token
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/import-invoice/v1"
          end
          CandidApiClient::ImportInvoice::V1::Types::ImportInvoicesPage.from_json(json_object: response.body)
        end

        # Retrieve and view an import invoice
        #
        # @param invoice_id [String] InvoiceId to be returned
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ImportInvoice::V1::Types::ImportInvoice]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.import_invoice.v_1.get(invoice_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get(invoice_id:, request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/import-invoice/v1/#{invoice_id}"
          end
          CandidApiClient::ImportInvoice::V1::Types::ImportInvoice.from_json(json_object: response.body)
        end

        # Update the information on the imported invoice
        #
        # @param invoice_id [String]
        # @param request [Hash] Request of type CandidApiClient::ImportInvoice::V1::Types::ImportInvoiceUpdateRequest, as a Hash
        #   * :customer_invoice_url (String)
        #   * :status (CandidApiClient::Invoices::V2::Types::InvoiceStatus)
        #   * :note (String)
        #   * :due_date (Date)
        #   * :items (Hash)
        #     * :update_type (CandidApiClient::ImportInvoice::V1::Types::InvoiceItemUpdateType)
        #     * :items (Array<CandidApiClient::Invoices::V2::Types::InvoiceItemCreate>)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ImportInvoice::V1::Types::ImportInvoice]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.import_invoice.v_1.update(invoice_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: {  })
        def update(invoice_id:, request:, request_options: nil)
          response = @request_client.conn.patch do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/import-invoice/v1/#{invoice_id}"
          end
          CandidApiClient::ImportInvoice::V1::Types::ImportInvoice.from_json(json_object: response.body)
        end
      end

      class AsyncV1Client
        # @return [CandidApiClient::AsyncRequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::AsyncRequestClient]
        # @return [CandidApiClient::ImportInvoice::V1::AsyncV1Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # Import an existing invoice from a third party service to reflect state in
        #  Candid.
        #
        # @param request [Hash] Request of type CandidApiClient::ImportInvoice::V1::Types::CreateImportInvoiceRequest, as a Hash
        #   * :external_payment_account_config_id (String)
        #   * :patient_external_id (String)
        #   * :external_customer_identifier (String)
        #   * :note (String)
        #   * :due_date (Date)
        #   * :items (Array<CandidApiClient::Invoices::V2::Types::InvoiceItemCreate>)
        #   * :status (CandidApiClient::Invoices::V2::Types::InvoiceStatus)
        #   * :external_identifier (String)
        #   * :customer_invoice_url (String)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ImportInvoice::V1::Types::ImportInvoice]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.import_invoice.v_1.import_invoice(request: { external_payment_account_config_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", patient_external_id: "patient_external_id", external_customer_identifier: "external_customer_identifier", items: [{ amount_cents: 1 }, { amount_cents: 1 }], status: DRAFT, external_identifier: "external_identifier" })
        def import_invoice(request:, request_options: nil)
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
                                                 request_options: request_options)}/api/import-invoice/v1"
            end
            CandidApiClient::ImportInvoice::V1::Types::ImportInvoice.from_json(json_object: response.body)
          end
        end

        # Returns all Invoices for the authenticated user's organziation with all filters
        #  applied.
        #
        # @param patient_external_id [String]
        # @param encounter_external_id [String]
        # @param note [String] partial match supported
        # @param due_date_before [Date] all invoices whose due date is before this due date, not inclusive
        # @param due_date_after [Date] all invoices whose due date is after this due date, not inclusive
        # @param status [CandidApiClient::Invoices::V2::Types::InvoiceStatus] all invoices that match any of the provided statuses
        # @param limit [Integer] Defaults to 100
        # @param sort [CandidApiClient::Invoices::V2::Types::InvoiceSortField] Defaults to created_at
        # @param sort_direction [CandidApiClient::Commons::Types::SortDirection] Sort direction. Defaults to descending order
        # @param page_token [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ImportInvoice::V1::Types::ImportInvoicesPage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.import_invoice.v_1.get_multi
        def get_multi(patient_external_id: nil, encounter_external_id: nil, note: nil, due_date_before: nil,
                      due_date_after: nil, status: nil, limit: nil, sort: nil, sort_direction: nil, page_token: nil, request_options: nil)
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
                "patient_external_id": patient_external_id,
                "encounter_external_id": encounter_external_id,
                "note": note,
                "due_date_before": due_date_before,
                "due_date_after": due_date_after,
                "status": status,
                "limit": limit,
                "sort": sort,
                "sort_direction": sort_direction,
                "page_token": page_token
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/import-invoice/v1"
            end
            CandidApiClient::ImportInvoice::V1::Types::ImportInvoicesPage.from_json(json_object: response.body)
          end
        end

        # Retrieve and view an import invoice
        #
        # @param invoice_id [String] InvoiceId to be returned
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ImportInvoice::V1::Types::ImportInvoice]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.import_invoice.v_1.get(invoice_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get(invoice_id:, request_options: nil)
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
                                                 request_options: request_options)}/api/import-invoice/v1/#{invoice_id}"
            end
            CandidApiClient::ImportInvoice::V1::Types::ImportInvoice.from_json(json_object: response.body)
          end
        end

        # Update the information on the imported invoice
        #
        # @param invoice_id [String]
        # @param request [Hash] Request of type CandidApiClient::ImportInvoice::V1::Types::ImportInvoiceUpdateRequest, as a Hash
        #   * :customer_invoice_url (String)
        #   * :status (CandidApiClient::Invoices::V2::Types::InvoiceStatus)
        #   * :note (String)
        #   * :due_date (Date)
        #   * :items (Hash)
        #     * :update_type (CandidApiClient::ImportInvoice::V1::Types::InvoiceItemUpdateType)
        #     * :items (Array<CandidApiClient::Invoices::V2::Types::InvoiceItemCreate>)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ImportInvoice::V1::Types::ImportInvoice]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.import_invoice.v_1.update(invoice_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: {  })
        def update(invoice_id:, request:, request_options: nil)
          Async do
            response = @request_client.conn.patch do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/import-invoice/v1/#{invoice_id}"
            end
            CandidApiClient::ImportInvoice::V1::Types::ImportInvoice.from_json(json_object: response.body)
          end
        end
      end
    end
  end
end
