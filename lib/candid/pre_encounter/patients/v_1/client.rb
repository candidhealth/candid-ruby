# frozen_string_literal: true

module Candid
  module PreEncounter
    module Patients
      module V1
        class Client
          # @param client [Candid::Internal::Http::RawClient]
          # @param base_url [String, nil]
          # @param environment [Hash[Symbol, String], nil]
          #
          # @return [void]
          def initialize(client:, base_url: nil, environment: nil)
            @client = client
            @base_url = base_url
            @environment = environment
          end

          # Adds a patient.  VersionConflictError is returned when the patient's external ID is already in use.
          #
          # @param request_options [Hash]
          # @param params [Candid::PreEncounter::Patients::V1::Types::MutablePatient]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [Boolean, nil] :skip_duplicate_check
          #
          # @return [Candid::PreEncounter::Patients::V1::Types::Patient]
          def create(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            query_param_names = %i[skip_duplicate_check]
            query_params = {}
            query_params["skip_duplicate_check"] = params[:skip_duplicate_check] if params.key?(:skip_duplicate_check)
            params = params.except(*query_param_names)

            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "POST",
              path: "/patients/v1",
              query: query_params,
              body: Candid::PreEncounter::Patients::V1::Types::MutablePatient.new(params).to_h,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::Patients::V1::Types::Patient.load(response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Adds a patient and hydrates their MRN with a pre-existing MRN.  Once this patient is created their MRN will
          # not be editable. BadRequestError is returned when the MRN is greater than 20 characters.
          # VersionConflictError is returned when the patient's external ID is already in use.
          #
          # @param request_options [Hash]
          # @param params [Candid::PreEncounter::Patients::V1::Types::MutablePatientWithMrn]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [Boolean, nil] :skip_duplicate_check
          #
          # @return [Candid::PreEncounter::Patients::V1::Types::Patient]
          def create_with_mrn(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            query_param_names = %i[skip_duplicate_check]
            query_params = {}
            query_params["skip_duplicate_check"] = params[:skip_duplicate_check] if params.key?(:skip_duplicate_check)
            params = params.except(*query_param_names)

            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "POST",
              path: "/patients/v1/with_mrn",
              query: query_params,
              body: Candid::PreEncounter::Patients::V1::Types::MutablePatientWithMrn.new(params).to_h,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::Patients::V1::Types::Patient.load(response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Searches for patients that match the query parameters.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [Integer, nil] :limit
          # @option params [String, nil] :mrn
          # @option params [String, nil] :page_token
          # @option params [String, nil] :sort_field
          # @option params [Candid::PreEncounter::Common::Types::SortDirection, nil] :sort_direction
          #
          # @return [Candid::PreEncounter::Patients::V1::Types::PatientPage]
          def get_multi(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            query_param_names = %i[limit mrn page_token sort_field sort_direction]
            query_params = {}
            query_params["limit"] = params[:limit] if params.key?(:limit)
            query_params["mrn"] = params[:mrn] if params.key?(:mrn)
            query_params["page_token"] = params[:page_token] if params.key?(:page_token)
            query_params["sort_field"] = params[:sort_field] if params.key?(:sort_field)
            query_params["sort_direction"] = params[:sort_direction] if params.key?(:sort_direction)
            params.except(*query_param_names)

            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "GET",
              path: "/patients/v1/get_multi",
              query: query_params,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::Patients::V1::Types::PatientPage.load(response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Searches for referring providers that match the query parameters.  The search is case-insensitive, supports
          # fuzzy matching, and matches against provider name and NPI. The search criteria must be an alphanumeric
          # string, and the search is limited to the first 20 results.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [String] :search_criteria
          #
          # @return [Array[Candid::PreEncounter::Common::Types::ExternalProvider]]
          def search_providers(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            query_param_names = %i[search_criteria]
            query_params = {}
            query_params["search_criteria"] = params[:search_criteria] if params.key?(:search_criteria)
            params.except(*query_param_names)

            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "GET",
              path: "/patients/v1/search_providers",
              query: query_params,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = response.code.to_i
            return if code.between?(200, 299)

            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end

          # Gets a patient.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [Candid::PreEncounter::Common::Types::PatientId] :id
          #
          # @return [Candid::PreEncounter::Patients::V1::Types::Patient]
          def get(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "GET",
              path: "/patients/v1/#{params[:id]}",
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::Patients::V1::Types::Patient.load(response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Gets a patient by mrn.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [String] :mrn
          #
          # @return [Candid::PreEncounter::Patients::V1::Types::Patient]
          def get_by_mrn(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "GET",
              path: "/patients/v1/mrn/#{params[:mrn]}",
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::Patients::V1::Types::Patient.load(response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Gets a patient along with it's full history.  The return list is ordered by version ascending.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [Candid::PreEncounter::Common::Types::PatientId] :id
          #
          # @return [Array[Candid::PreEncounter::Patients::V1::Types::Patient]]
          def get_history(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "GET",
              path: "/patients/v1/#{params[:id]}/history",
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = response.code.to_i
            return if code.between?(200, 299)

            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end

          # Gets a patient along with their coverages at a specific point in time. Note that the date passed in is only
          # used to determine what the filing order was for that patient during that time. The actual data returned will
          # always be the latest version of the patient and coverages.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [Candid::PreEncounter::Common::Types::PatientId] :id
          # @option params [String, nil] :date
          #
          # @return [Candid::PreEncounter::Patients::V1::Types::PatientCoverageSnapshot]
          def get_coverage_snapshot(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            query_param_names = %i[date]
            query_params = {}
            query_params["date"] = params[:date] if params.key?(:date)
            params = params.except(*query_param_names)

            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "GET",
              path: "/patients/v1/#{params[:id]}/snapshot",
              query: query_params,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::Patients::V1::Types::PatientCoverageSnapshot.load(response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Updates a patient. The path must contain the next version number to prevent race conditions. For example, if
          # the current version of the patient is n, you will need to send a request to this endpoint with `/{id}/n+1`
          # to update the patient. Updating historic versions is not supported.
          #
          # @param request_options [Hash]
          # @param params [Candid::PreEncounter::Patients::V1::Types::MutablePatient]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [Candid::PreEncounter::Common::Types::PatientId] :id
          # @option params [String] :version
          #
          # @return [Candid::PreEncounter::Patients::V1::Types::Patient]
          def update(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "PUT",
              path: "/patients/v1/#{params[:id]}/#{params[:version]}",
              body: Candid::PreEncounter::Patients::V1::Types::MutablePatient.new(params).to_h,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::Patients::V1::Types::Patient.load(response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Sets a patient as deactivated.  The path must contain the most recent version plus 1 to prevent race
          # conditions.  Deactivating historic versions is not supported.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [Candid::PreEncounter::Common::Types::PatientId] :id
          # @option params [String] :version
          #
          # @return [untyped]
          def deactivate(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "DELETE",
              path: "/patients/v1/#{params[:id]}/#{params[:version]}",
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = response.code.to_i
            return if code.between?(200, 299)

            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end

          # Removes the deactivated flag for a patient.  The path must contain the most recent version plus 1 to prevent
          # race conditions.  Reactivating historic versions is not supported.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [Candid::PreEncounter::Common::Types::PatientId] :id
          # @option params [String] :version
          #
          # @return [untyped]
          def reactivate(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "PATCH",
              path: "/patients/v1/#{params[:id]}/#{params[:version]}",
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = response.code.to_i
            return if code.between?(200, 299)

            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end

          # Returns a list of Patients based on the search criteria.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [String, nil] :mrn
          # @option params [String, nil] :similar_name_ordering
          #
          # @return [Array[Candid::PreEncounter::Patients::V1::Types::Patient]]
          def search(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            query_param_names = %i[mrn similar_name_ordering]
            query_params = {}
            query_params["mrn"] = params[:mrn] if params.key?(:mrn)
            query_params["similar_name_ordering"] = params[:similar_name_ordering] if params.key?(:similar_name_ordering)
            params.except(*query_param_names)

            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "GET",
              path: "/patients/v1",
              query: query_params,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = response.code.to_i
            return if code.between?(200, 299)

            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end

          # Scans up to 1000 patient updates. The since query parameter is inclusive, and the result list is ordered by
          # updatedAt ascending.
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
          # - The `since` parameter is inclusive, so you may receive the last record from the previous batch again (you
          # can deduplicate by ID and version)
          # - All patient records include `updated_at`, `id`, `version`, `deactivated`, and `updating_user` fields for
          # tracking changes
          # - Timestamps have millisecond resolution for precise ordering
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [String] :since
          # @option params [Integer, nil] :max_results
          #
          # @return [Array[Candid::PreEncounter::Patients::V1::Types::Patient]]
          def scan(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            query_param_names = %i[since max_results]
            query_params = {}
            query_params["since"] = params[:since] if params.key?(:since)
            query_params["maxResults"] = params[:max_results] if params.key?(:max_results)
            params.except(*query_param_names)

            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "GET",
              path: "/patients/v1/updates/scan",
              query: query_params,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = response.code.to_i
            return if code.between?(200, 299)

            error_class = Candid::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
