# frozen_string_literal: true

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
            params = Candid::Internal::Types::Utils.symbolize_keys(params)
            _query_param_names = %i[skip_duplicate_check]
            _query = params.slice(*_query_param_names)
            params = params.except(*_query_param_names)

            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "POST",
              path: "/patients/v1",
              query: _query,
              body: params
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = _response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::Patients::V1::Types::Patient.load(_response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(_response.body, code: code)
            end
          end

          # Adds a patient and hydrates their MRN with a pre-existing MRN.  Once this patient is created their MRN will not be editable. BadRequestError is returned when the MRN is greater than 20 characters. VersionConflictError is returned when the patient's external ID is already in use.
          #
          # @return [Candid::PreEncounter::Patients::V1::Types::Patient]
          def create_with_mrn(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.symbolize_keys(params)
            _query_param_names = %i[skip_duplicate_check]
            _query = params.slice(*_query_param_names)
            params = params.except(*_query_param_names)

            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "POST",
              path: "/patients/v1/with_mrn",
              query: _query,
              body: params
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = _response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::Patients::V1::Types::Patient.load(_response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(_response.body, code: code)
            end
          end

          # Searches for patients that match the query parameters.
          #
          # @return [Candid::PreEncounter::Patients::V1::Types::PatientPage]
          def get_multi(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.symbolize_keys(params)
            _query_param_names = %i[limit mrn page_token sort_field sort_direction]
            _query = params.slice(*_query_param_names)
            params.except(*_query_param_names)

            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "GET",
              path: "/patients/v1/get_multi",
              query: _query
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = _response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::Patients::V1::Types::PatientPage.load(_response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(_response.body, code: code)
            end
          end

          # Searches for referring providers that match the query parameters.  The search is case-insensitive, supports fuzzy matching, and matches against provider name and NPI. The search criteria must be an alphanumeric string, and the search is limited to the first 20 results.
          #
          # @return [Array[Candid::PreEncounter::Common::Types::ExternalProvider]]
          def search_providers(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.symbolize_keys(params)
            _query_param_names = %i[search_criteria]
            _query = params.slice(*_query_param_names)
            params.except(*_query_param_names)

            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "GET",
              path: "/patients/v1/search_providers",
              query: _query
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = _response.code.to_i
            return if code.between?(200, 299)

            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end

          # Gets a patient.
          #
          # @return [Candid::PreEncounter::Patients::V1::Types::Patient]
          def get(request_options: {}, **params)
            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "GET",
              path: "/patients/v1/#{params[:id]}"
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = _response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::Patients::V1::Types::Patient.load(_response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(_response.body, code: code)
            end
          end

          # Gets a patient by mrn.
          #
          # @return [Candid::PreEncounter::Patients::V1::Types::Patient]
          def get_by_mrn(request_options: {}, **params)
            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "GET",
              path: "/patients/v1/mrn/#{params[:mrn]}"
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = _response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::Patients::V1::Types::Patient.load(_response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(_response.body, code: code)
            end
          end

          # Gets a patient along with it's full history.  The return list is ordered by version ascending.
          #
          # @return [Array[Candid::PreEncounter::Patients::V1::Types::Patient]]
          def get_history(request_options: {}, **params)
            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "GET",
              path: "/patients/v1/#{params[:id]}/history"
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = _response.code.to_i
            return if code.between?(200, 299)

            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end

          # Gets a patient along with their coverages at a specific point in time. Note that the date passed in is only used to determine what the filing order was for that patient during that time. The actual data returned will always be the latest version of the patient and coverages.
          #
          # @return [Candid::PreEncounter::Patients::V1::Types::PatientCoverageSnapshot]
          def get_coverage_snapshot(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.symbolize_keys(params)
            _query_param_names = %i[date]
            _query = params.slice(*_query_param_names)
            params = params.except(*_query_param_names)

            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "GET",
              path: "/patients/v1/#{params[:id]}/snapshot",
              query: _query
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = _response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::Patients::V1::Types::PatientCoverageSnapshot.load(_response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(_response.body, code: code)
            end
          end

          # Updates a patient. The path must contain the next version number to prevent race conditions. For example, if the current version of the patient is n, you will need to send a request to this endpoint with `/{id}/n+1` to update the patient. Updating historic versions is not supported.
          #
          # @return [Candid::PreEncounter::Patients::V1::Types::Patient]
          def update(request_options: {}, **params)
            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "PUT",
              path: "/patients/v1/#{params[:id]}/#{params[:version]}",
              body: Candid::PreEncounter::Patients::V1::Types::MutablePatient.new(params).to_h
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = _response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::Patients::V1::Types::Patient.load(_response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(_response.body, code: code)
            end
          end

          # Sets a patient as deactivated.  The path must contain the most recent version plus 1 to prevent race conditions.  Deactivating historic versions is not supported.
          #
          # @return [untyped]
          def deactivate(request_options: {}, **params)
            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "DELETE",
              path: "/patients/v1/#{params[:id]}/#{params[:version]}"
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = _response.code.to_i
            return if code.between?(200, 299)

            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end

          # Removes the deactivated flag for a patient.  The path must contain the most recent version plus 1 to prevent race conditions.  Reactivating historic versions is not supported.
          #
          # @return [untyped]
          def reactivate(request_options: {}, **params)
            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "PATCH",
              path: "/patients/v1/#{params[:id]}/#{params[:version]}"
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = _response.code.to_i
            return if code.between?(200, 299)

            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end

          # Returns a list of Patients based on the search criteria.
          #
          # @return [Array[Candid::PreEncounter::Patients::V1::Types::Patient]]
          def search(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.symbolize_keys(params)
            _query_param_names = %i[mrn similar_name_ordering]
            _query = params.slice(*_query_param_names)
            params.except(*_query_param_names)

            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "GET",
              path: "/patients/v1",
              query: _query
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = _response.code.to_i
            return if code.between?(200, 299)

            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end

          # Scans up to 1000 patient updates. The since query parameter is inclusive, and the result list is ordered by updatedAt ascending.
          #
          # **Polling Pattern:**
          # To continuously poll for updates without gaps:
          # 1. Make your initial request with a `since` timestamp (e.g., `since=2020-01-01T13:00:00.000Z`)
          # 2. The API returns 100 by default and up to 1000 patient records, sorted by `updated_at` ascending
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
            params = Candid::Internal::Types::Utils.symbolize_keys(params)
            _query_param_names = %i[since maxResults]
            _query = params.slice(*_query_param_names)
            params.except(*_query_param_names)

            _request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || Candid::Environment::PRODUCTION,
              method: "GET",
              path: "/patients/v1/updates/scan",
              query: _query
            )
            begin
              _response = @client.send(_request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = _response.code.to_i
            return if code.between?(200, 299)

            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(_response.body, code: code)
          end
        end
      end
    end
  end
end
