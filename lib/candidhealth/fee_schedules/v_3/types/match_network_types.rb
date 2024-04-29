# frozen_string_literal: true

require "set"
require "json"

module CandidApiClient
  module FeeSchedules
    module V3
      # Match information for network types
      class MatchNetworkTypes
        attr_reader :value, :match, :explanation, :additional_properties

        # @param value [Set<Commons::NetworkType>]
        # @param match [Boolean]
        # @param explanation [String]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [FeeSchedules::V3::MatchNetworkTypes]
        def initialize(value:, match:, explanation:, additional_properties: nil)
          # @type [Set<Commons::NetworkType>]
          @value = value
          # @type [Boolean]
          @match = match
          # @type [String]
          @explanation = explanation
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of MatchNetworkTypes
        #
        # @param json_object [JSON]
        # @return [FeeSchedules::V3::MatchNetworkTypes]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          if parsed_json["value"].nil?
            value = nil
          else
            value = parsed_json["value"].to_json
            value = Set.new(value)
          end
          match = struct.match
          explanation = struct.explanation
          new(value: value, match: match, explanation: explanation, additional_properties: struct)
        end

        # Serialize an instance of MatchNetworkTypes to a JSON object
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
          obj.value.is_a?(Set) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
          obj.match.is_a?(Boolean) != false || raise("Passed value for field obj.match is not the expected type, validation failed.")
          obj.explanation.is_a?(String) != false || raise("Passed value for field obj.explanation is not the expected type, validation failed.")
        end
      end
    end
  end
end
