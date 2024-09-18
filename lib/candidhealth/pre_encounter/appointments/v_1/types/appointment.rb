# frozen_string_literal: true

require "date"
require_relative "appointment_status"
require_relative "service"
require_relative "appointment_work_queue"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Appointments
      module V1
        module Types
          # An appointment object with immutable server-owned properties.
          class Appointment
            # @return [String]
            attr_reader :id
            # @return [String] The organization that owns this appointment.
            attr_reader :organization_id
            # @return [Boolean] True if the appointment is deactivated. Deactivated appointments are not
            #  returned in search results but are returned in all other endpoints including
            #  scan.
            attr_reader :deactivated
            # @return [Integer] The version of the appointment. Any update to any property of an appointment
            #  object will create a new version.
            attr_reader :version
            # @return [DateTime]
            attr_reader :updated_at
            # @return [String] The user ID of the user who last updated the appointment.
            attr_reader :updating_user_id
            # @return [String] The Candid-defined patient identifier.
            attr_reader :patient_id
            # @return [DateTime]
            attr_reader :start_timestamp
            # @return [CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentStatus] Defaults to PENDING. If status is NOT_READY, work_queue must be set. If status
            #  is READY or CHECKED_IN, work_queue must be null. If status is CHECKED_IN,
            #  checked_in_timestamp must be set. If checked_in_timestamp is set, status must be
            #  CHECKED_IN.
            attr_reader :status
            # @return [Integer] The requested length of time allotted for the appointment. The units are in
            #  minutes.
            attr_reader :service_duration
            # @return [Array<CandidApiClient::PreEncounter::Appointments::V1::Types::Service>]
            attr_reader :services
            # @return [String] ID for the appointment/order for the event.
            attr_reader :placer_appointment_id
            # @return [Integer]
            attr_reader :estimated_copay_cents
            # @return [Integer]
            attr_reader :estimated_patient_responsibility_cents
            # @return [Integer]
            attr_reader :patient_deposit_cents
            # @return [DateTime] The timestamp when the patient checked in for their appointment. If status is
            #  CHECKED_IN, checked_in_timestamp must be set. If checked_in_timestamp is set,
            #  status must be CHECKED_IN.
            attr_reader :checked_in_timestamp
            # @return [String]
            attr_reader :notes
            # @return [String] Contains the coded identification of the location being scheduled. Components:
            #  <Identifier (ST)>^<Text (ST)>
            attr_reader :location_resource_id
            # @return [Boolean] True if the automated eligibility check has been completed. It is not
            #  recommended to change this value manually via API. This refers explicitly to the
            #  automated eligibility check that occurs a specific number of days before the
            #  appointment.
            attr_reader :automated_eligibility_check_complete
            # @return [CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentWorkQueue] The work queue that the appointment belongs to. It is not recommended to change
            #  this value manually via API. If status is NOT_READY, work_queue must be set. If
            #  status is READY or CHECKED_IN, work_queue must be null.
            attr_reader :work_queue
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param id [String]
            # @param organization_id [String] The organization that owns this appointment.
            # @param deactivated [Boolean] True if the appointment is deactivated. Deactivated appointments are not
            #  returned in search results but are returned in all other endpoints including
            #  scan.
            # @param version [Integer] The version of the appointment. Any update to any property of an appointment
            #  object will create a new version.
            # @param updated_at [DateTime]
            # @param updating_user_id [String] The user ID of the user who last updated the appointment.
            # @param patient_id [String] The Candid-defined patient identifier.
            # @param start_timestamp [DateTime]
            # @param status [CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentStatus] Defaults to PENDING. If status is NOT_READY, work_queue must be set. If status
            #  is READY or CHECKED_IN, work_queue must be null. If status is CHECKED_IN,
            #  checked_in_timestamp must be set. If checked_in_timestamp is set, status must be
            #  CHECKED_IN.
            # @param service_duration [Integer] The requested length of time allotted for the appointment. The units are in
            #  minutes.
            # @param services [Array<CandidApiClient::PreEncounter::Appointments::V1::Types::Service>]
            # @param placer_appointment_id [String] ID for the appointment/order for the event.
            # @param estimated_copay_cents [Integer]
            # @param estimated_patient_responsibility_cents [Integer]
            # @param patient_deposit_cents [Integer]
            # @param checked_in_timestamp [DateTime] The timestamp when the patient checked in for their appointment. If status is
            #  CHECKED_IN, checked_in_timestamp must be set. If checked_in_timestamp is set,
            #  status must be CHECKED_IN.
            # @param notes [String]
            # @param location_resource_id [String] Contains the coded identification of the location being scheduled. Components:
            #  <Identifier (ST)>^<Text (ST)>
            # @param automated_eligibility_check_complete [Boolean] True if the automated eligibility check has been completed. It is not
            #  recommended to change this value manually via API. This refers explicitly to the
            #  automated eligibility check that occurs a specific number of days before the
            #  appointment.
            # @param work_queue [CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentWorkQueue] The work queue that the appointment belongs to. It is not recommended to change
            #  this value manually via API. If status is NOT_READY, work_queue must be set. If
            #  status is READY or CHECKED_IN, work_queue must be null.
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Appointments::V1::Types::Appointment]
            def initialize(id:, organization_id:, deactivated:, version:, updated_at:, updating_user_id:, patient_id:,
                           start_timestamp:, service_duration:, services:, status: OMIT, placer_appointment_id: OMIT, estimated_copay_cents: OMIT, estimated_patient_responsibility_cents: OMIT, patient_deposit_cents: OMIT, checked_in_timestamp: OMIT, notes: OMIT, location_resource_id: OMIT, automated_eligibility_check_complete: OMIT, work_queue: OMIT, additional_properties: nil)
              @id = id
              @organization_id = organization_id
              @deactivated = deactivated
              @version = version
              @updated_at = updated_at
              @updating_user_id = updating_user_id
              @patient_id = patient_id
              @start_timestamp = start_timestamp
              @status = status if status != OMIT
              @service_duration = service_duration
              @services = services
              @placer_appointment_id = placer_appointment_id if placer_appointment_id != OMIT
              @estimated_copay_cents = estimated_copay_cents if estimated_copay_cents != OMIT
              if estimated_patient_responsibility_cents != OMIT
                @estimated_patient_responsibility_cents = estimated_patient_responsibility_cents
              end
              @patient_deposit_cents = patient_deposit_cents if patient_deposit_cents != OMIT
              @checked_in_timestamp = checked_in_timestamp if checked_in_timestamp != OMIT
              @notes = notes if notes != OMIT
              @location_resource_id = location_resource_id if location_resource_id != OMIT
              if automated_eligibility_check_complete != OMIT
                @automated_eligibility_check_complete = automated_eligibility_check_complete
              end
              @work_queue = work_queue if work_queue != OMIT
              @additional_properties = additional_properties
              @_field_set = {
                "id": id,
                "organization_id": organization_id,
                "deactivated": deactivated,
                "version": version,
                "updated_at": updated_at,
                "updating_user_id": updating_user_id,
                "patient_id": patient_id,
                "start_timestamp": start_timestamp,
                "status": status,
                "service_duration": service_duration,
                "services": services,
                "placer_appointment_id": placer_appointment_id,
                "estimated_copay_cents": estimated_copay_cents,
                "estimated_patient_responsibility_cents": estimated_patient_responsibility_cents,
                "patient_deposit_cents": patient_deposit_cents,
                "checked_in_timestamp": checked_in_timestamp,
                "notes": notes,
                "location_resource_id": location_resource_id,
                "automated_eligibility_check_complete": automated_eligibility_check_complete,
                "work_queue": work_queue
              }.reject do |_k, v|
                v == OMIT
              end
            end

            # Deserialize a JSON object to an instance of Appointment
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Appointments::V1::Types::Appointment]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              parsed_json = JSON.parse(json_object)
              id = struct["id"]
              organization_id = struct["organization_id"]
              deactivated = struct["deactivated"]
              version = struct["version"]
              updated_at = (DateTime.parse(parsed_json["updated_at"]) unless parsed_json["updated_at"].nil?)
              updating_user_id = struct["updating_user_id"]
              patient_id = struct["patient_id"]
              start_timestamp = unless parsed_json["start_timestamp"].nil?
                                  DateTime.parse(parsed_json["start_timestamp"])
                                end
              status = struct["status"]
              service_duration = struct["service_duration"]
              services = parsed_json["services"]&.map do |item|
                item = item.to_json
                CandidApiClient::PreEncounter::Appointments::V1::Types::Service.from_json(json_object: item)
              end
              placer_appointment_id = struct["placer_appointment_id"]
              estimated_copay_cents = struct["estimated_copay_cents"]
              estimated_patient_responsibility_cents = struct["estimated_patient_responsibility_cents"]
              patient_deposit_cents = struct["patient_deposit_cents"]
              checked_in_timestamp = unless parsed_json["checked_in_timestamp"].nil?
                                       DateTime.parse(parsed_json["checked_in_timestamp"])
                                     end
              notes = struct["notes"]
              location_resource_id = struct["location_resource_id"]
              automated_eligibility_check_complete = struct["automated_eligibility_check_complete"]
              work_queue = struct["work_queue"]
              new(
                id: id,
                organization_id: organization_id,
                deactivated: deactivated,
                version: version,
                updated_at: updated_at,
                updating_user_id: updating_user_id,
                patient_id: patient_id,
                start_timestamp: start_timestamp,
                status: status,
                service_duration: service_duration,
                services: services,
                placer_appointment_id: placer_appointment_id,
                estimated_copay_cents: estimated_copay_cents,
                estimated_patient_responsibility_cents: estimated_patient_responsibility_cents,
                patient_deposit_cents: patient_deposit_cents,
                checked_in_timestamp: checked_in_timestamp,
                notes: notes,
                location_resource_id: location_resource_id,
                automated_eligibility_check_complete: automated_eligibility_check_complete,
                work_queue: work_queue,
                additional_properties: struct
              )
            end

            # Serialize an instance of Appointment to a JSON object
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
              obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
              obj.organization_id.is_a?(String) != false || raise("Passed value for field obj.organization_id is not the expected type, validation failed.")
              obj.deactivated.is_a?(Boolean) != false || raise("Passed value for field obj.deactivated is not the expected type, validation failed.")
              obj.version.is_a?(Integer) != false || raise("Passed value for field obj.version is not the expected type, validation failed.")
              obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
              obj.updating_user_id.is_a?(String) != false || raise("Passed value for field obj.updating_user_id is not the expected type, validation failed.")
              obj.patient_id.is_a?(String) != false || raise("Passed value for field obj.patient_id is not the expected type, validation failed.")
              obj.start_timestamp.is_a?(DateTime) != false || raise("Passed value for field obj.start_timestamp is not the expected type, validation failed.")
              obj.status&.is_a?(CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
              obj.service_duration.is_a?(Integer) != false || raise("Passed value for field obj.service_duration is not the expected type, validation failed.")
              obj.services.is_a?(Array) != false || raise("Passed value for field obj.services is not the expected type, validation failed.")
              obj.placer_appointment_id&.is_a?(String) != false || raise("Passed value for field obj.placer_appointment_id is not the expected type, validation failed.")
              obj.estimated_copay_cents&.is_a?(Integer) != false || raise("Passed value for field obj.estimated_copay_cents is not the expected type, validation failed.")
              obj.estimated_patient_responsibility_cents&.is_a?(Integer) != false || raise("Passed value for field obj.estimated_patient_responsibility_cents is not the expected type, validation failed.")
              obj.patient_deposit_cents&.is_a?(Integer) != false || raise("Passed value for field obj.patient_deposit_cents is not the expected type, validation failed.")
              obj.checked_in_timestamp&.is_a?(DateTime) != false || raise("Passed value for field obj.checked_in_timestamp is not the expected type, validation failed.")
              obj.notes&.is_a?(String) != false || raise("Passed value for field obj.notes is not the expected type, validation failed.")
              obj.location_resource_id&.is_a?(String) != false || raise("Passed value for field obj.location_resource_id is not the expected type, validation failed.")
              obj.automated_eligibility_check_complete&.is_a?(Boolean) != false || raise("Passed value for field obj.automated_eligibility_check_complete is not the expected type, validation failed.")
              obj.work_queue&.is_a?(CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentWorkQueue) != false || raise("Passed value for field obj.work_queue is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
