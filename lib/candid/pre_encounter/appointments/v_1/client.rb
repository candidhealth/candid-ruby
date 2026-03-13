# frozen_string_literal: true

module Candid
  module PreEncounter
    module Appointments
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

          # Adds an appointment.  VersionConflictError is returned when the placer_appointment_id is already in use.
          #
          # @param request_options [Hash]
          # @param params [Candid::PreEncounter::Appointments::V1::Types::MutableAppointment]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          #
          # @return [Candid::PreEncounter::Appointments::V1::Types::Appointment]
          def create(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "POST",
              path: "/appointments/v1",
              body: Candid::PreEncounter::Appointments::V1::Types::MutableAppointment.new(params).to_h,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::Appointments::V1::Types::Appointment.load(response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Gets all Visits within a given time range. The return list is ordered by start_time ascending.
          #
          # **IMPORTANT:** This endpoint requires a date filter on `appointment.startTimestamp` to ensure acceptable
          # query performance.
          # Without date filtering, the query can take 50+ seconds on large datasets due to grouping and aggregation
          # operations.
          #
          # Example filters:
          # - `appointment.startTimestamp|gt|2024-01-01` - appointments after January 1, 2024
          # - `appointment.startTimestamp|eq|2024-12-08` - appointments on December 8, 2024
          # - `appointment.startTimestamp|lt|2024-12-31` - appointments before December 31, 2024
          #
          # You can combine the date filter with other filters using commas:
          # - `appointment.startTimestamp|gt|2024-01-01,appointment.status|eq|PENDING`
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [String, nil] :page_token
          # @option params [Integer, nil] :limit
          # @option params [String, nil] :sort_field
          # @option params [Candid::PreEncounter::Common::Types::SortDirection, nil] :sort_direction
          # @option params [String, nil] :filters
          #
          # @return [Candid::PreEncounter::Appointments::V1::Types::VisitsPage]
          def get_visits(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            query_param_names = %i[page_token limit sort_field sort_direction filters]
            query_params = {}
            query_params["page_token"] = params[:page_token] if params.key?(:page_token)
            query_params["limit"] = params[:limit] if params.key?(:limit)
            query_params["sort_field"] = params[:sort_field] if params.key?(:sort_field)
            query_params["sort_direction"] = params[:sort_direction] if params.key?(:sort_direction)
            query_params["filters"] = params[:filters] if params.key?(:filters)
            params.except(*query_param_names)

            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "GET",
              path: "/appointments/v1/visits",
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
              Candid::PreEncounter::Appointments::V1::Types::VisitsPage.load(response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Gets an appointment.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [Candid::PreEncounter::Common::Types::AppointmentId] :id
          #
          # @return [Candid::PreEncounter::Appointments::V1::Types::Appointment]
          def get(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "GET",
              path: "/appointments/v1/#{params[:id]}",
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::Appointments::V1::Types::Appointment.load(response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Gets an appointment along with it's full history.  The return list is ordered by version ascending.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [Candid::PreEncounter::Common::Types::AppointmentId] :id
          #
          # @return [Array[Candid::PreEncounter::Appointments::V1::Types::Appointment]]
          def get_history(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "GET",
              path: "/appointments/v1/#{params[:id]}/history",
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

          # Updates an appointment. The path must contain the next version number to prevent race conditions. For
          # example, if the current version of the appointment is n, you will need to send a request to this endpoint
          # with `/{id}/n+1` to update the appointment. Updating historic versions is not supported.
          #
          # @param request_options [Hash]
          # @param params [Candid::PreEncounter::Appointments::V1::Types::MutableAppointment]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [Candid::PreEncounter::Common::Types::AppointmentId] :id
          # @option params [String] :version
          #
          # @return [Candid::PreEncounter::Appointments::V1::Types::Appointment]
          def update(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "PUT",
              path: "/appointments/v1/#{params[:id]}/#{params[:version]}",
              body: Candid::PreEncounter::Appointments::V1::Types::MutableAppointment.new(params).to_h,
              request_options: request_options
            )
            begin
              response = @client.send(request)
            rescue Net::HTTPRequestTimeout
              raise Candid::Errors::TimeoutError
            end
            code = response.code.to_i
            if code.between?(200, 299)
              Candid::PreEncounter::Appointments::V1::Types::Appointment.load(response.body)
            else
              error_class = Candid::Errors::ResponseError.subclass_for_code(code)
              raise error_class.new(response.body, code: code)
            end
          end

          # Scans up to 100 appointment updates.  The since query parameter is inclusive, and the result list is ordered
          # by updatedAt ascending.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [String] :since
          #
          # @return [Array[Candid::PreEncounter::Appointments::V1::Types::Appointment]]
          def scan(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            query_param_names = %i[since]
            query_params = {}
            query_params["since"] = params[:since] if params.key?(:since)
            params.except(*query_param_names)

            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "GET",
              path: "/appointments/v1/updates/scan",
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

          # Sets an appointment as deactivated.  The path must contain the most recent version to prevent race
          # conditions.  Deactivating historic versions is not supported. Subsequent updates via PUT to the appointment
          # will "reactivate" the appointment and set the deactivated flag to false.
          #
          # @param request_options [Hash]
          # @param params [Hash]
          # @option request_options [String] :base_url
          # @option request_options [Hash{String => Object}] :additional_headers
          # @option request_options [Hash{String => Object}] :additional_query_parameters
          # @option request_options [Hash{String => Object}] :additional_body_parameters
          # @option request_options [Integer] :timeout_in_seconds
          # @option params [Candid::PreEncounter::Common::Types::AppointmentId] :id
          # @option params [String] :version
          #
          # @return [untyped]
          def deactivate(request_options: {}, **params)
            params = Candid::Internal::Types::Utils.normalize_keys(params)
            request = Candid::Internal::JSON::Request.new(
              base_url: request_options[:base_url] || @base_url || @environment&.dig(:pre_encounter),
              method: "DELETE",
              path: "/appointments/v1/#{params[:id]}/#{params[:version]}",
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
