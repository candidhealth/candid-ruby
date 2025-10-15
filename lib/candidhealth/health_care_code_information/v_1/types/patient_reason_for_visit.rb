# frozen_string_literal: true

require_relative "patient_reason_for_visit_code_qualifier"
require "ostruct"
require "json"

module CandidApiClient
  module HealthCareCodeInformation
    module V1
      module Types
        # This corresponds to PR or APR code qualifier values.
        class PatientReasonForVisit
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::PatientReasonForVisitCodeQualifier]
          attr_reader :patient_reason_for_visit_code_qualifier
          # @return [String]
          attr_reader :patient_reason_for_visit
          # @return [String] The id of this health care code information if it is already stored.
          #  If this is not set, this is referring to a new health care code information to
          #  be added
          #  to the encounter.  If it is set, this refers to an update of an existing health
          #  care code
          #  information object on the encounter.
          attr_reader :id
          # @return [String] The encounter_id of this health care code information if it is already stored.
          #  This will be set by the server in responses, but clients are not expected to set
          #  it.
          attr_reader :encounter_id
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param patient_reason_for_visit_code_qualifier [CandidApiClient::HealthCareCodeInformation::V1::Types::PatientReasonForVisitCodeQualifier]
          # @param patient_reason_for_visit [String]
          # @param id [String] The id of this health care code information if it is already stored.
          #  If this is not set, this is referring to a new health care code information to
          #  be added
          #  to the encounter.  If it is set, this refers to an update of an existing health
          #  care code
          #  information object on the encounter.
          # @param encounter_id [String] The encounter_id of this health care code information if it is already stored.
          #  This will be set by the server in responses, but clients are not expected to set
          #  it.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::PatientReasonForVisit]
          def initialize(patient_reason_for_visit_code_qualifier:, patient_reason_for_visit:, id: OMIT,
                         encounter_id: OMIT, additional_properties: nil)
            @patient_reason_for_visit_code_qualifier = patient_reason_for_visit_code_qualifier
            @patient_reason_for_visit = patient_reason_for_visit
            @id = id if id != OMIT
            @encounter_id = encounter_id if encounter_id != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "patient_reason_for_visit_code_qualifier": patient_reason_for_visit_code_qualifier,
              "patient_reason_for_visit": patient_reason_for_visit,
              "id": id,
              "encounter_id": encounter_id
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of PatientReasonForVisit
          #
          # @param json_object [String]
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::PatientReasonForVisit]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            patient_reason_for_visit_code_qualifier = struct["patient_reason_for_visit_code_qualifier"]
            patient_reason_for_visit = struct["patient_reason_for_visit"]
            id = struct["id"]
            encounter_id = struct["encounter_id"]
            new(
              patient_reason_for_visit_code_qualifier: patient_reason_for_visit_code_qualifier,
              patient_reason_for_visit: patient_reason_for_visit,
              id: id,
              encounter_id: encounter_id,
              additional_properties: struct
            )
          end

          # Serialize an instance of PatientReasonForVisit to a JSON object
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
            obj.patient_reason_for_visit_code_qualifier.is_a?(CandidApiClient::HealthCareCodeInformation::V1::Types::PatientReasonForVisitCodeQualifier) != false || raise("Passed value for field obj.patient_reason_for_visit_code_qualifier is not the expected type, validation failed.")
            obj.patient_reason_for_visit.is_a?(String) != false || raise("Passed value for field obj.patient_reason_for_visit is not the expected type, validation failed.")
            obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
            obj.encounter_id&.is_a?(String) != false || raise("Passed value for field obj.encounter_id is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
