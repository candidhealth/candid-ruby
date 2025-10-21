
module Candid
  module Contracts
    module V2
      class Client
        # @return [Candid::Contracts::V2::Client]
        def initialize(client:)
          @client = client
        end

        # @return [Candid::Contracts::V2::Types::ContractWithProviders]
        def get(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::Contracts::V2::Types::ContractWithProviders.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [Candid::Contracts::V2::Types::ContractsPage]
        def get_multi(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::Contracts::V2::Types::ContractsPage.load(_response.body)
          else
            raise _response.body
          end
        end

        # Creates a new contract within the user's current organization
        #
        # @return [Candid::Contracts::V2::Types::ContractWithProviders]
        def create(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::Contracts::V2::Types::ContractWithProviders.load(_response.body)
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

        # @return [Candid::Contracts::V2::Types::ContractWithProviders]
        def update(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::Contracts::V2::Types::ContractWithProviders.load(_response.body)
          else
            raise _response.body
          end
        end

      end
    end
  end
end
