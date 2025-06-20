# frozen_string_literal: true

require_relative "diagnosis_type_code"
require_relative "../../yes_no_indicator/types/yes_no_indicator"
require "ostruct"
require "json"

module CandidApiClient
  module Diagnoses
    module Types
      class StandaloneDiagnosisCreate
        # @return [String]
        attr_reader :encounter_id
        # @return [String] Empty string not allowed.
        attr_reader :name
        # @return [CandidApiClient::Diagnoses::Types::DiagnosisTypeCode] Typically, providers submitting claims to Candid are using ICD-10 diagnosis
        #  codes. If you are using ICD-10 codes, the primary diagnosis code listed on the
        #  claim should use the ABK code_type. If more than one diagnosis is being
        #  submitted on a claim, please use ABF for the rest of the listed diagnoses. If
        #  you are using ICD-9 diagnosis codes, use BK and BF for the principal and
        #  following diagnosis code(s) respectively.
        attr_reader :code_type
        # @return [String] Empty string not allowed.
        #  Should be of the appropriate format for the provided `code_type`.
        #  Must obey the ICD-10 format if an ICD-10 code_type is provided, specifically:
        #  - Letter
        #  - Digit
        #  - Digit or the letter `A` or `B`
        #  - (Optional) Period `.`
        #  - Up to 4 (or as few as 0) letters and digits
        attr_reader :code
        # @return [CandidApiClient::YesNoIndicator::Types::YesNoIndicator] For Institutional claims only.
        #  A "Y" indicates that the onset occurred prior to admission to the hospital.
        #  An "N" indicates that the onset did NOT occur prior to admission to the
        #  hospital.
        #  A "U" indicates that it is unknown whether the onset occurred prior to admission
        #  to the hospital or not.
        attr_reader :present_on_admission_indicator
        # @return [OpenStruct] Additional properties unmapped to the current class definition
        attr_reader :additional_properties
        # @return [Object]
        attr_reader :_field_set
        protected :_field_set

        OMIT = Object.new

        # @param encounter_id [String]
        # @param name [String] Empty string not allowed.
        # @param code_type [CandidApiClient::Diagnoses::Types::DiagnosisTypeCode] Typically, providers submitting claims to Candid are using ICD-10 diagnosis
        #  codes. If you are using ICD-10 codes, the primary diagnosis code listed on the
        #  claim should use the ABK code_type. If more than one diagnosis is being
        #  submitted on a claim, please use ABF for the rest of the listed diagnoses. If
        #  you are using ICD-9 diagnosis codes, use BK and BF for the principal and
        #  following diagnosis code(s) respectively.
        # @param code [String] Empty string not allowed.
        #  Should be of the appropriate format for the provided `code_type`.
        #  Must obey the ICD-10 format if an ICD-10 code_type is provided, specifically:
        #  - Letter
        #  - Digit
        #  - Digit or the letter `A` or `B`
        #  - (Optional) Period `.`
        #  - Up to 4 (or as few as 0) letters and digits
        # @param present_on_admission_indicator [CandidApiClient::YesNoIndicator::Types::YesNoIndicator] For Institutional claims only.
        #  A "Y" indicates that the onset occurred prior to admission to the hospital.
        #  An "N" indicates that the onset did NOT occur prior to admission to the
        #  hospital.
        #  A "U" indicates that it is unknown whether the onset occurred prior to admission
        #  to the hospital or not.
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [CandidApiClient::Diagnoses::Types::StandaloneDiagnosisCreate]
        def initialize(encounter_id:, code_type:, code:, name: OMIT, present_on_admission_indicator: OMIT,
                       additional_properties: nil)
          @encounter_id = encounter_id
          @name = name if name != OMIT
          @code_type = code_type
          @code = code
          @present_on_admission_indicator = present_on_admission_indicator if present_on_admission_indicator != OMIT
          @additional_properties = additional_properties
          @_field_set = {
            "encounter_id": encounter_id,
            "name": name,
            "code_type": code_type,
            "code": code,
            "present_on_admission_indicator": present_on_admission_indicator
          }.reject do |_k, v|
            v == OMIT
          end
        end

        # Deserialize a JSON object to an instance of StandaloneDiagnosisCreate
        #
        # @param json_object [String]
        # @return [CandidApiClient::Diagnoses::Types::StandaloneDiagnosisCreate]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          encounter_id = struct["encounter_id"]
          name = struct["name"]
          code_type = struct["code_type"]
          code = struct["code"]
          present_on_admission_indicator = struct["present_on_admission_indicator"]
          new(
            encounter_id: encounter_id,
            name: name,
            code_type: code_type,
            code: code,
            present_on_admission_indicator: present_on_admission_indicator,
            additional_properties: struct
          )
        end

        # Serialize an instance of StandaloneDiagnosisCreate to a JSON object
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
          obj.encounter_id.is_a?(String) != false || raise("Passed value for field obj.encounter_id is not the expected type, validation failed.")
          obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
          obj.code_type.is_a?(CandidApiClient::Diagnoses::Types::DiagnosisTypeCode) != false || raise("Passed value for field obj.code_type is not the expected type, validation failed.")
          obj.code.is_a?(String) != false || raise("Passed value for field obj.code is not the expected type, validation failed.")
          obj.present_on_admission_indicator&.is_a?(CandidApiClient::YesNoIndicator::Types::YesNoIndicator) != false || raise("Passed value for field obj.present_on_admission_indicator is not the expected type, validation failed.")
        end
      end
    end
  end
end
