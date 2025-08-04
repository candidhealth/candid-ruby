# frozen_string_literal: true

require_relative "../../../../requests"
require_relative "types/mutable_appointment"
require_relative "types/appointment"
require_relative "../../common/types/sort_direction"
require_relative "types/visits_page"
require "json"
require "date"
require "async"

module CandidApiClient
  module PreEncounter
    module Appointments
      module V1
        class V1Client
          # @return [CandidApiClient::RequestClient]
          attr_reader :request_client

          # @param request_client [CandidApiClient::RequestClient]
          # @return [CandidApiClient::PreEncounter::Appointments::V1::V1Client]
          def initialize(request_client:)
            @request_client = request_client
          end

          # Adds an appointment.  VersionConflictError is returned when the
          #  placer_appointment_id is already in use.
          #
          # @param request [Hash] Request of type CandidApiClient::PreEncounter::Appointments::V1::Types::MutableAppointment, as a Hash
          #   * :patient_id (String)
          #   * :start_timestamp (DateTime)
          #   * :status (CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentStatus)
          #   * :service_duration (Integer)
          #   * :services (Array<CandidApiClient::PreEncounter::Appointments::V1::Types::Service>)
          #   * :placer_appointment_id (String)
          #   * :attending_doctor (Hash)
          #     * :name (Hash)
          #       * :family (String)
          #       * :given (Array<String>)
          #       * :use (CandidApiClient::PreEncounter::Common::Types::NameUse)
          #       * :period (Hash)
          #         * :start (Date)
          #         * :end_ (Date)
          #       * :suffix (String)
          #     * :type (CandidApiClient::PreEncounter::Common::Types::ExternalProviderType)
          #     * :npi (String)
          #     * :telecoms (Array<CandidApiClient::PreEncounter::Common::Types::ContactPoint>)
          #     * :addresses (Array<CandidApiClient::PreEncounter::Common::Types::Address>)
          #     * :period (Hash)
          #       * :start (Date)
          #       * :end_ (Date)
          #     * :canonical_id (String)
          #     * :fax (String)
          #   * :estimated_copay_cents (Integer)
          #   * :estimated_patient_responsibility_cents (Integer)
          #   * :patient_deposit_cents (Integer)
          #   * :checked_in_timestamp (DateTime)
          #   * :notes (String)
          #   * :location_resource_id (String)
          #   * :automated_eligibility_check_complete (Boolean)
          #   * :work_queue (CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentWorkQueue)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Appointments::V1::Types::Appointment]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.appointments.v_1.create(request: { patient_id: "patient_id", start_timestamp: DateTime.parse(2024-01-15T09:30:00.000Z), service_duration: 1, services: [{  }, {  }] })
          def create(request:, request_options: nil)
            response = @request_client.conn.post do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
              req.url "#{@request_client.get_url(environment: PreEncounter,
                                                 request_options: request_options)}/appointments/v1"
            end
            CandidApiClient::PreEncounter::Appointments::V1::Types::Appointment.from_json(json_object: response.body)
          end

          # Gets all Visits within a given time range. The return list is ordered by
          #  start_time ascending.
          #
          # @param page_token [String]
          # @param limit [Integer]
          # @param sort_field [String] Defaults to appointment.start_time.
          # @param sort_direction [CandidApiClient::PreEncounter::Common::Types::SortDirection] Defaults to ascending.
          # @param filters [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Appointments::V1::Types::VisitsPage]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.appointments.v_1.get_visits
          def get_visits(page_token: nil, limit: nil, sort_field: nil, sort_direction: nil, filters: nil,
                         request_options: nil)
            response = @request_client.conn.get do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.params = {
                **(request_options&.additional_query_parameters || {}),
                "page_token": page_token,
                "limit": limit,
                "sort_field": sort_field,
                "sort_direction": sort_direction,
                "filters": filters
              }.compact
              req.url "#{@request_client.get_url(environment: PreEncounter,
                                                 request_options: request_options)}/appointments/v1/visits"
            end
            CandidApiClient::PreEncounter::Appointments::V1::Types::VisitsPage.from_json(json_object: response.body)
          end

          # Gets an appointment.
          #
          # @param id [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Appointments::V1::Types::Appointment]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.appointments.v_1.get(id: "id")
          def get(id:, request_options: nil)
            response = @request_client.conn.get do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.url "#{@request_client.get_url(environment: PreEncounter,
                                                 request_options: request_options)}/appointments/v1/#{id}"
            end
            CandidApiClient::PreEncounter::Appointments::V1::Types::Appointment.from_json(json_object: response.body)
          end

          # Gets an appointment along with it's full history.  The return list is ordered by
          #  version ascending.
          #
          # @param id [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Array<CandidApiClient::PreEncounter::Appointments::V1::Types::Appointment>]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.appointments.v_1.get_history(id: "id")
          def get_history(id:, request_options: nil)
            response = @request_client.conn.get do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.url "#{@request_client.get_url(environment: PreEncounter,
                                                 request_options: request_options)}/appointments/v1/#{id}/history"
            end
            parsed_json = JSON.parse(response.body)
            parsed_json&.map do |item|
              item = item.to_json
              CandidApiClient::PreEncounter::Appointments::V1::Types::Appointment.from_json(json_object: item)
            end
          end

          # Updates an appointment. The path must contain the next version number to prevent
          #  race conditions. For example, if the current version of the appointment is n,
          #  you will need to send a request to this endpoint with `/{id}/n+1` to update the
          #  appointment. Updating historic versions is not supported.
          #
          # @param id [String]
          # @param version [String]
          # @param request [Hash] Request of type CandidApiClient::PreEncounter::Appointments::V1::Types::MutableAppointment, as a Hash
          #   * :patient_id (String)
          #   * :start_timestamp (DateTime)
          #   * :status (CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentStatus)
          #   * :service_duration (Integer)
          #   * :services (Array<CandidApiClient::PreEncounter::Appointments::V1::Types::Service>)
          #   * :placer_appointment_id (String)
          #   * :attending_doctor (Hash)
          #     * :name (Hash)
          #       * :family (String)
          #       * :given (Array<String>)
          #       * :use (CandidApiClient::PreEncounter::Common::Types::NameUse)
          #       * :period (Hash)
          #         * :start (Date)
          #         * :end_ (Date)
          #       * :suffix (String)
          #     * :type (CandidApiClient::PreEncounter::Common::Types::ExternalProviderType)
          #     * :npi (String)
          #     * :telecoms (Array<CandidApiClient::PreEncounter::Common::Types::ContactPoint>)
          #     * :addresses (Array<CandidApiClient::PreEncounter::Common::Types::Address>)
          #     * :period (Hash)
          #       * :start (Date)
          #       * :end_ (Date)
          #     * :canonical_id (String)
          #     * :fax (String)
          #   * :estimated_copay_cents (Integer)
          #   * :estimated_patient_responsibility_cents (Integer)
          #   * :patient_deposit_cents (Integer)
          #   * :checked_in_timestamp (DateTime)
          #   * :notes (String)
          #   * :location_resource_id (String)
          #   * :automated_eligibility_check_complete (Boolean)
          #   * :work_queue (CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentWorkQueue)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Appointments::V1::Types::Appointment]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.appointments.v_1.update(
          #    id: "id",
          #    version: "version",
          #    request: { patient_id: "patient_id", start_timestamp: DateTime.parse(2024-01-15T09:30:00.000Z), service_duration: 1, services: [{  }, {  }] }
          #  )
          def update(id:, version:, request:, request_options: nil)
            response = @request_client.conn.put do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
              req.url "#{@request_client.get_url(environment: PreEncounter,
                                                 request_options: request_options)}/appointments/v1/#{id}/#{version}"
            end
            CandidApiClient::PreEncounter::Appointments::V1::Types::Appointment.from_json(json_object: response.body)
          end

          # Scans up to 100 appointment updates.  The since query parameter is inclusive,
          #  and the result list is ordered by updatedAt ascending.
          #
          # @param since [DateTime]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Array<CandidApiClient::PreEncounter::Appointments::V1::Types::Appointment>]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.appointments.v_1.scan(since: DateTime.parse(2024-01-15T09:30:00.000Z))
          def scan(since:, request_options: nil)
            response = @request_client.conn.get do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.params = { **(request_options&.additional_query_parameters || {}), "since": since }.compact
              req.url "#{@request_client.get_url(environment: PreEncounter,
                                                 request_options: request_options)}/appointments/v1/updates/scan"
            end
            parsed_json = JSON.parse(response.body)
            parsed_json&.map do |item|
              item = item.to_json
              CandidApiClient::PreEncounter::Appointments::V1::Types::Appointment.from_json(json_object: item)
            end
          end

          # Sets an appointment as deactivated.  The path must contain the most recent
          #  version to prevent race conditions.  Deactivating historic versions is not
          #  supported. Subsequent updates via PUT to the appointment will "reactivate" the
          #  appointment and set the deactivated flag to false.
          #
          # @param id [String]
          # @param version [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Void]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.appointments.v_1.deactivate(id: "id", version: "version")
          def deactivate(id:, version:, request_options: nil)
            @request_client.conn.delete do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.url "#{@request_client.get_url(environment: PreEncounter,
                                                 request_options: request_options)}/appointments/v1/#{id}/#{version}"
            end
          end
        end

        class AsyncV1Client
          # @return [CandidApiClient::AsyncRequestClient]
          attr_reader :request_client

          # @param request_client [CandidApiClient::AsyncRequestClient]
          # @return [CandidApiClient::PreEncounter::Appointments::V1::AsyncV1Client]
          def initialize(request_client:)
            @request_client = request_client
          end

          # Adds an appointment.  VersionConflictError is returned when the
          #  placer_appointment_id is already in use.
          #
          # @param request [Hash] Request of type CandidApiClient::PreEncounter::Appointments::V1::Types::MutableAppointment, as a Hash
          #   * :patient_id (String)
          #   * :start_timestamp (DateTime)
          #   * :status (CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentStatus)
          #   * :service_duration (Integer)
          #   * :services (Array<CandidApiClient::PreEncounter::Appointments::V1::Types::Service>)
          #   * :placer_appointment_id (String)
          #   * :attending_doctor (Hash)
          #     * :name (Hash)
          #       * :family (String)
          #       * :given (Array<String>)
          #       * :use (CandidApiClient::PreEncounter::Common::Types::NameUse)
          #       * :period (Hash)
          #         * :start (Date)
          #         * :end_ (Date)
          #       * :suffix (String)
          #     * :type (CandidApiClient::PreEncounter::Common::Types::ExternalProviderType)
          #     * :npi (String)
          #     * :telecoms (Array<CandidApiClient::PreEncounter::Common::Types::ContactPoint>)
          #     * :addresses (Array<CandidApiClient::PreEncounter::Common::Types::Address>)
          #     * :period (Hash)
          #       * :start (Date)
          #       * :end_ (Date)
          #     * :canonical_id (String)
          #     * :fax (String)
          #   * :estimated_copay_cents (Integer)
          #   * :estimated_patient_responsibility_cents (Integer)
          #   * :patient_deposit_cents (Integer)
          #   * :checked_in_timestamp (DateTime)
          #   * :notes (String)
          #   * :location_resource_id (String)
          #   * :automated_eligibility_check_complete (Boolean)
          #   * :work_queue (CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentWorkQueue)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Appointments::V1::Types::Appointment]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.appointments.v_1.create(request: { patient_id: "patient_id", start_timestamp: DateTime.parse(2024-01-15T09:30:00.000Z), service_duration: 1, services: [{  }, {  }] })
          def create(request:, request_options: nil)
            Async do
              response = @request_client.conn.post do |req|
                req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
                req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
                req.headers = {
              **(req.headers || {}),
              **@request_client.get_headers,
              **(request_options&.additional_headers || {})
                }.compact
                req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
                req.url "#{@request_client.get_url(environment: PreEncounter,
                                                   request_options: request_options)}/appointments/v1"
              end
              CandidApiClient::PreEncounter::Appointments::V1::Types::Appointment.from_json(json_object: response.body)
            end
          end

          # Gets all Visits within a given time range. The return list is ordered by
          #  start_time ascending.
          #
          # @param page_token [String]
          # @param limit [Integer]
          # @param sort_field [String] Defaults to appointment.start_time.
          # @param sort_direction [CandidApiClient::PreEncounter::Common::Types::SortDirection] Defaults to ascending.
          # @param filters [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Appointments::V1::Types::VisitsPage]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.appointments.v_1.get_visits
          def get_visits(page_token: nil, limit: nil, sort_field: nil, sort_direction: nil, filters: nil,
                         request_options: nil)
            Async do
              response = @request_client.conn.get do |req|
                req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
                req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
                req.headers = {
              **(req.headers || {}),
              **@request_client.get_headers,
              **(request_options&.additional_headers || {})
                }.compact
                req.params = {
                  **(request_options&.additional_query_parameters || {}),
                  "page_token": page_token,
                  "limit": limit,
                  "sort_field": sort_field,
                  "sort_direction": sort_direction,
                  "filters": filters
                }.compact
                req.url "#{@request_client.get_url(environment: PreEncounter,
                                                   request_options: request_options)}/appointments/v1/visits"
              end
              CandidApiClient::PreEncounter::Appointments::V1::Types::VisitsPage.from_json(json_object: response.body)
            end
          end

          # Gets an appointment.
          #
          # @param id [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Appointments::V1::Types::Appointment]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.appointments.v_1.get(id: "id")
          def get(id:, request_options: nil)
            Async do
              response = @request_client.conn.get do |req|
                req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
                req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
                req.headers = {
              **(req.headers || {}),
              **@request_client.get_headers,
              **(request_options&.additional_headers || {})
                }.compact
                req.url "#{@request_client.get_url(environment: PreEncounter,
                                                   request_options: request_options)}/appointments/v1/#{id}"
              end
              CandidApiClient::PreEncounter::Appointments::V1::Types::Appointment.from_json(json_object: response.body)
            end
          end

          # Gets an appointment along with it's full history.  The return list is ordered by
          #  version ascending.
          #
          # @param id [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Array<CandidApiClient::PreEncounter::Appointments::V1::Types::Appointment>]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.appointments.v_1.get_history(id: "id")
          def get_history(id:, request_options: nil)
            Async do
              response = @request_client.conn.get do |req|
                req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
                req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
                req.headers = {
              **(req.headers || {}),
              **@request_client.get_headers,
              **(request_options&.additional_headers || {})
                }.compact
                req.url "#{@request_client.get_url(environment: PreEncounter,
                                                   request_options: request_options)}/appointments/v1/#{id}/history"
              end
              parsed_json = JSON.parse(response.body)
              parsed_json&.map do |item|
                item = item.to_json
                CandidApiClient::PreEncounter::Appointments::V1::Types::Appointment.from_json(json_object: item)
              end
            end
          end

          # Updates an appointment. The path must contain the next version number to prevent
          #  race conditions. For example, if the current version of the appointment is n,
          #  you will need to send a request to this endpoint with `/{id}/n+1` to update the
          #  appointment. Updating historic versions is not supported.
          #
          # @param id [String]
          # @param version [String]
          # @param request [Hash] Request of type CandidApiClient::PreEncounter::Appointments::V1::Types::MutableAppointment, as a Hash
          #   * :patient_id (String)
          #   * :start_timestamp (DateTime)
          #   * :status (CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentStatus)
          #   * :service_duration (Integer)
          #   * :services (Array<CandidApiClient::PreEncounter::Appointments::V1::Types::Service>)
          #   * :placer_appointment_id (String)
          #   * :attending_doctor (Hash)
          #     * :name (Hash)
          #       * :family (String)
          #       * :given (Array<String>)
          #       * :use (CandidApiClient::PreEncounter::Common::Types::NameUse)
          #       * :period (Hash)
          #         * :start (Date)
          #         * :end_ (Date)
          #       * :suffix (String)
          #     * :type (CandidApiClient::PreEncounter::Common::Types::ExternalProviderType)
          #     * :npi (String)
          #     * :telecoms (Array<CandidApiClient::PreEncounter::Common::Types::ContactPoint>)
          #     * :addresses (Array<CandidApiClient::PreEncounter::Common::Types::Address>)
          #     * :period (Hash)
          #       * :start (Date)
          #       * :end_ (Date)
          #     * :canonical_id (String)
          #     * :fax (String)
          #   * :estimated_copay_cents (Integer)
          #   * :estimated_patient_responsibility_cents (Integer)
          #   * :patient_deposit_cents (Integer)
          #   * :checked_in_timestamp (DateTime)
          #   * :notes (String)
          #   * :location_resource_id (String)
          #   * :automated_eligibility_check_complete (Boolean)
          #   * :work_queue (CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentWorkQueue)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Appointments::V1::Types::Appointment]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.appointments.v_1.update(
          #    id: "id",
          #    version: "version",
          #    request: { patient_id: "patient_id", start_timestamp: DateTime.parse(2024-01-15T09:30:00.000Z), service_duration: 1, services: [{  }, {  }] }
          #  )
          def update(id:, version:, request:, request_options: nil)
            Async do
              response = @request_client.conn.put do |req|
                req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
                req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
                req.headers = {
              **(req.headers || {}),
              **@request_client.get_headers,
              **(request_options&.additional_headers || {})
                }.compact
                req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
                req.url "#{@request_client.get_url(environment: PreEncounter,
                                                   request_options: request_options)}/appointments/v1/#{id}/#{version}"
              end
              CandidApiClient::PreEncounter::Appointments::V1::Types::Appointment.from_json(json_object: response.body)
            end
          end

          # Scans up to 100 appointment updates.  The since query parameter is inclusive,
          #  and the result list is ordered by updatedAt ascending.
          #
          # @param since [DateTime]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Array<CandidApiClient::PreEncounter::Appointments::V1::Types::Appointment>]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.appointments.v_1.scan(since: DateTime.parse(2024-01-15T09:30:00.000Z))
          def scan(since:, request_options: nil)
            Async do
              response = @request_client.conn.get do |req|
                req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
                req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
                req.headers = {
              **(req.headers || {}),
              **@request_client.get_headers,
              **(request_options&.additional_headers || {})
                }.compact
                req.params = { **(request_options&.additional_query_parameters || {}), "since": since }.compact
                req.url "#{@request_client.get_url(environment: PreEncounter,
                                                   request_options: request_options)}/appointments/v1/updates/scan"
              end
              parsed_json = JSON.parse(response.body)
              parsed_json&.map do |item|
                item = item.to_json
                CandidApiClient::PreEncounter::Appointments::V1::Types::Appointment.from_json(json_object: item)
              end
            end
          end

          # Sets an appointment as deactivated.  The path must contain the most recent
          #  version to prevent race conditions.  Deactivating historic versions is not
          #  supported. Subsequent updates via PUT to the appointment will "reactivate" the
          #  appointment and set the deactivated flag to false.
          #
          # @param id [String]
          # @param version [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Void]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.appointments.v_1.deactivate(id: "id", version: "version")
          def deactivate(id:, version:, request_options: nil)
            Async do
              @request_client.conn.delete do |req|
                req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
                req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
                req.headers = {
              **(req.headers || {}),
              **@request_client.get_headers,
              **(request_options&.additional_headers || {})
                }.compact
                req.url "#{@request_client.get_url(environment: PreEncounter,
                                                   request_options: request_options)}/appointments/v1/#{id}/#{version}"
              end
            end
          end
        end
      end
    end
  end
end
