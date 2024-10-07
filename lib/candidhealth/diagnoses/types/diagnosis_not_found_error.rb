# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module Diagnoses
    module Types
      class DiagnosisNotFoundError
        # @return [String]
        attr_reader :diagnosis_id
        # @return [String]
        attr_reader :message
        # @return [OpenStruct] Additional properties unmapped to the current class definition
        attr_reader :additional_properties
        # @return [Object]
        attr_reader :_field_set
        protected :_field_set

        OMIT = Object.new

        # @param diagnosis_id [String]
        # @param message [String]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [CandidApiClient::Diagnoses::Types::DiagnosisNotFoundError]
        def initialize(message:, diagnosis_id: OMIT, additional_properties: nil)
          @diagnosis_id = diagnosis_id if diagnosis_id != OMIT
          @message = message
          @additional_properties = additional_properties
          @_field_set = { "diagnosis_id": diagnosis_id, "message": message }.reject do |_k, v|
            v == OMIT
          end
        end

        # Deserialize a JSON object to an instance of DiagnosisNotFoundError
        #
        # @param json_object [String]
        # @return [CandidApiClient::Diagnoses::Types::DiagnosisNotFoundError]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          diagnosis_id = struct["diagnosis_id"]
          message = struct["message"]
          new(
            diagnosis_id: diagnosis_id,
            message: message,
            additional_properties: struct
          )
        end

        # Serialize an instance of DiagnosisNotFoundError to a JSON object
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
          obj.diagnosis_id&.is_a?(String) != false || raise("Passed value for field obj.diagnosis_id is not the expected type, validation failed.")
          obj.message.is_a?(String) != false || raise("Passed value for field obj.message is not the expected type, validation failed.")
        end
      end
    end
  end
end
