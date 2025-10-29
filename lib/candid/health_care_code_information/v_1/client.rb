# frozen_string_literal: true

module Candid
  module HealthCareCodeInformation
    module V1
      class Client
        # @return [Candid::HealthCareCodeInformation::V1::Client]
        def initialize(client:)
          @client = client
        end

        # @return [Candid::HealthCareCodeInformation::V1::Types::HealthCareCodeInformationGetAllResponse]
        def update(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "PUT",
            path: "/api/health-care-code-informations/v1/#{params[:encounter_id]}",
            body: Candid::HealthCareCodeInformation::V1::Types::HealthCareCodeInformationUpdate.new(params).to_h
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::HealthCareCodeInformation::V1::Types::HealthCareCodeInformationGetAllResponse.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end

        # @return [Candid::HealthCareCodeInformation::V1::Types::HealthCareCodeInformationGetAllResponse]
        def get_all_for_encounter(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
            method: "GET",
            path: "/api/health-care-code-informations/v1/#{params[:encounter_id]}"
          )
          begin
            _response = @client.send(_request)
          rescue Net::HTTPRequestTimeout
            raise Candid::Errors::TimeoutError
          end
          code = _response.code.to_i
          if code.between?(200, 299)
            Candid::HealthCareCodeInformation::V1::Types::HealthCareCodeInformationGetAllResponse.load(_response.body)
          else
            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end
      end
    end
  end
end
