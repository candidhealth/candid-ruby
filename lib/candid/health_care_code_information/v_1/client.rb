
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
            method: PUT,
            path: "/api/health-care-code-informations/v1/#{params[:encounter_id]}",
            body: Candid::HealthCareCodeInformation::V1::Types::HealthCareCodeInformationUpdate.new(params[:request]).to_h,
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::HealthCareCodeInformation::V1::Types::HealthCareCodeInformationGetAllResponse.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [Candid::HealthCareCodeInformation::V1::Types::HealthCareCodeInformationGetAllResponse]
        def get_all_for_encounter(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::HealthCareCodeInformation::V1::Types::HealthCareCodeInformationGetAllResponse.load(_response.body)
          else
            raise _response.body
          end
        end

      end
    end
  end
end
