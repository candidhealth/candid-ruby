
module Candid
  module PreEncounter
    module Patients
      module V1
        class Client
          # @return [Candid::PreEncounter::Patients::V1::Client]
          def initialize(client:)
            @client = client
          end

          # Adds a patient.  VersionConflictError is returned when the patient's external ID is already in use.
          #
          # @return [Candid::PreEncounter::Patients::V1::Types::Patient]
          def create(request_options: {}, **params)
            _request = params
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return Candid::PreEncounter::Patients::V1::Types::Patient.load(_response.body)
            else
              raise _response.body
            end
          end

          # Adds a patient and hydrates their MRN with a pre-existing MRN.  Once this patient is created their MRN will not be editable. BadRequestError is returned when the MRN is greater than 20 characters. VersionConflictError is returned when the patient's external ID is already in use.
          #
          # @return [Candid::PreEncounter::Patients::V1::Types::Patient]
          def create_with_mrn(request_options: {}, **params)
            _request = params
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return Candid::PreEncounter::Patients::V1::Types::Patient.load(_response.body)
            else
              raise _response.body
            end
          end

          # Searches for patients that match the query parameters.
          #
          # @return [Candid::PreEncounter::Patients::V1::Types::PatientPage]
          def get_multi(request_options: {}, **params)
            _request = params
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return Candid::PreEncounter::Patients::V1::Types::PatientPage.load(_response.body)
            else
              raise _response.body
            end
          end

          # Searches for referring providers that match the query parameters.  The search is case-insensitive, supports fuzzy matching, and matches against provider name and NPI. The search criteria must be an alphanumeric string, and the search is limited to the first 20 results.
          #
          # @return [Array[Candid::PreEncounter::Common::Types::ExternalProvider]]
          def search_providers(request_options: {}, **params)
            _request = params
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return 
            else
              raise _response.body
            end
          end

          # Gets a patient.
          #
          # @return [Candid::PreEncounter::Patients::V1::Types::Patient]
          def get(request_options: {}, **params)
            _request = params
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return Candid::PreEncounter::Patients::V1::Types::Patient.load(_response.body)
            else
              raise _response.body
            end
          end

          # Gets a patient by mrn.
          #
          # @return [Candid::PreEncounter::Patients::V1::Types::Patient]
          def get_by_mrn(request_options: {}, **params)
            _request = params
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return Candid::PreEncounter::Patients::V1::Types::Patient.load(_response.body)
            else
              raise _response.body
            end
          end

          # Gets a patient along with it's full history.  The return list is ordered by version ascending.
          #
          # @return [Array[Candid::PreEncounter::Patients::V1::Types::Patient]]
          def get_history(request_options: {}, **params)
            _request = params
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return 
            else
              raise _response.body
            end
          end

          # Updates a patient. The path must contain the next version number to prevent race conditions. For example, if the current version of the patient is n, you will need to send a request to this endpoint with `/{id}/n+1` to update the patient. Updating historic versions is not supported.
          #
          # @return [Candid::PreEncounter::Patients::V1::Types::Patient]
          def update(request_options: {}, **params)
            _request = Candid::Internal::JSON::Request.new(
              method: PUT,
              path: "/patients/v1/#{params[:id]}/#{params[:version]}",
              body: Candid::PreEncounter::Patients::V1::Types::MutablePatient.new(params[:request]).to_h,
            )
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return Candid::PreEncounter::Patients::V1::Types::Patient.load(_response.body)
            else
              raise _response.body
            end
          end

          # Sets a patient as deactivated.  The path must contain the most recent version plus 1 to prevent race conditions.  Deactivating historic versions is not supported.
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

          # Removes the deactivated flag for a patient.  The path must contain the most recent version plus 1 to prevent race conditions.  Reactivating historic versions is not supported.
          #
          # @return [untyped]
          def reactivate(request_options: {}, **params)
            _request = params
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return
            else
              raise _response.body
            end
          end

          # Returns a list of Patients based on the search criteria.
          #
          # @return [Array[Candid::PreEncounter::Patients::V1::Types::Patient]]
          def search(request_options: {}, **params)
            _request = params
            _response = @client.send(_request)
            if _response.code >= "200" && _response.code < "300"
              return 
            else
              raise _response.body
            end
          end

          # Scans up to 100 patient updates. The since query parameter is inclusive, and the result list is ordered by updatedAt ascending.
          # 
          # **Polling Pattern:**
          # To continuously poll for updates without gaps:
          # 1. Make your initial request with a `since` timestamp (e.g., `since=2020-01-01T13:00:00.000Z`)
          # 2. The API returns up to 100 patient records, sorted by `updated_at` ascending
          # 3. Find the `updated_at` value from the last record in the response
          # 4. Use that `updated_at` value as the `since` parameter in your next request
          # 5. Repeat steps 2-4 to ingest updates until you receive an empty list
          # 
          # **Important Notes:**
          # - The `since` parameter is inclusive, so you may receive the last record from the previous batch again (you can deduplicate by ID and version)
          # - All patient records include `updated_at`, `id`, `version`, `deactivated`, and `updating_user` fields for tracking changes
          # - Timestamps have millisecond resolution for precise ordering
          #
          # @return [Array[Candid::PreEncounter::Patients::V1::Types::Patient]]
          def scan(request_options: {}, **params)
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
