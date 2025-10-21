
module Candid
  module BillingNotes
    module V2
      class Client
        # @return [Candid::BillingNotes::V2::Client]
        def initialize(client:)
          @client = client
        end

        # @return [Candid::BillingNotes::V2::Types::BillingNote]
        def create(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::BillingNotes::V2::Types::BillingNote.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [untyped]
        def delete(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return
          else
            raise _response.body
          end
        end

        # @return [Candid::BillingNotes::V2::Types::BillingNote]
        def update(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::BillingNotes::V2::Types::BillingNote.load(_response.body)
          else
            raise _response.body
          end
        end

      end
    end
  end
end
