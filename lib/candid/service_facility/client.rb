# frozen_string_literal: true

module Candid
  module ServiceFacility
    class Client
      # @return [Candid::ServiceFacility::Client]
      def initialize(client:)
        @client = client
      end

      # @return [Candid::ServiceFacility::Types::EncounterServiceFacility]
      def update(request_options: {}, **params)
        _request = Candid::Internal::JSON::Request.new(
          base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
          method: "PATCH",
          path: "/api/service_facility/v2/#{params[:service_facility_id]}",
          body: Candid::ServiceFacility::Types::EncounterServiceFacilityUpdate.new(params).to_h
        )
        begin
          _response = @client.send(_request)
        rescue Net::HTTPRequestTimeout
          raise Candid::Errors::TimeoutError
        end
        code = _response.code.to_i
        if code.between?(200, 299)
          Candid::ServiceFacility::Types::EncounterServiceFacility.load(_response.body)
        else
          error_class = Candid::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(_response.body, code: code)
        end
      end
    end
  end
end
