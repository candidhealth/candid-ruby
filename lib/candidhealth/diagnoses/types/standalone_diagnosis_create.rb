# frozen_string_literal: true

require_relative "../../commons/types/encounter_id"
require_relative "diagnosis_type_code"
require "json"

module CandidApiClient
  class Diagnoses
    class StandaloneDiagnosisCreate
      attr_reader :encounter_id, :name, :code_type, :code, :additional_properties

      # @param encounter_id [Commons::ENCOUNTER_ID]
      # @param name [String] Empty string not allowed.
      # @param code_type [Diagnoses::DiagnosisTypeCode] Typically, providers submitting claims to Candid are using ICD-10 diagnosis codes. If you are using ICD-10 codes, the primary diagnosis code listed on the claim should use the ABK code_type. If more than one diagnosis is being submitted on a claim, please use ABF for the rest of the listed diagnoses. If you are using ICD-9 diagnosis codes, use BK and BF for the principal and following diagnosis code(s) respectively.
      # @param code [String] Empty string not allowed.
      #   Should be of the appropriate format for the provided `code_type`.
      #   Must obey the ICD-10 format if an ICD-10 code_type is provided, specifically:
      #   - Letter
      #   - Digit
      #   - Digit or the letter `A` or `B`
      #   - (Optional) Period `.`
      #   - Up to 4 (or as few as 0) letters and digits
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Diagnoses::StandaloneDiagnosisCreate]
      def initialize(encounter_id:, code_type:, code:, name: nil, additional_properties: nil)
        # @type [Commons::ENCOUNTER_ID]
        @encounter_id = encounter_id
        # @type [String] Empty string not allowed.
        @name = name
        # @type [Diagnoses::DiagnosisTypeCode] Typically, providers submitting claims to Candid are using ICD-10 diagnosis codes. If you are using ICD-10 codes, the primary diagnosis code listed on the claim should use the ABK code_type. If more than one diagnosis is being submitted on a claim, please use ABF for the rest of the listed diagnoses. If you are using ICD-9 diagnosis codes, use BK and BF for the principal and following diagnosis code(s) respectively.
        @code_type = code_type
        # @type [String] Empty string not allowed.
        #   Should be of the appropriate format for the provided `code_type`.
        #   Must obey the ICD-10 format if an ICD-10 code_type is provided, specifically:
        #   - Letter
        #   - Digit
        #   - Digit or the letter `A` or `B`
        #   - (Optional) Period `.`
        #   - Up to 4 (or as few as 0) letters and digits
        @code = code
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of StandaloneDiagnosisCreate
      #
      # @param json_object [JSON]
      # @return [Diagnoses::StandaloneDiagnosisCreate]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        encounter_id = struct.encounter_id
        name = struct.name
        code_type = struct.code_type
        code = struct.code
        new(encounter_id: encounter_id, name: name, code_type: code_type, code: code, additional_properties: struct)
      end

      # Serialize an instance of StandaloneDiagnosisCreate to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "encounter_id": @encounter_id, "name": @name, "code_type": @code_type, "code": @code }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.encounter_id.is_a?(String) != false || raise("Passed value for field obj.encounter_id is not the expected type, validation failed.")
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.code_type.is_a?(Diagnoses::DiagnosisTypeCode) != false || raise("Passed value for field obj.code_type is not the expected type, validation failed.")
        obj.code.is_a?(String) != false || raise("Passed value for field obj.code is not the expected type, validation failed.")
      end
    end
  end
end
