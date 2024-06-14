# frozen_string_literal: true

require_relative "../../../requests"
require_relative "types/create_import_invoice_request"
require_relative "types/import_invoice"
require_relative "../../commons/types/invoice_id"
require_relative "types/import_invoice_update_request"
require "async"

module CandidApiClient
  module ImportInvoice
    module V1
      class V1Client
        attr_reader :request_client

        # @param request_client [RequestClient]
        # @return [ImportInvoice::V1::V1Client]
        def initialize(request_client:)
          # @type [RequestClient]
          @request_client = request_client
        end

        # Import an existing invoice from a third party service to reflect state in Candid.
        #
        # @param request [Hash] Request of type ImportInvoice::V1::CreateImportInvoiceRequest, as a Hash
        #   * :patient_external_id (Commons::PATIENT_EXTERNAL_ID)
        #   * :external_customer_identifier (String)
        #   * :note (String)
        #   * :due_date (Date)
        #   * :items (Array<Invoices::V2::InvoiceItemCreate>)
        #   * :status (Invoices::V2::InvoiceStatus)
        #   * :external_identifier (String)
        #   * :customer_invoice_url (String)
        # @param request_options [RequestOptions]
        # @return [ImportInvoice::V1::ImportInvoice]
        def import_invoice(request:, request_options: nil)
          response = @request_client.conn.post("/api/import-invoice/v1") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
          end
          ImportInvoice::V1::ImportInvoice.from_json(json_object: response.body)
        end

        # Retrieve and view an import invoice
        #
        # @param invoice_id [Commons::INVOICE_ID] InvoiceId to be returned
        # @param request_options [RequestOptions]
        # @return [ImportInvoice::V1::ImportInvoice]
        def get(invoice_id:, request_options: nil)
          response = @request_client.conn.get("/api/import-invoice/v1/#{invoice_id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
          ImportInvoice::V1::ImportInvoice.from_json(json_object: response.body)
        end

        # Update the information on the imported invoice
        #
        # @param invoice_id [Commons::INVOICE_ID]
        # @param request [Hash] Request of type ImportInvoice::V1::ImportInvoiceUpdateRequest, as a Hash
        #   * :customer_invoice_url (String)
        #   * :status (Invoices::V2::InvoiceStatus)
        #   * :note (String)
        #   * :due_date (Date)
        #   * :items (Hash)
        #     * :update_type (ImportInvoice::V1::InvoiceItemUpdateType)
        #     * :items (Array<Invoices::V2::InvoiceItemCreate>)
        # @param request_options [RequestOptions]
        # @return [ImportInvoice::V1::ImportInvoice]
        def update(invoice_id:, request:, request_options: nil)
          response = @request_client.conn.patch("/api/import-invoice/v1/#{invoice_id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
          end
          ImportInvoice::V1::ImportInvoice.from_json(json_object: response.body)
        end
      end

      class AsyncV1Client
        attr_reader :request_client

        # @param request_client [AsyncRequestClient]
        # @return [ImportInvoice::V1::AsyncV1Client]
        def initialize(request_client:)
          # @type [AsyncRequestClient]
          @request_client = request_client
        end

        # Import an existing invoice from a third party service to reflect state in Candid.
        #
        # @param request [Hash] Request of type ImportInvoice::V1::CreateImportInvoiceRequest, as a Hash
        #   * :patient_external_id (Commons::PATIENT_EXTERNAL_ID)
        #   * :external_customer_identifier (String)
        #   * :note (String)
        #   * :due_date (Date)
        #   * :items (Array<Invoices::V2::InvoiceItemCreate>)
        #   * :status (Invoices::V2::InvoiceStatus)
        #   * :external_identifier (String)
        #   * :customer_invoice_url (String)
        # @param request_options [RequestOptions]
        # @return [ImportInvoice::V1::ImportInvoice]
        def import_invoice(request:, request_options: nil)
          Async do
            response = @request_client.conn.post("/api/import-invoice/v1") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            end
            ImportInvoice::V1::ImportInvoice.from_json(json_object: response.body)
          end
        end

        # Retrieve and view an import invoice
        #
        # @param invoice_id [Commons::INVOICE_ID] InvoiceId to be returned
        # @param request_options [RequestOptions]
        # @return [ImportInvoice::V1::ImportInvoice]
        def get(invoice_id:, request_options: nil)
          Async do
            response = @request_client.conn.get("/api/import-invoice/v1/#{invoice_id}") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            end
            ImportInvoice::V1::ImportInvoice.from_json(json_object: response.body)
          end
        end

        # Update the information on the imported invoice
        #
        # @param invoice_id [Commons::INVOICE_ID]
        # @param request [Hash] Request of type ImportInvoice::V1::ImportInvoiceUpdateRequest, as a Hash
        #   * :customer_invoice_url (String)
        #   * :status (Invoices::V2::InvoiceStatus)
        #   * :note (String)
        #   * :due_date (Date)
        #   * :items (Hash)
        #     * :update_type (ImportInvoice::V1::InvoiceItemUpdateType)
        #     * :items (Array<Invoices::V2::InvoiceItemCreate>)
        # @param request_options [RequestOptions]
        # @return [ImportInvoice::V1::ImportInvoice]
        def update(invoice_id:, request:, request_options: nil)
          Async do
            response = @request_client.conn.patch("/api/import-invoice/v1/#{invoice_id}") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            end
            ImportInvoice::V1::ImportInvoice.from_json(json_object: response.body)
          end
        end
      end
    end
  end
end
