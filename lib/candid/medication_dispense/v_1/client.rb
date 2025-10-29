# frozen_string_literal: true

module Candid
  module MedicationDispense
    module V1
      class Client
        # @return [Candid::MedicationDispense::V1::Client]
        def initialize(client:)
          @client = client
        end

        # @return [Candid::Encounters::V4::Types::Encounter]
        def create(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "POST",
            path: "/api/medication-dispense/v1",
            body: Candid::MedicationDispense::V1::Types::MedicationDispenseCreate.new(params).to_h
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::Encounters::V4::Types::Encounter.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end
      end
    end
  end
end
