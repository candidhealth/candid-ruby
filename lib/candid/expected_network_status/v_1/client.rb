# frozen_string_literal: true

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
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "POST",
            path: "/api/expected-network-status/v1",
            body: params
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::ExpectedNetworkStatus::V1::Types::ExpectedNetworkStatusResponse.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end
      end
    end
  end
end
