
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
          method: PATCH,
          path: "/api/service_facility/v2/#{params[:service_facility_id]}",
          body: Candid::ServiceFacility::Types::EncounterServiceFacilityUpdate.new(params[:request]).to_h,
        )
        _response = @client.send(_request)
        if _response.code >= "200" && _response.code < "300"
          return Candid::ServiceFacility::Types::EncounterServiceFacility.load(_response.body)
        else
          raise _response.body
        end
      end

    end
  end
end
