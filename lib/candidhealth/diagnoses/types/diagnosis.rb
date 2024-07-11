# frozen_string_literal: true

require "date"
require_relative "diagnosis_type_code"
require "ostruct"
require "json"

module CandidApiClient
  module Diagnoses
    module Types
      class Diagnosis
        # @return [String]
        attr_reader :diagnosis_id
        # @return [DateTime]
        attr_reader :created_at
        # @return [DateTime]
        attr_reader :updated_at
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
        # @return [OpenStruct] Additional properties unmapped to the current class definition
        attr_reader :additional_properties
        # @return [Object]
        attr_reader :_field_set
        protected :_field_set

        OMIT = Object.new

        # @param diagnosis_id [String]
        # @param created_at [DateTime]
        # @param updated_at [DateTime]
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
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [CandidApiClient::Diagnoses::Types::Diagnosis]
        def initialize(diagnosis_id:, created_at:, updated_at:, encounter_id:, code_type:, code:, name: OMIT,
                       additional_properties: nil)
          @diagnosis_id = diagnosis_id
          @created_at = created_at
          @updated_at = updated_at
          @encounter_id = encounter_id
          @name = name if name != OMIT
          @code_type = code_type
          @code = code
          @additional_properties = additional_properties
          @_field_set = {
            "diagnosis_id": diagnosis_id,
            "created_at": created_at,
            "updated_at": updated_at,
            "encounter_id": encounter_id,
            "name": name,
            "code_type": code_type,
            "code": code
          }.reject do |_k, v|
            v == OMIT
          end
        end

        # Deserialize a JSON object to an instance of Diagnosis
        #
        # @param json_object [String]
        # @return [CandidApiClient::Diagnoses::Types::Diagnosis]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          diagnosis_id = struct["diagnosis_id"]
          created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
          updated_at = (DateTime.parse(parsed_json["updated_at"]) unless parsed_json["updated_at"].nil?)
          encounter_id = struct["encounter_id"]
          name = struct["name"]
          code_type = struct["code_type"]
          code = struct["code"]
          new(
            diagnosis_id: diagnosis_id,
            created_at: created_at,
            updated_at: updated_at,
            encounter_id: encounter_id,
            name: name,
            code_type: code_type,
            code: code,
            additional_properties: struct
          )
        end

        # Serialize an instance of Diagnosis to a JSON object
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
          obj.diagnosis_id.is_a?(String) != false || raise("Passed value for field obj.diagnosis_id is not the expected type, validation failed.")
          obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
          obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
          obj.encounter_id.is_a?(String) != false || raise("Passed value for field obj.encounter_id is not the expected type, validation failed.")
          obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
          obj.code_type.is_a?(CandidApiClient::Diagnoses::Types::DiagnosisTypeCode) != false || raise("Passed value for field obj.code_type is not the expected type, validation failed.")
          obj.code.is_a?(String) != false || raise("Passed value for field obj.code is not the expected type, validation failed.")
        end
      end
    end
  end
end
