# frozen_string_literal: true

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
          params = Candid::Internal::Types::Utils.symbolize_keys(params)
          _query_param_names = %i[limit page_token]
          _query = params.slice(*_query_param_names)
          params.except(*_query_param_names)

          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "GET",
            path: "/api/external-payment-account-config/v1",
            query: _query
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::ExternalPaymentAccountConfig::V1::Types::ExternalPaymentAccountConfigPage.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end
      end
    end
  end
end
