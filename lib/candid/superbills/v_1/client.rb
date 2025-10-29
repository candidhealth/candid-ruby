# frozen_string_literal: true

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
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "POST",
            path: "/api/superbill/v1",
            body: params
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::Superbills::V1::Types::SuperbillResponse.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end
      end
    end
  end
end
