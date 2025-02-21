# frozen_string_literal: true

require_relative "../../../appointments/v_1/types/appointment"
require_relative "../../../patients/v_1/types/mutable_patient_with_mrn"
require_relative "../../../coverages/v_1/types/mutable_coverage"
require_relative "../../../appointments/v_1/types/universal_service_identifier"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Lists
      module V1
        module Types
          class AppointmentListItem
            # @return [CandidApiClient::PreEncounter::Appointments::V1::Types::Appointment]
            attr_reader :appointment
            # @return [CandidApiClient::PreEncounter::Patients::V1::Types::MutablePatientWithMrn]
            attr_reader :patient
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::MutableCoverage]
            attr_reader :primary_coverage
            # @return [CandidApiClient::PreEncounter::Appointments::V1::Types::UniversalServiceIdentifier]
            attr_reader :primary_service_type
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param appointment [CandidApiClient::PreEncounter::Appointments::V1::Types::Appointment]
            # @param patient [CandidApiClient::PreEncounter::Patients::V1::Types::MutablePatientWithMrn]
            # @param primary_coverage [CandidApiClient::PreEncounter::Coverages::V1::Types::MutableCoverage]
            # @param primary_service_type [CandidApiClient::PreEncounter::Appointments::V1::Types::UniversalServiceIdentifier]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Lists::V1::Types::AppointmentListItem]
            def initialize(appointment:, patient:, primary_coverage: OMIT, primary_service_type: OMIT,
                           additional_properties: nil)
              @appointment = appointment
              @patient = patient
              @primary_coverage = primary_coverage if primary_coverage != OMIT
              @primary_service_type = primary_service_type if primary_service_type != OMIT
              @additional_properties = additional_properties
              @_field_set = {
                "appointment": appointment,
                "patient": patient,
                "primary_coverage": primary_coverage,
                "primary_service_type": primary_service_type
              }.reject do |_k, v|
                v == OMIT
              end
            end

            # Deserialize a JSON object to an instance of AppointmentListItem
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Lists::V1::Types::AppointmentListItem]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              parsed_json = JSON.parse(json_object)
              if parsed_json["appointment"].nil?
                appointment = nil
              else
                appointment = parsed_json["appointment"].to_json
                appointment = CandidApiClient::PreEncounter::Appointments::V1::Types::Appointment.from_json(json_object: appointment)
              end
              if parsed_json["patient"].nil?
                patient = nil
              else
                patient = parsed_json["patient"].to_json
                patient = CandidApiClient::PreEncounter::Patients::V1::Types::MutablePatientWithMrn.from_json(json_object: patient)
              end
              if parsed_json["primary_coverage"].nil?
                primary_coverage = nil
              else
                primary_coverage = parsed_json["primary_coverage"].to_json
                primary_coverage = CandidApiClient::PreEncounter::Coverages::V1::Types::MutableCoverage.from_json(json_object: primary_coverage)
              end
              primary_service_type = struct["primary_service_type"]
              new(
                appointment: appointment,
                patient: patient,
                primary_coverage: primary_coverage,
                primary_service_type: primary_service_type,
                additional_properties: struct
              )
            end

            # Serialize an instance of AppointmentListItem to a JSON object
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
              CandidApiClient::PreEncounter::Appointments::V1::Types::Appointment.validate_raw(obj: obj.appointment)
              CandidApiClient::PreEncounter::Patients::V1::Types::MutablePatientWithMrn.validate_raw(obj: obj.patient)
              obj.primary_coverage.nil? || CandidApiClient::PreEncounter::Coverages::V1::Types::MutableCoverage.validate_raw(obj: obj.primary_coverage)
              obj.primary_service_type&.is_a?(CandidApiClient::PreEncounter::Appointments::V1::Types::UniversalServiceIdentifier) != false || raise("Passed value for field obj.primary_service_type is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
