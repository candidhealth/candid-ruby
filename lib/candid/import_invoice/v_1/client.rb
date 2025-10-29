# frozen_string_literal: true

module Candid
  module ImportInvoice
    module V1
      class Client
        # @return [Candid::ImportInvoice::V1::Client]
        def initialize(client:)
          @client = client
        end

        # Import an existing invoice from a third party service to reflect state in Candid.
        #
        # @return [Candid::ImportInvoice::V1::Types::ImportInvoice]
        def import_invoice(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "POST",
            path: "/api/import-invoice/v1",
            body: Candid::ImportInvoice::V1::Types::CreateImportInvoiceRequest.new(params).to_h
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::ImportInvoice::V1::Types::ImportInvoice.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Returns all Invoices for the authenticated user's organziation with all filters applied.
        #
        # @return [Candid::ImportInvoice::V1::Types::ImportInvoicesPage]
        def get_multi(request_options: {}, **params)
          params = Candid::Internal::Types::Utils.symbolize_keys(params)
          _query_param_names = %i[patient_external_id encounter_external_id note due_date_before due_date_after status
                                  limit sort sort_direction page_token]
          _query = params.slice(*_query_param_names)
          params.except(*_query_param_names)

          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "GET",
            path: "/api/import-invoice/v1",
            query: _query
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::ImportInvoice::V1::Types::ImportInvoicesPage.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Retrieve and view an import invoice
        #
        # @return [Candid::ImportInvoice::V1::Types::ImportInvoice]
        def get(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "GET",
            path: "/api/import-invoice/v1/#{params[:invoice_id]}"
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::ImportInvoice::V1::Types::ImportInvoice.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Update the information on the imported invoice
        #
        # @return [Candid::ImportInvoice::V1::Types::ImportInvoice]
        def update(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "PATCH",
            path: "/api/import-invoice/v1/#{params[:invoice_id]}",
            body: Candid::ImportInvoice::V1::Types::ImportInvoiceUpdateRequest.new(params).to_h
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::ImportInvoice::V1::Types::ImportInvoice.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end
      end
    end
  end
end
