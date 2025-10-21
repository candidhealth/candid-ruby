
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
            method: POST,
            path: "/api/import-invoice/v1",
            body: Candid::ImportInvoice::V1::Types::CreateImportInvoiceRequest.new(params[:request]).to_h,
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::ImportInvoice::V1::Types::ImportInvoice.load(_response.body)
          else
            raise _response.body
          end
        end

        # Returns all Invoices for the authenticated user's organziation with all filters applied.
        #
        # @return [Candid::ImportInvoice::V1::Types::ImportInvoicesPage]
        def get_multi(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::ImportInvoice::V1::Types::ImportInvoicesPage.load(_response.body)
          else
            raise _response.body
          end
        end

        # Retrieve and view an import invoice
        #
        # @return [Candid::ImportInvoice::V1::Types::ImportInvoice]
        def get(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::ImportInvoice::V1::Types::ImportInvoice.load(_response.body)
          else
            raise _response.body
          end
        end

        # Update the information on the imported invoice
        #
        # @return [Candid::ImportInvoice::V1::Types::ImportInvoice]
        def update(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            method: PATCH,
            path: "/api/import-invoice/v1/#{params[:invoice_id]}",
            body: Candid::ImportInvoice::V1::Types::ImportInvoiceUpdateRequest.new(params[:request]).to_h,
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::ImportInvoice::V1::Types::ImportInvoice.load(_response.body)
          else
            raise _response.body
          end
        end

      end
    end
  end
end
