# frozen_string_literal: true

require_relative "../../../../requests"
require_relative "types/mutable_appointment"
require_relative "types/appointment"
require "json"
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
          #   * :start_timestamp (DateTime)
          #   * :status (CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentStatus)
          #   * :service_duration (Integer)
          #   * :services (Array<CandidApiClient::PreEncounter::Appointments::V1::Types::Service>)
          #   * :placer_appointment_id (String)
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
          #  api.pre_encounter.appointments.v_1.create(request: { patient_id: "string", start_timestamp: DateTime.parse(2024-01-15T09:30:00.000Z), status: PENDING, service_duration: 1, services: [{ universal_service_identifier: MD_VISIT, start_timestamp: DateTime.parse(2024-01-15T09:30:00.000Z) }], placer_appointment_id: "string", estimated_copay_cents: 1, estimated_patient_responsibility_cents: 1, patient_deposit_cents: 1, checked_in_timestamp: DateTime.parse(2024-01-15T09:30:00.000Z), notes: "string", location_resource_id: "string", automated_eligibility_check_complete: true, work_queue: EMERGENT_ISSUE })
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
          #   * :start_timestamp (DateTime)
          #   * :status (CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentStatus)
          #   * :service_duration (Integer)
          #   * :services (Array<CandidApiClient::PreEncounter::Appointments::V1::Types::Service>)
          #   * :placer_appointment_id (String)
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
          #    id: "string",
          #    version: "string",
          #    request: { patient_id: "string", start_timestamp: DateTime.parse(2024-01-15T09:30:00.000Z), status: PENDING, service_duration: 1, services: [{ universal_service_identifier: MD_VISIT, start_timestamp: DateTime.parse(2024-01-15T09:30:00.000Z) }], placer_appointment_id: "string", estimated_copay_cents: 1, estimated_patient_responsibility_cents: 1, patient_deposit_cents: 1, checked_in_timestamp: DateTime.parse(2024-01-15T09:30:00.000Z), notes: "string", location_resource_id: "string", automated_eligibility_check_complete: true, work_queue: EMERGENT_ISSUE }
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
          #   * :start_timestamp (DateTime)
          #   * :status (CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentStatus)
          #   * :service_duration (Integer)
          #   * :services (Array<CandidApiClient::PreEncounter::Appointments::V1::Types::Service>)
          #   * :placer_appointment_id (String)
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
          #  api.pre_encounter.appointments.v_1.create(request: { patient_id: "string", start_timestamp: DateTime.parse(2024-01-15T09:30:00.000Z), status: PENDING, service_duration: 1, services: [{ universal_service_identifier: MD_VISIT, start_timestamp: DateTime.parse(2024-01-15T09:30:00.000Z) }], placer_appointment_id: "string", estimated_copay_cents: 1, estimated_patient_responsibility_cents: 1, patient_deposit_cents: 1, checked_in_timestamp: DateTime.parse(2024-01-15T09:30:00.000Z), notes: "string", location_resource_id: "string", automated_eligibility_check_complete: true, work_queue: EMERGENT_ISSUE })
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
          #   * :start_timestamp (DateTime)
          #   * :status (CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentStatus)
          #   * :service_duration (Integer)
          #   * :services (Array<CandidApiClient::PreEncounter::Appointments::V1::Types::Service>)
          #   * :placer_appointment_id (String)
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
          #    id: "string",
          #    version: "string",
          #    request: { patient_id: "string", start_timestamp: DateTime.parse(2024-01-15T09:30:00.000Z), status: PENDING, service_duration: 1, services: [{ universal_service_identifier: MD_VISIT, start_timestamp: DateTime.parse(2024-01-15T09:30:00.000Z) }], placer_appointment_id: "string", estimated_copay_cents: 1, estimated_patient_responsibility_cents: 1, patient_deposit_cents: 1, checked_in_timestamp: DateTime.parse(2024-01-15T09:30:00.000Z), notes: "string", location_resource_id: "string", automated_eligibility_check_complete: true, work_queue: EMERGENT_ISSUE }
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
        end
      end
    end
  end
end
