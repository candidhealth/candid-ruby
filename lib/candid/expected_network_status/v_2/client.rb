# frozen_string_literal: true

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
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "POST",
            path: "/api/expected-network-status/v2/compute/#{params[:rendering_provider_id]}",
            body: Candid::ExpectedNetworkStatus::V2::Types::ExpectedNetworkStatusRequestV2.new(params).to_h
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::ExpectedNetworkStatus::V2::Types::ExpectedNetworkStatusResponseV2.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # Computes all the in network providers for a given set of inputs.
        # This endpoint is not available to all customers. Reach out to the Candid sales team
        # to discuss enabling this endpoint if it is not available for your organization.
        #
        # @return [Candid::ExpectedNetworkStatus::V2::Types::ComputeAllInNetworkProvidersResponse]
        def compute_all_in_network_providers(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "POST",
            path: "/api/expected-network-status/v2/compute",
            body: Candid::ExpectedNetworkStatus::V2::Types::ComputeAllInNetworkProvidersRequest.new(params).to_h
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::ExpectedNetworkStatus::V2::Types::ComputeAllInNetworkProvidersResponse.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end
      end
    end
  end
end
