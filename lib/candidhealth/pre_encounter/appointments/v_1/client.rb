# frozen_string_literal: true

require_relative "../../../../requests"
require_relative "types/mutable_appointment"
require_relative "types/appointment"
require "json"
require "date"
require_relative "types/appointment_work_queue"
require_relative "types/appointment_sort_field"
require_relative "../../common/types/sort_direction"
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

          # Adds an appointment. VersionConflictError is returned when the
          #  placer_appointment_id is already in use.
          #
          # @param request [Hash] Request of type CandidApiClient::PreEncounter::Appointments::V1::Types::MutableAppointment, as a Hash
          #   * :patient_id (String)
          #   * :checked_in (Boolean)
          #   * :assigned_patient_location (String)
          #   * :attending_doctor (Hash)
          #     * :name (Hash)
          #       * :family (String)
          #       * :given (Array<String>)
          #       * :use (CandidApiClient::PreEncounter::Common::Types::NameUse)
          #       * :period (Hash)
          #         * :start (Date)
          #         * :end_ (Date)
          #     * :type (CandidApiClient::PreEncounter::Common::Types::ExternalProviderType)
          #     * :npi (String)
          #     * :telecoms (Array<CandidApiClient::PreEncounter::Common::Types::ContactPoint>)
          #     * :addresses (Array<CandidApiClient::PreEncounter::Common::Types::Address>)
          #     * :period (Hash)
          #       * :start (Date)
          #       * :end_ (Date)
          #     * :canonical_id (String)
          #   * :referring_doctor (Hash)
          #     * :name (Hash)
          #       * :family (String)
          #       * :given (Array<String>)
          #       * :use (CandidApiClient::PreEncounter::Common::Types::NameUse)
          #       * :period (Hash)
          #         * :start (Date)
          #         * :end_ (Date)
          #     * :type (CandidApiClient::PreEncounter::Common::Types::ExternalProviderType)
          #     * :npi (String)
          #     * :telecoms (Array<CandidApiClient::PreEncounter::Common::Types::ContactPoint>)
          #     * :addresses (Array<CandidApiClient::PreEncounter::Common::Types::Address>)
          #     * :period (Hash)
          #       * :start (Date)
          #       * :end_ (Date)
          #     * :canonical_id (String)
          #   * :start_timestamp (DateTime)
          #   * :service_duration (Integer)
          #   * :services (Array<CandidApiClient::PreEncounter::Appointments::V1::Types::Service>)
          #   * :placer_appointment_id (String)
          #   * :appointment_reason (CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentReason)
          #   * :appointment_type (CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentType)
          #   * :location_resource_id (String)
          #   * :work_queue (CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentWorkQueue)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Appointments::V1::Types::Appointment]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.appointments.v_1.create(request: { patient_id: "string", checked_in: true, assigned_patient_location: "string", attending_doctor: { name: { family: "string", given: ["string"], use: USUAL, period: { start: {"key":"value"}, end_: {"key":"value"} } }, type: PRIMARY, npi: "string", telecoms: [{ value: "string", use: HOME, period: {"key":"value"} }], addresses: [{"key":"value"}], period: { start: {"key":"value"}, end_: {"key":"value"} }, canonical_id: "string" }, referring_doctor: { name: { family: "string", given: ["string"], use: USUAL, period: { start: {"key":"value"}, end_: {"key":"value"} } }, type: PRIMARY, npi: "string", telecoms: [{ value: "string", use: HOME, period: {"key":"value"} }], addresses: [{"key":"value"}], period: { start: {"key":"value"}, end_: {"key":"value"} }, canonical_id: "string" }, start_timestamp: DateTime.parse(2024-01-15T09:30:00.000Z), service_duration: 1, services: [{ universal_service_identifier: MD_VISIT, start_timestamp: DateTime.parse(2024-01-15T09:30:00.000Z) }], placer_appointment_id: "string", appointment_reason: CHECKUP, appointment_type: COMPLETE, location_resource_id: "string", work_queue: EMERGENT_ISSUE })
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

          # Gets an appointment.
          #
          # @param id [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Appointments::V1::Types::Appointment]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.appointments.v_1.get(id: "string")
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

          # Gets an appointment along with it's full history. The return list is ordered by
          #  version ascending.
          #
          # @param id [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Array<CandidApiClient::PreEncounter::Appointments::V1::Types::Appointment>]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.appointments.v_1.get_history(id: "string")
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

          # Updates an appointment. The path must contain the most recent version to prevent
          #  race conditions. Updating historic versions is not supported.
          #
          # @param id [String]
          # @param version [String]
          # @param request [Hash] Request of type CandidApiClient::PreEncounter::Appointments::V1::Types::MutableAppointment, as a Hash
          #   * :patient_id (String)
          #   * :checked_in (Boolean)
          #   * :assigned_patient_location (String)
          #   * :attending_doctor (Hash)
          #     * :name (Hash)
          #       * :family (String)
          #       * :given (Array<String>)
          #       * :use (CandidApiClient::PreEncounter::Common::Types::NameUse)
          #       * :period (Hash)
          #         * :start (Date)
          #         * :end_ (Date)
          #     * :type (CandidApiClient::PreEncounter::Common::Types::ExternalProviderType)
          #     * :npi (String)
          #     * :telecoms (Array<CandidApiClient::PreEncounter::Common::Types::ContactPoint>)
          #     * :addresses (Array<CandidApiClient::PreEncounter::Common::Types::Address>)
          #     * :period (Hash)
          #       * :start (Date)
          #       * :end_ (Date)
          #     * :canonical_id (String)
          #   * :referring_doctor (Hash)
          #     * :name (Hash)
          #       * :family (String)
          #       * :given (Array<String>)
          #       * :use (CandidApiClient::PreEncounter::Common::Types::NameUse)
          #       * :period (Hash)
          #         * :start (Date)
          #         * :end_ (Date)
          #     * :type (CandidApiClient::PreEncounter::Common::Types::ExternalProviderType)
          #     * :npi (String)
          #     * :telecoms (Array<CandidApiClient::PreEncounter::Common::Types::ContactPoint>)
          #     * :addresses (Array<CandidApiClient::PreEncounter::Common::Types::Address>)
          #     * :period (Hash)
          #       * :start (Date)
          #       * :end_ (Date)
          #     * :canonical_id (String)
          #   * :start_timestamp (DateTime)
          #   * :service_duration (Integer)
          #   * :services (Array<CandidApiClient::PreEncounter::Appointments::V1::Types::Service>)
          #   * :placer_appointment_id (String)
          #   * :appointment_reason (CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentReason)
          #   * :appointment_type (CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentType)
          #   * :location_resource_id (String)
          #   * :work_queue (CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentWorkQueue)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Appointments::V1::Types::Appointment]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.appointments.v_1.update(
          #    id: "string",
          #    version: "string",
          #    request: { patient_id: "string", checked_in: true, assigned_patient_location: "string", attending_doctor: { name: { family: "string", given: ["string"], use: USUAL, period: { start: {"key":"value"}, end_: {"key":"value"} } }, type: PRIMARY, npi: "string", telecoms: [{ value: "string", use: HOME, period: {"key":"value"} }], addresses: [{"key":"value"}], period: { start: {"key":"value"}, end_: {"key":"value"} }, canonical_id: "string" }, referring_doctor: { name: { family: "string", given: ["string"], use: USUAL, period: { start: {"key":"value"}, end_: {"key":"value"} } }, type: PRIMARY, npi: "string", telecoms: [{ value: "string", use: HOME, period: {"key":"value"} }], addresses: [{"key":"value"}], period: { start: {"key":"value"}, end_: {"key":"value"} }, canonical_id: "string" }, start_timestamp: DateTime.parse(2024-01-15T09:30:00.000Z), service_duration: 1, services: [{ universal_service_identifier: MD_VISIT, start_timestamp: DateTime.parse(2024-01-15T09:30:00.000Z) }], placer_appointment_id: "string", appointment_reason: CHECKUP, appointment_type: COMPLETE, location_resource_id: "string", work_queue: EMERGENT_ISSUE }
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

          # Sets an appointment as deactivated. The path must contain the most recent
          #  version to prevent race conditions. Deactivating historic versions is not
          #  supported. Subsequent updates via PUT to the appointment will "reactivate" the
          #  appointment and set the deactivated flag to false.
          #
          # @param id [String]
          # @param version [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Void]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.appointments.v_1.deactivate(id: "string", version: "string")
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

          # Searches for appointments that match the query parameters.
          #
          # @param checked_in [Boolean]
          # @param patient_id [String]
          # @param min_start_timestamp [DateTime]
          # @param max_start_timestamp [DateTime]
          # @param placer_appointment_id [String]
          # @param work_queue [CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentWorkQueue]
          # @param sort_field [CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentSortField] Defaults to start_timestamp.
          # @param sort_direction [CandidApiClient::PreEncounter::Common::Types::SortDirection] Defaults to asc.
          # @param limit [Integer] Defaults to 1000.
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Array<CandidApiClient::PreEncounter::Appointments::V1::Types::Appointment>]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.appointments.v_1.get_multi(
          #    checked_in: true,
          #    patient_id: "string",
          #    min_start_timestamp: DateTime.parse(2024-01-15T09:30:00.000Z),
          #    max_start_timestamp: DateTime.parse(2024-01-15T09:30:00.000Z),
          #    placer_appointment_id: "string",
          #    work_queue: EMERGENT_ISSUE,
          #    sort_field: START_TIMESTAMP,
          #    sort_direction: ASC,
          #    limit: 1
          #  )
          def get_multi(checked_in: nil, patient_id: nil, min_start_timestamp: nil, max_start_timestamp: nil,
                        placer_appointment_id: nil, work_queue: nil, sort_field: nil, sort_direction: nil, limit: nil, request_options: nil)
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
                "checked_in": checked_in,
                "patient_id": patient_id,
                "min_start_timestamp": min_start_timestamp,
                "max_start_timestamp": max_start_timestamp,
                "placer_appointment_id": placer_appointment_id,
                "work_queue": work_queue,
                "sort_field": sort_field,
                "sort_direction": sort_direction,
                "limit": limit
              }.compact
              req.url "#{@request_client.get_url(environment: PreEncounter,
                                                 request_options: request_options)}/appointments/v1"
            end
            parsed_json = JSON.parse(response.body)
            parsed_json&.map do |item|
              item = item.to_json
              CandidApiClient::PreEncounter::Appointments::V1::Types::Appointment.from_json(json_object: item)
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

          # Adds an appointment. VersionConflictError is returned when the
          #  placer_appointment_id is already in use.
          #
          # @param request [Hash] Request of type CandidApiClient::PreEncounter::Appointments::V1::Types::MutableAppointment, as a Hash
          #   * :patient_id (String)
          #   * :checked_in (Boolean)
          #   * :assigned_patient_location (String)
          #   * :attending_doctor (Hash)
          #     * :name (Hash)
          #       * :family (String)
          #       * :given (Array<String>)
          #       * :use (CandidApiClient::PreEncounter::Common::Types::NameUse)
          #       * :period (Hash)
          #         * :start (Date)
          #         * :end_ (Date)
          #     * :type (CandidApiClient::PreEncounter::Common::Types::ExternalProviderType)
          #     * :npi (String)
          #     * :telecoms (Array<CandidApiClient::PreEncounter::Common::Types::ContactPoint>)
          #     * :addresses (Array<CandidApiClient::PreEncounter::Common::Types::Address>)
          #     * :period (Hash)
          #       * :start (Date)
          #       * :end_ (Date)
          #     * :canonical_id (String)
          #   * :referring_doctor (Hash)
          #     * :name (Hash)
          #       * :family (String)
          #       * :given (Array<String>)
          #       * :use (CandidApiClient::PreEncounter::Common::Types::NameUse)
          #       * :period (Hash)
          #         * :start (Date)
          #         * :end_ (Date)
          #     * :type (CandidApiClient::PreEncounter::Common::Types::ExternalProviderType)
          #     * :npi (String)
          #     * :telecoms (Array<CandidApiClient::PreEncounter::Common::Types::ContactPoint>)
          #     * :addresses (Array<CandidApiClient::PreEncounter::Common::Types::Address>)
          #     * :period (Hash)
          #       * :start (Date)
          #       * :end_ (Date)
          #     * :canonical_id (String)
          #   * :start_timestamp (DateTime)
          #   * :service_duration (Integer)
          #   * :services (Array<CandidApiClient::PreEncounter::Appointments::V1::Types::Service>)
          #   * :placer_appointment_id (String)
          #   * :appointment_reason (CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentReason)
          #   * :appointment_type (CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentType)
          #   * :location_resource_id (String)
          #   * :work_queue (CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentWorkQueue)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Appointments::V1::Types::Appointment]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.appointments.v_1.create(request: { patient_id: "string", checked_in: true, assigned_patient_location: "string", attending_doctor: { name: { family: "string", given: ["string"], use: USUAL, period: { start: {"key":"value"}, end_: {"key":"value"} } }, type: PRIMARY, npi: "string", telecoms: [{ value: "string", use: HOME, period: {"key":"value"} }], addresses: [{"key":"value"}], period: { start: {"key":"value"}, end_: {"key":"value"} }, canonical_id: "string" }, referring_doctor: { name: { family: "string", given: ["string"], use: USUAL, period: { start: {"key":"value"}, end_: {"key":"value"} } }, type: PRIMARY, npi: "string", telecoms: [{ value: "string", use: HOME, period: {"key":"value"} }], addresses: [{"key":"value"}], period: { start: {"key":"value"}, end_: {"key":"value"} }, canonical_id: "string" }, start_timestamp: DateTime.parse(2024-01-15T09:30:00.000Z), service_duration: 1, services: [{ universal_service_identifier: MD_VISIT, start_timestamp: DateTime.parse(2024-01-15T09:30:00.000Z) }], placer_appointment_id: "string", appointment_reason: CHECKUP, appointment_type: COMPLETE, location_resource_id: "string", work_queue: EMERGENT_ISSUE })
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

          # Gets an appointment.
          #
          # @param id [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Appointments::V1::Types::Appointment]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.appointments.v_1.get(id: "string")
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

          # Gets an appointment along with it's full history. The return list is ordered by
          #  version ascending.
          #
          # @param id [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Array<CandidApiClient::PreEncounter::Appointments::V1::Types::Appointment>]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.appointments.v_1.get_history(id: "string")
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

          # Updates an appointment. The path must contain the most recent version to prevent
          #  race conditions. Updating historic versions is not supported.
          #
          # @param id [String]
          # @param version [String]
          # @param request [Hash] Request of type CandidApiClient::PreEncounter::Appointments::V1::Types::MutableAppointment, as a Hash
          #   * :patient_id (String)
          #   * :checked_in (Boolean)
          #   * :assigned_patient_location (String)
          #   * :attending_doctor (Hash)
          #     * :name (Hash)
          #       * :family (String)
          #       * :given (Array<String>)
          #       * :use (CandidApiClient::PreEncounter::Common::Types::NameUse)
          #       * :period (Hash)
          #         * :start (Date)
          #         * :end_ (Date)
          #     * :type (CandidApiClient::PreEncounter::Common::Types::ExternalProviderType)
          #     * :npi (String)
          #     * :telecoms (Array<CandidApiClient::PreEncounter::Common::Types::ContactPoint>)
          #     * :addresses (Array<CandidApiClient::PreEncounter::Common::Types::Address>)
          #     * :period (Hash)
          #       * :start (Date)
          #       * :end_ (Date)
          #     * :canonical_id (String)
          #   * :referring_doctor (Hash)
          #     * :name (Hash)
          #       * :family (String)
          #       * :given (Array<String>)
          #       * :use (CandidApiClient::PreEncounter::Common::Types::NameUse)
          #       * :period (Hash)
          #         * :start (Date)
          #         * :end_ (Date)
          #     * :type (CandidApiClient::PreEncounter::Common::Types::ExternalProviderType)
          #     * :npi (String)
          #     * :telecoms (Array<CandidApiClient::PreEncounter::Common::Types::ContactPoint>)
          #     * :addresses (Array<CandidApiClient::PreEncounter::Common::Types::Address>)
          #     * :period (Hash)
          #       * :start (Date)
          #       * :end_ (Date)
          #     * :canonical_id (String)
          #   * :start_timestamp (DateTime)
          #   * :service_duration (Integer)
          #   * :services (Array<CandidApiClient::PreEncounter::Appointments::V1::Types::Service>)
          #   * :placer_appointment_id (String)
          #   * :appointment_reason (CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentReason)
          #   * :appointment_type (CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentType)
          #   * :location_resource_id (String)
          #   * :work_queue (CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentWorkQueue)
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [CandidApiClient::PreEncounter::Appointments::V1::Types::Appointment]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.appointments.v_1.update(
          #    id: "string",
          #    version: "string",
          #    request: { patient_id: "string", checked_in: true, assigned_patient_location: "string", attending_doctor: { name: { family: "string", given: ["string"], use: USUAL, period: { start: {"key":"value"}, end_: {"key":"value"} } }, type: PRIMARY, npi: "string", telecoms: [{ value: "string", use: HOME, period: {"key":"value"} }], addresses: [{"key":"value"}], period: { start: {"key":"value"}, end_: {"key":"value"} }, canonical_id: "string" }, referring_doctor: { name: { family: "string", given: ["string"], use: USUAL, period: { start: {"key":"value"}, end_: {"key":"value"} } }, type: PRIMARY, npi: "string", telecoms: [{ value: "string", use: HOME, period: {"key":"value"} }], addresses: [{"key":"value"}], period: { start: {"key":"value"}, end_: {"key":"value"} }, canonical_id: "string" }, start_timestamp: DateTime.parse(2024-01-15T09:30:00.000Z), service_duration: 1, services: [{ universal_service_identifier: MD_VISIT, start_timestamp: DateTime.parse(2024-01-15T09:30:00.000Z) }], placer_appointment_id: "string", appointment_reason: CHECKUP, appointment_type: COMPLETE, location_resource_id: "string", work_queue: EMERGENT_ISSUE }
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

          # Sets an appointment as deactivated. The path must contain the most recent
          #  version to prevent race conditions. Deactivating historic versions is not
          #  supported. Subsequent updates via PUT to the appointment will "reactivate" the
          #  appointment and set the deactivated flag to false.
          #
          # @param id [String]
          # @param version [String]
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Void]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.appointments.v_1.deactivate(id: "string", version: "string")
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

          # Searches for appointments that match the query parameters.
          #
          # @param checked_in [Boolean]
          # @param patient_id [String]
          # @param min_start_timestamp [DateTime]
          # @param max_start_timestamp [DateTime]
          # @param placer_appointment_id [String]
          # @param work_queue [CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentWorkQueue]
          # @param sort_field [CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentSortField] Defaults to start_timestamp.
          # @param sort_direction [CandidApiClient::PreEncounter::Common::Types::SortDirection] Defaults to asc.
          # @param limit [Integer] Defaults to 1000.
          # @param request_options [CandidApiClient::RequestOptions]
          # @return [Array<CandidApiClient::PreEncounter::Appointments::V1::Types::Appointment>]
          # @example
          #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
          #  api.pre_encounter.appointments.v_1.get_multi(
          #    checked_in: true,
          #    patient_id: "string",
          #    min_start_timestamp: DateTime.parse(2024-01-15T09:30:00.000Z),
          #    max_start_timestamp: DateTime.parse(2024-01-15T09:30:00.000Z),
          #    placer_appointment_id: "string",
          #    work_queue: EMERGENT_ISSUE,
          #    sort_field: START_TIMESTAMP,
          #    sort_direction: ASC,
          #    limit: 1
          #  )
          def get_multi(checked_in: nil, patient_id: nil, min_start_timestamp: nil, max_start_timestamp: nil,
                        placer_appointment_id: nil, work_queue: nil, sort_field: nil, sort_direction: nil, limit: nil, request_options: nil)
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
                  "checked_in": checked_in,
                  "patient_id": patient_id,
                  "min_start_timestamp": min_start_timestamp,
                  "max_start_timestamp": max_start_timestamp,
                  "placer_appointment_id": placer_appointment_id,
                  "work_queue": work_queue,
                  "sort_field": sort_field,
                  "sort_direction": sort_direction,
                  "limit": limit
                }.compact
                req.url "#{@request_client.get_url(environment: PreEncounter,
                                                   request_options: request_options)}/appointments/v1"
              end
              parsed_json = JSON.parse(response.body)
              parsed_json&.map do |item|
                item = item.to_json
                CandidApiClient::PreEncounter::Appointments::V1::Types::Appointment.from_json(json_object: item)
              end
            end
          end
        end
      end
    end
  end
end
