
module Candid
  module PatientAr
    module V1
      class Client
        # @return [Candid::PatientAr::V1::Client]
        def initialize(client:)
          @client = client
        end

        # NOTE: This service is in-development and can only be used by select partners. Please contact Candid Health to request access.
        # 
        # Retrieve a list of inventory records based on the provided filters. Each inventory record provides the latest invoiceable status of the associated claim.
        # The response is paginated, and the `page_token` can be used to retrieve subsequent pages. Initial requests should not include `page_token`.
        #
        # @return [Candid::PatientAr::V1::Types::ListInventoryPagedResponse]
        def list_inventory(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::PatientAr::V1::Types::ListInventoryPagedResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # NOTE: This service is in-development and can only be used by select partners. Please contact Candid Health to request access.
        # 
        # Provides detailed itemization of invoice data for a specific claim.
        #
        # @return [Candid::PatientAr::V1::Types::InvoiceItemizationResponse]
        def itemize(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::PatientAr::V1::Types::InvoiceItemizationResponse.load(_response.body)
          else
            raise _response.body
          end
        end

      end
    end
  end
end
