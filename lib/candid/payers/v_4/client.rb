
module Candid
  module Payers
    module V4
      class Client
        # @return [Candid::Payers::V4::Client]
        def initialize(client:)
          @client = client
        end

        # @return [Candid::Payers::V4::Types::Payer]
        def get(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::Payers::V4::Types::Payer.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [Candid::Payers::V4::Types::PayerPage]
        def get_all(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::Payers::V4::Types::PayerPage.load(_response.body)
          else
            raise _response.body
          end
        end

      end
    end
  end
end
