# frozen_string_literal: true

require_relative "../../../commons/types/state"
require "ostruct"
require "json"

module CandidApiClient
  module FeeSchedules
    module V3
      module Types
        # Match information for state or zip code
        class MatchGeo
          # @return [String]
          attr_reader :zip_code
          # @return [CandidApiClient::Commons::Types::State]
          attr_reader :state
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

          # @param zip_code [String]
          # @param state [CandidApiClient::Commons::Types::State]
          # @param match [Boolean]
          # @param explanation [String]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::FeeSchedules::V3::Types::MatchGeo]
          def initialize(match:, explanation:, zip_code: OMIT, state: OMIT, additional_properties: nil)
            @zip_code = zip_code if zip_code != OMIT
            @state = state if state != OMIT
            @match = match
            @explanation = explanation
            @additional_properties = additional_properties
            @_field_set = {
              "zip_code": zip_code,
              "state": state,
              "match": match,
              "explanation": explanation
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of MatchGeo
          #
          # @param json_object [String]
          # @return [CandidApiClient::FeeSchedules::V3::Types::MatchGeo]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            zip_code = struct["zip_code"]
            state = struct["state"]
            match = struct["match"]
            explanation = struct["explanation"]
            new(
              zip_code: zip_code,
              state: state,
              match: match,
              explanation: explanation,
              additional_properties: struct
            )
          end

          # Serialize an instance of MatchGeo to a JSON object
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
            obj.zip_code&.is_a?(String) != false || raise("Passed value for field obj.zip_code is not the expected type, validation failed.")
            obj.state&.is_a?(CandidApiClient::Commons::Types::State) != false || raise("Passed value for field obj.state is not the expected type, validation failed.")
            obj.match.is_a?(Boolean) != false || raise("Passed value for field obj.match is not the expected type, validation failed.")
            obj.explanation.is_a?(String) != false || raise("Passed value for field obj.explanation is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
