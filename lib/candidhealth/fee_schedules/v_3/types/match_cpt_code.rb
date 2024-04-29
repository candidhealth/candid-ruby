# frozen_string_literal: true

require "json"

module CandidApiClient
  module FeeSchedules
    module V3
      # Match information for a CPT code
      class MatchCptCode
        attr_reader :value, :match, :explanation, :additional_properties

        # @param value [String]
        # @param match [Boolean]
        # @param explanation [String]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [FeeSchedules::V3::MatchCptCode]
        def initialize(value:, match:, explanation:, additional_properties: nil)
          # @type [String]
          @value = value
          # @type [Boolean]
          @match = match
          # @type [String]
          @explanation = explanation
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of MatchCptCode
        #
        # @param json_object [JSON]
        # @return [FeeSchedules::V3::MatchCptCode]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          JSON.parse(json_object)
          value = struct.value
          match = struct.match
          explanation = struct.explanation
          new(value: value, match: match, explanation: explanation, additional_properties: struct)
        end

        # Serialize an instance of MatchCptCode to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "value": @value, "match": @match, "explanation": @explanation }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.value.is_a?(String) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
          obj.match.is_a?(Boolean) != false || raise("Passed value for field obj.match is not the expected type, validation failed.")
          obj.explanation.is_a?(String) != false || raise("Passed value for field obj.explanation is not the expected type, validation failed.")
        end
      end
    end
  end
end
