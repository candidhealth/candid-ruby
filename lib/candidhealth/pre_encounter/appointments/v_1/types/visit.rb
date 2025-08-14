# frozen_string_literal: true

require_relative "../../../patients/v_1/types/mutable_patient_with_mrn"
require "date"
require_relative "appointment_status"
require_relative "../../../coverages/v_1/types/mutable_coverage"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Appointments
      module V1
        module Types
          # A visit is a collection of appointments that occur on the same day.
          class Visit
            # @return [String]
            attr_reader :patient_id
            # @return [CandidApiClient::PreEncounter::Patients::V1::Types::MutablePatientWithMrn]
            attr_reader :patient
            # @return [DateTime]
            attr_reader :start_time
            # @return [CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentStatus]
            attr_reader :status
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::MutableCoverage]
            attr_reader :primary_coverage
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param patient_id [String]
            # @param patient [CandidApiClient::PreEncounter::Patients::V1::Types::MutablePatientWithMrn]
            # @param start_time [DateTime]
            # @param status [CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentStatus]
            # @param primary_coverage [CandidApiClient::PreEncounter::Coverages::V1::Types::MutableCoverage]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Appointments::V1::Types::Visit]
            def initialize(patient_id:, patient:, start_time:, status:, primary_coverage: OMIT,
                           additional_properties: nil)
              @patient_id = patient_id
              @patient = patient
              @start_time = start_time
              @status = status
              @primary_coverage = primary_coverage if primary_coverage != OMIT
              @additional_properties = additional_properties
              @_field_set = {
                "patient_id": patient_id,
                "patient": patient,
                "start_time": start_time,
                "status": status,
                "primary_coverage": primary_coverage
              }.reject do |_k, v|
                v == OMIT
              end
            end

            # Deserialize a JSON object to an instance of Visit
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Appointments::V1::Types::Visit]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              parsed_json = JSON.parse(json_object)
              patient_id = struct["patient_id"]
              if parsed_json["patient"].nil?
                patient = nil
              else
                patient = parsed_json["patient"].to_json
                patient = CandidApiClient::PreEncounter::Patients::V1::Types::MutablePatientWithMrn.from_json(json_object: patient)
              end
              start_time = (DateTime.parse(parsed_json["start_time"]) unless parsed_json["start_time"].nil?)
              status = struct["status"]
              if parsed_json["primary_coverage"].nil?
                primary_coverage = nil
              else
                primary_coverage = parsed_json["primary_coverage"].to_json
                primary_coverage = CandidApiClient::PreEncounter::Coverages::V1::Types::MutableCoverage.from_json(json_object: primary_coverage)
              end
              new(
                patient_id: patient_id,
                patient: patient,
                start_time: start_time,
                status: status,
                primary_coverage: primary_coverage,
                additional_properties: struct
              )
            end

            # Serialize an instance of Visit to a JSON object
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
              CandidApiClient::PreEncounter::Patients::V1::Types::MutablePatientWithMrn.validate_raw(obj: obj.patient)
              obj.start_time.is_a?(DateTime) != false || raise("Passed value for field obj.start_time is not the expected type, validation failed.")
              obj.status.is_a?(CandidApiClient::PreEncounter::Appointments::V1::Types::AppointmentStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
              obj.primary_coverage.nil? || CandidApiClient::PreEncounter::Coverages::V1::Types::MutableCoverage.validate_raw(obj: obj.primary_coverage)
            end
          end
        end
      end
    end
  end
end
