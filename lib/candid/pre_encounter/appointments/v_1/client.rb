
module Candid
  module PreEncounter
    module Appointments
      module V1
        class Client
          # @return [Candid::PreEncounter::Appointments::V1::Client]
          def initialize(client:)
            @client = client
          end

          # Adds an appointment.  VersionConflictError is returned when the placer_appointment_id is already in use.
          #
          # @return [Candid::PreEncounter::Appointments::V1::Types::Appointment]
          def create(request_options: {}, **params)
            _request = Candid::Internal::JSON::Request.new(
              method: POST,
              path: "/appointments/v1",
              body: Candid::PreEncounter::Appointments::V1::Types::MutableAppointment.new(params[:request]).to_h,
            )
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return Candid::PreEncounter::Appointments::V1::Types::Appointment.load(_response.body)
            else
              raise _response.body
            end
          end

          # Gets all Visits within a given time range. The return list is ordered by start_time ascending.
          #
          # @return [Candid::PreEncounter::Appointments::V1::Types::VisitsPage]
          def get_visits(request_options: {}, **params)
            _request = params
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return Candid::PreEncounter::Appointments::V1::Types::VisitsPage.load(_response.body)
            else
              raise _response.body
            end
          end

          # Gets an appointment.
          #
          # @return [Candid::PreEncounter::Appointments::V1::Types::Appointment]
          def get(request_options: {}, **params)
            _request = params
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return Candid::PreEncounter::Appointments::V1::Types::Appointment.load(_response.body)
            else
              raise _response.body
            end
          end

          # Gets an appointment along with it's full history.  The return list is ordered by version ascending.
          #
          # @return [Array[Candid::PreEncounter::Appointments::V1::Types::Appointment]]
          def get_history(request_options: {}, **params)
            _request = params
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return 
            else
              raise _response.body
            end
          end

          # Updates an appointment. The path must contain the next version number to prevent race conditions. For example, if the current version of the appointment is n, you will need to send a request to this endpoint with `/{id}/n+1` to update the appointment. Updating historic versions is not supported.
          #
          # @return [Candid::PreEncounter::Appointments::V1::Types::Appointment]
          def update(request_options: {}, **params)
            _request = Candid::Internal::JSON::Request.new(
              method: PUT,
              path: "/appointments/v1/#{params[:id]}/#{params[:version]}",
              body: Candid::PreEncounter::Appointments::V1::Types::MutableAppointment.new(params[:request]).to_h,
            )
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return Candid::PreEncounter::Appointments::V1::Types::Appointment.load(_response.body)
            else
              raise _response.body
            end
          end

          # Scans up to 100 appointment updates.  The since query parameter is inclusive, and the result list is ordered by updatedAt ascending.
          #
          # @return [Array[Candid::PreEncounter::Appointments::V1::Types::Appointment]]
          def scan(request_options: {}, **params)
            _request = params
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return 
            else
              raise _response.body
            end
          end

          # Sets an appointment as deactivated.  The path must contain the most recent version to prevent race conditions.  Deactivating historic versions is not supported. Subsequent updates via PUT to the appointment will "reactivate" the appointment and set the deactivated flag to false.
          #
          # @return [untyped]
          def deactivate(request_options: {}, **params)
            _request = params
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return
            else
              raise _response.body
            end
          end

        end
      end
    end
  end
end
