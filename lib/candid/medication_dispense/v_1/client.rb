
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
            method: POST,
            path: "/api/medication-dispense/v1",
            body: Candid::MedicationDispense::V1::Types::MedicationDispenseCreate.new(params[:request]).to_h,
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::Encounters::V4::Types::Encounter.load(_response.body)
          else
            raise _response.body
          end
        end

      end
    end
  end
end
