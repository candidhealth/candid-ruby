
module Candid
  module ExternalPaymentAccountConfig
    module V1
      class Client
        # @return [Candid::ExternalPaymentAccountConfig::V1::Client]
        def initialize(client:)
          @client = client
        end

        # @return [Candid::ExternalPaymentAccountConfig::V1::Types::ExternalPaymentAccountConfigPage]
        def get_multi(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::ExternalPaymentAccountConfig::V1::Types::ExternalPaymentAccountConfigPage.load(_response.body)
          else
            raise _response.body
          end
        end

      end
    end
  end
end
