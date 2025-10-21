
module Candid
  module Credentialing
    module V2
      class Client
        # @return [Candid::Credentialing::V2::Client]
        def initialize(client:)
          @client = client
        end

        # @return [Candid::Credentialing::V2::Types::FacilityCredentialingSpan]
        def create_facility(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::Credentialing::V2::Types::FacilityCredentialingSpan.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [Candid::Credentialing::V2::Types::FacilityCredentialingSpan]
        def get_facility(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::Credentialing::V2::Types::FacilityCredentialingSpan.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [Candid::Credentialing::V2::Types::FacilityCredentialingSpanPage]
        def get_all_facilities(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::Credentialing::V2::Types::FacilityCredentialingSpanPage.load(_response.body)
          else
            raise _response.body
          end
        end

        # Soft deletes a credentialing span rate from the system.
        #
        # @return [untyped]
        def delete_facility(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return
          else
            raise _response.body
          end
        end

        # @return [Candid::Credentialing::V2::Types::FacilityCredentialingSpan]
        def update_facility(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::Credentialing::V2::Types::FacilityCredentialingSpan.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [Candid::Credentialing::V2::Types::ProviderCredentialingSpan]
        def create(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::Credentialing::V2::Types::ProviderCredentialingSpan.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [Candid::Credentialing::V2::Types::ProviderCredentialingSpan]
        def get(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::Credentialing::V2::Types::ProviderCredentialingSpan.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [Candid::Credentialing::V2::Types::ProviderCredentialingSpanPage]
        def get_all(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::Credentialing::V2::Types::ProviderCredentialingSpanPage.load(_response.body)
          else
            raise _response.body
          end
        end

        # Soft deletes a credentialing span rate from the system.
        #
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

        # @return [Candid::Credentialing::V2::Types::ProviderCredentialingSpan]
        def update(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::Credentialing::V2::Types::ProviderCredentialingSpan.load(_response.body)
          else
            raise _response.body
          end
        end

      end
    end
  end
end
