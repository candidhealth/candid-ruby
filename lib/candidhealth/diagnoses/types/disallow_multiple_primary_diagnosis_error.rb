# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module Diagnoses
    module Types
      class DisallowMultiplePrimaryDiagnosisError
        # @return [String]
        attr_reader :existing_primary_diagnosis_id
        # @return [String]
        attr_reader :new_primary_diagnosis_id
        # @return [String]
        attr_reader :message
        # @return [OpenStruct] Additional properties unmapped to the current class definition
        attr_reader :additional_properties
        # @return [Object]
        attr_reader :_field_set
        protected :_field_set

        OMIT = Object.new

        # @param existing_primary_diagnosis_id [String]
        # @param new_primary_diagnosis_id [String]
        # @param message [String]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [CandidApiClient::Diagnoses::Types::DisallowMultiplePrimaryDiagnosisError]
        def initialize(existing_primary_diagnosis_id:, new_primary_diagnosis_id:, message:, additional_properties: nil)
          @existing_primary_diagnosis_id = existing_primary_diagnosis_id
          @new_primary_diagnosis_id = new_primary_diagnosis_id
          @message = message
          @additional_properties = additional_properties
          @_field_set = {
            "existing_primary_diagnosis_id": existing_primary_diagnosis_id,
            "new_primary_diagnosis_id": new_primary_diagnosis_id,
            "message": message
          }
        end

        # Deserialize a JSON object to an instance of
        #  DisallowMultiplePrimaryDiagnosisError
        #
        # @param json_object [String]
        # @return [CandidApiClient::Diagnoses::Types::DisallowMultiplePrimaryDiagnosisError]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          existing_primary_diagnosis_id = struct["existing_primary_diagnosis_id"]
          new_primary_diagnosis_id = struct["new_primary_diagnosis_id"]
          message = struct["message"]
          new(
            existing_primary_diagnosis_id: existing_primary_diagnosis_id,
            new_primary_diagnosis_id: new_primary_diagnosis_id,
            message: message,
            additional_properties: struct
          )
        end

        # Serialize an instance of DisallowMultiplePrimaryDiagnosisError to a JSON object
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
          obj.existing_primary_diagnosis_id.is_a?(String) != false || raise("Passed value for field obj.existing_primary_diagnosis_id is not the expected type, validation failed.")
          obj.new_primary_diagnosis_id.is_a?(String) != false || raise("Passed value for field obj.new_primary_diagnosis_id is not the expected type, validation failed.")
          obj.message.is_a?(String) != false || raise("Passed value for field obj.message is not the expected type, validation failed.")
        end
      end
    end
  end
end
