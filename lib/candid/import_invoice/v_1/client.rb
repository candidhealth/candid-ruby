# frozen_string_literal: true

module Candid
  module ImportInvoice
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

        # Import an existing invoice from a third party service to reflect state in Candid.
        #
        # @param request_options [Hash]
        # @param params [Candid::ImportInvoice::V1::Types::CreateImportInvoiceRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        #
        # @return [Candid::ImportInvoice::V1::Types::ImportInvoice]
        def import_invoice(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "POST",
            path: "/api/import-invoice/v1",
            body: Candid::ImportInvoice::V1::Types::CreateImportInvoiceRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::ImportInvoice::V1::Types::ImportInvoice.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Returns all Invoices for the authenticated user's organziation with all filters applied.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String, nil] :patient_external_id
        # @option params [String, nil] :encounter_external_id
        # @option params [String, nil] :note
        # @option params [String, nil] :due_date_before
        # @option params [String, nil] :due_date_after
        # @option params [Candid::Invoices::V2::Types::InvoiceStatus, nil] :status
        # @option params [Integer, nil] :limit
        # @option params [Candid::Invoices::V2::Types::InvoiceSortField, nil] :sort
        # @option params [Candid::Commons::Types::SortDirection, nil] :sort_direction
        # @option params [String, nil] :page_token
        #
        # @return [Candid::ImportInvoice::V1::Types::ImportInvoicesPage]
        def get_multi(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[patient_external_id encounter_external_id note due_date_before due_date_after status limit sort sort_direction page_token]
          query_params = {}
          query_params["patient_external_id"] = params[:patient_external_id] if params.key?(:patient_external_id)
          query_params["encounter_external_id"] = params[:encounter_external_id] if params.key?(:encounter_external_id)
          query_params["note"] = params[:note] if params.key?(:note)
          query_params["due_date_before"] = params[:due_date_before] if params.key?(:due_date_before)
          query_params["due_date_after"] = params[:due_date_after] if params.key?(:due_date_after)
          query_params["status"] = params[:status] if params.key?(:status)
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["sort"] = params[:sort] if params.key?(:sort)
          query_params["sort_direction"] = params[:sort_direction] if params.key?(:sort_direction)
          query_params["page_token"] = params[:page_token] if params.key?(:page_token)
          params.except(*query_param_names)

          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "GET",
            path: "/api/import-invoice/v1",
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
            Candid::ImportInvoice::V1::Types::ImportInvoicesPage.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Retrieve and view an import invoice
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::Commons::Types::InvoiceId] :invoice_id
        #
        # @return [Candid::ImportInvoice::V1::Types::ImportInvoice]
        def get(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "GET",
            path: "/api/import-invoice/v1/#{params[:invoice_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::ImportInvoice::V1::Types::ImportInvoice.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Update the information on the imported invoice
        #
        # @param request_options [Hash]
        # @param params [Candid::ImportInvoice::V1::Types::ImportInvoiceUpdateRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Candid::Commons::Types::InvoiceId] :invoice_id
        #
        # @return [Candid::ImportInvoice::V1::Types::ImportInvoice]
        def update(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.normalize_keys(params)
          request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:candid_api),
            method: "PATCH",
            path: "/api/import-invoice/v1/#{params[:invoice_id]}",
            body: Candid::ImportInvoice::V1::Types::ImportInvoiceUpdateRequest.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Candid::ImportInvoice::V1::Types::ImportInvoice.load(response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
