
module Candid
  module Superbills
    module V1
      class Client
        # @return [Candid::Superbills::V1::Client]
        def initialize(client:)
          @client = client
        end

        # @return [Candid::Superbills::V1::Types::SuperbillResponse]
        def create_superbill(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::Superbills::V1::Types::SuperbillResponse.load(_response.body)
          else
            raise _response.body
          end
        end

      end
    end
  end
end
