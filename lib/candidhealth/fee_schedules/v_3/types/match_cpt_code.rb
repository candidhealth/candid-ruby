# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module FeeSchedules
    module V3
      module Types
        # Match information for a CPT code
        class MatchCptCode
          # @return [String]
          attr_reader :value
          # @return [Boolean]
          attr_reader :match
          # @return [String]
          attr_reader :explanation
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param value [String]
          # @param match [Boolean]
          # @param explanation [String]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::FeeSchedules::V3::Types::MatchCptCode]
          def initialize(value:, match:, explanation:, additional_properties: nil)
            @value = value
            @match = match
            @explanation = explanation
            @additional_properties = additional_properties
            @_field_set = { "value": value, "match": match, "explanation": explanation }
          end

          # Deserialize a JSON object to an instance of MatchCptCode
          #
          # @param json_object [String]
          # @return [CandidApiClient::FeeSchedules::V3::Types::MatchCptCode]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            value = struct["value"]
            match = struct["match"]
            explanation = struct["explanation"]
            new(
              value: value,
              match: match,
              explanation: explanation,
              additional_properties: struct
            )
          end

          # Serialize an instance of MatchCptCode to a JSON object
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
            obj.value.is_a?(String) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
            obj.match.is_a?(Boolean) != false || raise("Passed value for field obj.match is not the expected type, validation failed.")
            obj.explanation.is_a?(String) != false || raise("Passed value for field obj.explanation is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
