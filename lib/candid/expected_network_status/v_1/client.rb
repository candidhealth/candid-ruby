
module Candid
  module ExpectedNetworkStatus
    module V1
      class Client
        # @return [Candid::ExpectedNetworkStatus::V1::Client]
        def initialize(client:)
          @client = client
        end

        # Computes the expected network status given the provided information.
        #
        # @return [Candid::ExpectedNetworkStatus::V1::Types::ExpectedNetworkStatusResponse]
        def compute(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::ExpectedNetworkStatus::V1::Types::ExpectedNetworkStatusResponse.load(_response.body)
          else
            raise _response.body
          end
        end

      end
    end
  end
end
