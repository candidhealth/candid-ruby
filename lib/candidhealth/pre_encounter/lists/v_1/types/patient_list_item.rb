# frozen_string_literal: true

require_relative "../../../patients/v_1/types/patient"
require_relative "../../../coverages/v_1/types/mutable_coverage"
require_relative "../../../appointments/v_1/types/mutable_appointment"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Lists
      module V1
        module Types
          class PatientListItem
            # @return [CandidApiClient::PreEncounter::Patients::V1::Types::Patient]
            attr_reader :patient
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::MutableCoverage]
            attr_reader :primary_coverage
            # @return [CandidApiClient::PreEncounter::Appointments::V1::Types::MutableAppointment]
            attr_reader :next_appointment
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param patient [CandidApiClient::PreEncounter::Patients::V1::Types::Patient]
            # @param primary_coverage [CandidApiClient::PreEncounter::Coverages::V1::Types::MutableCoverage]
            # @param next_appointment [CandidApiClient::PreEncounter::Appointments::V1::Types::MutableAppointment]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Lists::V1::Types::PatientListItem]
            def initialize(patient:, primary_coverage: OMIT, next_appointment: OMIT, additional_properties: nil)
              @patient = patient
              @primary_coverage = primary_coverage if primary_coverage != OMIT
              @next_appointment = next_appointment if next_appointment != OMIT
              @additional_properties = additional_properties
              @_field_set = {
                "patient": patient,
                "primary_coverage": primary_coverage,
                "next_appointment": next_appointment
              }.reject do |_k, v|
                v == OMIT
              end
            end

            # Deserialize a JSON object to an instance of PatientListItem
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Lists::V1::Types::PatientListItem]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              parsed_json = JSON.parse(json_object)
              if parsed_json["patient"].nil?
                patient = nil
              else
                patient = parsed_json["patient"].to_json
                patient = CandidApiClient::PreEncounter::Patients::V1::Types::Patient.from_json(json_object: patient)
              end
              if parsed_json["primary_coverage"].nil?
                primary_coverage = nil
              else
                primary_coverage = parsed_json["primary_coverage"].to_json
                primary_coverage = CandidApiClient::PreEncounter::Coverages::V1::Types::MutableCoverage.from_json(json_object: primary_coverage)
              end
              if parsed_json["next_appointment"].nil?
                next_appointment = nil
              else
                next_appointment = parsed_json["next_appointment"].to_json
                next_appointment = CandidApiClient::PreEncounter::Appointments::V1::Types::MutableAppointment.from_json(json_object: next_appointment)
              end
              new(
                patient: patient,
                primary_coverage: primary_coverage,
                next_appointment: next_appointment,
                additional_properties: struct
              )
            end

            # Serialize an instance of PatientListItem to a JSON object
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
              CandidApiClient::PreEncounter::Patients::V1::Types::Patient.validate_raw(obj: obj.patient)
              obj.primary_coverage.nil? || CandidApiClient::PreEncounter::Coverages::V1::Types::MutableCoverage.validate_raw(obj: obj.primary_coverage)
              obj.next_appointment.nil? || CandidApiClient::PreEncounter::Appointments::V1::Types::MutableAppointment.validate_raw(obj: obj.next_appointment)
            end
          end
        end
      end
    end
  end
end
