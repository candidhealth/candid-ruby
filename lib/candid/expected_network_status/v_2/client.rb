
module Candid
  module ExpectedNetworkStatus
    module V2
      class Client
        # @return [Candid::ExpectedNetworkStatus::V2::Client]
        def initialize(client:)
          @client = client
        end

        # Computes the expected network status for a given rendering provider.
        # This endpoint is not available to all customers. Reach out to the Candid sales team
        # to discuss enabling this endpoint if it is not available for your organization.
        #
        # @return [Candid::ExpectedNetworkStatus::V2::Types::ExpectedNetworkStatusResponseV2]
        def compute_for_rendering_provider(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            method: POST,
            path: "/api/expected-network-status/v2/compute/#{params[:rendering_provider_id]}",
            body: Candid::ExpectedNetworkStatus::V2::Types::ExpectedNetworkStatusRequestV2.new(params[:request]).to_h,
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::ExpectedNetworkStatus::V2::Types::ExpectedNetworkStatusResponseV2.load(_response.body)
          else
            raise _response.body
          end
        end

        # Computes all the in network providers for a given set of inputs.
        # This endpoint is not available to all customers. Reach out to the Candid sales team
        # to discuss enabling this endpoint if it is not available for your organization.
        #
        # @return [Candid::ExpectedNetworkStatus::V2::Types::ComputeAllInNetworkProvidersResponse]
        def compute_all_in_network_providers(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            method: POST,
            path: "/api/expected-network-status/v2/compute",
            body: Candid::ExpectedNetworkStatus::V2::Types::ComputeAllInNetworkProvidersRequest.new(params[:request]).to_h,
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::ExpectedNetworkStatus::V2::Types::ComputeAllInNetworkProvidersResponse.load(_response.body)
          else
            raise _response.body
          end
        end

      end
    end
  end
end
