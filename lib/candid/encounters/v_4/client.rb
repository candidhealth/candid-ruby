
module Candid
  module Encounters
    module V4
      class Client
        # @return [Candid::Encounters::V4::Client]
        def initialize(client:)
          @client = client
        end

        # @return [Candid::Encounters::V4::Types::EncounterPage]
        def get_all(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::Encounters::V4::Types::EncounterPage.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [Candid::Encounters::V4::Types::Encounter]
        def get(request_options: {}, **params)
          _request = params
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::Encounters::V4::Types::Encounter.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [Candid::Encounters::V4::Types::Encounter]
        def create(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            method: POST,
            path: "/api/encounters/v4",
            body: Candid::Encounters::V4::Types::EncounterCreate.new(params[:request]).to_h,
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::Encounters::V4::Types::Encounter.load(_response.body)
          else
            raise _response.body
          end
        end

        # Create an encounter from a pre-encounter patient and appointment. This endpoint is intended to be used by consumers who are managing
        # patients and appointments in the pre-encounter service and is currently under development. Consumers who are not taking advantage
        # of the pre-encounter service should use the standard create endpoint.
        # 
        # The endpoint will create an encounter from the provided fields, pulling information from the provided patient and appointment objects
        # where applicable. In particular, the following fields are populated from the patient and appointment objects:
        #   - Patient
        #   - Referring Provider
        #   - Subscriber Primary
        #   - Subscriber Secondary
        #   - Referral Number
        #   - Responsible Party
        #   - Guarantor
        # 
        # Utilizing this endpoint opts you into automatic updating of the encounter when the patient or appointment is updated, assuming the
        # encounter has not already been submitted or adjudicated.
        #
        # @return [Candid::Encounters::V4::Types::Encounter]
        def create_from_pre_encounter_patient(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            method: POST,
            path: "/api/encounters/v4/create-from-pre-encounter",
            body: Candid::Encounters::V4::Types::EncounterCreateFromPreEncounter.new(params[:request]).to_h,
          )
          _response = @client.send(_request)
          if _response.code >= "200" && _response.code < "300"
            return Candid::Encounters::V4::Types::Encounter.load(_response.body)
          else
            raise _response.body
          end
        end

        # @return [Candid::Encounters::V4::Types::Encounter]
        def update(request_options: {}, **params)
          _request = Candid::Internal::JSON::Request.new(
            method: PATCH,
            path: "/api/encounters/v4/#{params[:encounter_id]}",
            body: Candid::Encounters::V4::Types::EncounterUpdate.new(params[:request]).to_h,
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
