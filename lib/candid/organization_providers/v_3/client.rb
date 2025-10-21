
module Candid
  module OrganizationProviders
    module V3
      class Client
        # @return [Candid::OrganizationProviders::V3::Client]
        def initialize(client:)
          @client = client
        end

        # @return [Candid::OrganizationProviders::V3::Types::OrganizationProviderV2]
        def get(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::OrganizationProviders::V3::Types::OrganizationProviderV2.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [Candid::OrganizationProviders::V3::Types::OrganizationProviderPageV2]
        def get_multi(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::OrganizationProviders::V3::Types::OrganizationProviderPageV2.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [Candid::OrganizationProviders::V3::Types::OrganizationProviderV2]
        def create(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            method: POST,
            path: "/api/organization-providers/v3",
            body: Candid::OrganizationProviders::V3::Types::OrganizationProviderCreateV2.new(params[:request]).to_h,
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::OrganizationProviders::V3::Types::OrganizationProviderV2.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [Candid::OrganizationProviders::V3::Types::OrganizationProviderV2]
        def update(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            method: PATCH,
            path: "/api/organization-providers/v3/#{params[:organization_provider_id]}",
            body: Candid::OrganizationProviders::V3::Types::OrganizationProviderUpdateV2.new(params[:request]).to_h,
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::OrganizationProviders::V3::Types::OrganizationProviderV2.load(_response.body)
          else
            raise _response.body
          end
        end

      end
    end
  end
end
