
module Candid
  module PreEncounter
    module Lists
      module V1
        class Client
          # @return [Candid::PreEncounter::Lists::V1::Client]
          def initialize(client:)
            @client = client
          end

          # Gets patients with dependent objects for patients that match the query parameters.
          #
          # @return [Candid::PreEncounter::Lists::V1::Types::PatientListPage]
          def get_patient_list(request_options: {}, **params)
            _request = params
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return Candid::PreEncounter::Lists::V1::Types::PatientListPage.load(_response.body)
            else
              raise _response.body
            end
          end

          # Searches for appointments that match the query parameters.
          #
          # @return [Candid::PreEncounter::Lists::V1::Types::AppointmentListPage]
          def get_appointment_list(request_options: {}, **params)
            _request = params
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return Candid::PreEncounter::Lists::V1::Types::AppointmentListPage.load(_response.body)
            else
              raise _response.body
            end
          end

        end
      end
    end
  end
end
