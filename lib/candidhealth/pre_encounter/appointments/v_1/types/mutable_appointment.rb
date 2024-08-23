# frozen_string_literal: true

require_relative "../../../common/types/external_provider"
require "date"
require_relative "service"
require_relative "appointment_reason"
require_relative "appointment_type"
require_relative "appointment_work_queue"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Appointments
      module V1
        module Types
          # An object representing a appointment.
          class MutableAppointment
            # @return [String] The Candid-defined patient identifier.
            attr_reader :patient_id
            # @return [Boolean] True if the patient has checked in. Defaults to false.
            attr_reader :checked_in
            # @return [String] Patient’s initial assigned location or the location to which the patient is
            #  being moved. This location is stored on the Patient Demographics tab and is used
            #  when creating orders.
            attr_reader :assigned_patient_location
            # @return [CandidApiClient::PreEncounter::Common::Types::ExternalProvider] Attending physician information. The attending physician will be stored as the
            #  Current MD for the patient.
            attr_reader :attending_doctor
            # @return [CandidApiClient::PreEncounter::Common::Types::ExternalProvider] Referring physician information. The referring physician will be stored as the
            #  Referring MD in the patient’s Providers list.
            attr_reader :referring_doctor
            # @return [DateTime]
            attr_reader :start_timestamp
            # @return [Integer] The requested length of time allotted for the appointment. The units are in
            #  minutes.
            attr_reader :service_duration
            # @return [Array<CandidApiClient::PreEncounter::Appointments::V1::Types::Service>]
            attr_reader :services
            # @return [String] ID for the appointment/order for the event.
            attr_reader :placer_appointment_id
            # @return [CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentReason]
            attr_reader :appointment_reason
            # @return [CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentType] Contains the identifier code for the appointment.
            attr_reader :appointment_type
            # @return [String] Contains the coded identification of the location being scheduled. Components:
            #  <Identifier (ST)>^<Text (ST)>
            attr_reader :location_resource_id
            # @return [CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentWorkQueue] The work queue that the appointment belongs to. It is not recommended to change
            #  this value manually via API.
            attr_reader :work_queue
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param patient_id [String] The Candid-defined patient identifier.
            # @param checked_in [Boolean] True if the patient has checked in. Defaults to false.
            # @param assigned_patient_location [String] Patient’s initial assigned location or the location to which the patient is
            #  being moved. This location is stored on the Patient Demographics tab and is used
            #  when creating orders.
            # @param attending_doctor [CandidApiClient::PreEncounter::Common::Types::ExternalProvider] Attending physician information. The attending physician will be stored as the
            #  Current MD for the patient.
            # @param referring_doctor [CandidApiClient::PreEncounter::Common::Types::ExternalProvider] Referring physician information. The referring physician will be stored as the
            #  Referring MD in the patient’s Providers list.
            # @param start_timestamp [DateTime]
            # @param service_duration [Integer] The requested length of time allotted for the appointment. The units are in
            #  minutes.
            # @param services [Array<CandidApiClient::PreEncounter::Appointments::V1::Types::Service>]
            # @param placer_appointment_id [String] ID for the appointment/order for the event.
            # @param appointment_reason [CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentReason]
            # @param appointment_type [CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentType] Contains the identifier code for the appointment.
            # @param location_resource_id [String] Contains the coded identification of the location being scheduled. Components:
            #  <Identifier (ST)>^<Text (ST)>
            # @param work_queue [CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentWorkQueue] The work queue that the appointment belongs to. It is not recommended to change
            #  this value manually via API.
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Appointments::V1::Types::MutableAppointment]
            def initialize(patient_id:, service_duration:, services:, checked_in: OMIT, assigned_patient_location: OMIT, attending_doctor: OMIT,
                           referring_doctor: OMIT, start_timestamp: OMIT, placer_appointment_id: OMIT, appointment_reason: OMIT, appointment_type: OMIT, location_resource_id: OMIT, work_queue: OMIT, additional_properties: nil)
              @patient_id = patient_id
              @checked_in = checked_in if checked_in != OMIT
              @assigned_patient_location = assigned_patient_location if assigned_patient_location != OMIT
              @attending_doctor = attending_doctor if attending_doctor != OMIT
              @referring_doctor = referring_doctor if referring_doctor != OMIT
              @start_timestamp = start_timestamp if start_timestamp != OMIT
              @service_duration = service_duration
              @services = services
              @placer_appointment_id = placer_appointment_id if placer_appointment_id != OMIT
              @appointment_reason = appointment_reason if appointment_reason != OMIT
              @appointment_type = appointment_type if appointment_type != OMIT
              @location_resource_id = location_resource_id if location_resource_id != OMIT
              @work_queue = work_queue if work_queue != OMIT
              @additional_properties = additional_properties
              @_field_set = {
                "patient_id": patient_id,
                "checked_in": checked_in,
                "assigned_patient_location": assigned_patient_location,
                "attending_doctor": attending_doctor,
                "referring_doctor": referring_doctor,
                "start_timestamp": start_timestamp,
                "service_duration": service_duration,
                "services": services,
                "placer_appointment_id": placer_appointment_id,
                "appointment_reason": appointment_reason,
                "appointment_type": appointment_type,
                "location_resource_id": location_resource_id,
                "work_queue": work_queue
              }.reject do |_k, v|
                v == OMIT
              end
            end

            # Deserialize a JSON object to an instance of MutableAppointment
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Appointments::V1::Types::MutableAppointment]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              parsed_json = JSON.parse(json_object)
              patient_id = struct["patient_id"]
              checked_in = struct["checked_in"]
              assigned_patient_location = struct["assigned_patient_location"]
              if parsed_json["attending_doctor"].nil?
                attending_doctor = nil
              else
                attending_doctor = parsed_json["attending_doctor"].to_json
                attending_doctor = CandidApiClient::PreEncounter::Common::Types::ExternalProvider.from_json(json_object: attending_doctor)
              end
              if parsed_json["referring_doctor"].nil?
                referring_doctor = nil
              else
                referring_doctor = parsed_json["referring_doctor"].to_json
                referring_doctor = CandidApiClient::PreEncounter::Common::Types::ExternalProvider.from_json(json_object: referring_doctor)
              end
              start_timestamp = unless parsed_json["start_timestamp"].nil?
                                  DateTime.parse(parsed_json["start_timestamp"])
                                end
              service_duration = struct["service_duration"]
              services = parsed_json["services"]&.map do |item|
                item = item.to_json
                CandidApiClient::PreEncounter::Appointments::V1::Types::Service.from_json(json_object: item)
              end
              placer_appointment_id = struct["placer_appointment_id"]
              appointment_reason = struct["appointment_reason"]
              appointment_type = struct["appointment_type"]
              location_resource_id = struct["location_resource_id"]
              work_queue = struct["work_queue"]
              new(
                patient_id: patient_id,
                checked_in: checked_in,
                assigned_patient_location: assigned_patient_location,
                attending_doctor: attending_doctor,
                referring_doctor: referring_doctor,
                start_timestamp: start_timestamp,
                service_duration: service_duration,
                services: services,
                placer_appointment_id: placer_appointment_id,
                appointment_reason: appointment_reason,
                appointment_type: appointment_type,
                location_resource_id: location_resource_id,
                work_queue: work_queue,
                additional_properties: struct
              )
            end

            # Serialize an instance of MutableAppointment to a JSON object
            #
            # @return [String]
            def to_json(*_args)
              @_field_set&.to_json
            end

            # Leveraged for Union-type generation, validate_raw attempts to parse the given
            #  hash and check each fields type against the current object's property
            #  definitions.
            #
            # @param obj [Object]
            # @return [Void]
            def self.validate_raw(obj:)
              obj.patient_id.is_a?(String) != false || raise("Passed value for field obj.patient_id is not the expected type, validation failed.")
              obj.checked_in&.is_a?(Boolean) != false || raise("Passed value for field obj.checked_in is not the expected type, validation failed.")
              obj.assigned_patient_location&.is_a?(String) != false || raise("Passed value for field obj.assigned_patient_location is not the expected type, validation failed.")
              obj.attending_doctor.nil? || CandidApiClient::PreEncounter::Common::Types::ExternalProvider.validate_raw(obj: obj.attending_doctor)
              obj.referring_doctor.nil? || CandidApiClient::PreEncounter::Common::Types::ExternalProvider.validate_raw(obj: obj.referring_doctor)
              obj.start_timestamp&.is_a?(DateTime) != false || raise("Passed value for field obj.start_timestamp is not the expected type, validation failed.")
              obj.service_duration.is_a?(Integer) != false || raise("Passed value for field obj.service_duration is not the expected type, validation failed.")
              obj.services.is_a?(Array) != false || raise("Passed value for field obj.services is not the expected type, validation failed.")
              obj.placer_appointment_id&.is_a?(String) != false || raise("Passed value for field obj.placer_appointment_id is not the expected type, validation failed.")
              obj.appointment_reason&.is_a?(CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentReason) != false || raise("Passed value for field obj.appointment_reason is not the expected type, validation failed.")
              obj.appointment_type&.is_a?(CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentType) != false || raise("Passed value for field obj.appointment_type is not the expected type, validation failed.")
              obj.location_resource_id&.is_a?(String) != false || raise("Passed value for field obj.location_resource_id is not the expected type, validation failed.")
              obj.work_queue&.is_a?(CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentWorkQueue) != false || raise("Passed value for field obj.work_queue is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
