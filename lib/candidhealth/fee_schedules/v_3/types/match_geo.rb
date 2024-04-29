# frozen_string_literal: true

require_relative "../../../commons/types/state"
require "json"

module CandidApiClient
  module FeeSchedules
    module V3
      # Match information for state or zip code
      class MatchGeo
        attr_reader :zip_code, :state, :match, :explanation, :additional_properties

        # @param zip_code [String]
        # @param state [Commons::State]
        # @param match [Boolean]
        # @param explanation [String]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [FeeSchedules::V3::MatchGeo]
        def initialize(match:, explanation:, zip_code: nil, state: nil, additional_properties: nil)
          # @type [String]
          @zip_code = zip_code
          # @type [Commons::State]
          @state = state
          # @type [Boolean]
          @match = match
          # @type [String]
          @explanation = explanation
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of MatchGeo
        #
        # @param json_object [JSON]
        # @return [FeeSchedules::V3::MatchGeo]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          JSON.parse(json_object)
          zip_code = struct.zip_code
          state = struct.state
          match = struct.match
          explanation = struct.explanation
          new(zip_code: zip_code, state: state, match: match, explanation: explanation, additional_properties: struct)
        end

        # Serialize an instance of MatchGeo to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "zip_code": @zip_code, "state": @state, "match": @match, "explanation": @explanation }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.zip_code&.is_a?(String) != false || raise("Passed value for field obj.zip_code is not the expected type, validation failed.")
          obj.state&.is_a?(Commons::State) != false || raise("Passed value for field obj.state is not the expected type, validation failed.")
          obj.match.is_a?(Boolean) != false || raise("Passed value for field obj.match is not the expected type, validation failed.")
          obj.explanation.is_a?(String) != false || raise("Passed value for field obj.explanation is not the expected type, validation failed.")
        end
      end
    end
  end
end
