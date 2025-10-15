# frozen_string_literal: true

require_relative "other_diagnosis_information_code_qualifier"
require_relative "present_on_admission_indicator_code"
require "ostruct"
require "json"

module CandidApiClient
  module HealthCareCodeInformation
    module V1
      module Types
        # This corresponds to BF and ABF code qualifier values.
        class OtherDiagnosisInformation
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::OtherDiagnosisInformationCodeQualifier]
          attr_reader :other_diagnosis_code_qualifier
          # @return [String]
          attr_reader :other_diagnosis
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::PresentOnAdmissionIndicatorCode]
          attr_reader :present_on_admission_indicator
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

          # @param other_diagnosis_code_qualifier [CandidApiClient::HealthCareCodeInformation::V1::Types::OtherDiagnosisInformationCodeQualifier]
          # @param other_diagnosis [String]
          # @param present_on_admission_indicator [CandidApiClient::HealthCareCodeInformation::V1::Types::PresentOnAdmissionIndicatorCode]
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
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::OtherDiagnosisInformation]
          def initialize(other_diagnosis_code_qualifier:, other_diagnosis:, present_on_admission_indicator: OMIT,
                         id: OMIT, encounter_id: OMIT, additional_properties: nil)
            @other_diagnosis_code_qualifier = other_diagnosis_code_qualifier
            @other_diagnosis = other_diagnosis
            @present_on_admission_indicator = present_on_admission_indicator if present_on_admission_indicator != OMIT
            @id = id if id != OMIT
            @encounter_id = encounter_id if encounter_id != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "other_diagnosis_code_qualifier": other_diagnosis_code_qualifier,
              "other_diagnosis": other_diagnosis,
              "present_on_admission_indicator": present_on_admission_indicator,
              "id": id,
              "encounter_id": encounter_id
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of OtherDiagnosisInformation
          #
          # @param json_object [String]
          # @return [CandidApiClient::HealthCareCodeInformation::V1::Types::OtherDiagnosisInformation]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            other_diagnosis_code_qualifier = struct["other_diagnosis_code_qualifier"]
            other_diagnosis = struct["other_diagnosis"]
            present_on_admission_indicator = struct["present_on_admission_indicator"]
            id = struct["id"]
            encounter_id = struct["encounter_id"]
            new(
              other_diagnosis_code_qualifier: other_diagnosis_code_qualifier,
              other_diagnosis: other_diagnosis,
              present_on_admission_indicator: present_on_admission_indicator,
              id: id,
              encounter_id: encounter_id,
              additional_properties: struct
            )
          end

          # Serialize an instance of OtherDiagnosisInformation to a JSON object
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
            obj.other_diagnosis_code_qualifier.is_a?(CandidApiClient::HealthCareCodeInformation::V1::Types::OtherDiagnosisInformationCodeQualifier) != false || raise("Passed value for field obj.other_diagnosis_code_qualifier is not the expected type, validation failed.")
            obj.other_diagnosis.is_a?(String) != false || raise("Passed value for field obj.other_diagnosis is not the expected type, validation failed.")
            obj.present_on_admission_indicator&.is_a?(CandidApiClient::HealthCareCodeInformation::V1::Types::PresentOnAdmissionIndicatorCode) != false || raise("Passed value for field obj.present_on_admission_indicator is not the expected type, validation failed.")
            obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
            obj.encounter_id&.is_a?(String) != false || raise("Passed value for field obj.encounter_id is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
