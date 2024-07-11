# frozen_string_literal: true

require_relative "threshold_match"
require "ostruct"
require "json"

module CandidApiClient
  module FeeSchedules
    module V3
      module Types
        class MatchResult
          # @return [CandidApiClient::FeeSchedules::V3::Types::ThresholdMatch]
          attr_reader :threshold
          # @return [String]
          attr_reader :rate_id
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param threshold [CandidApiClient::FeeSchedules::V3::Types::ThresholdMatch]
          # @param rate_id [String]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::FeeSchedules::V3::Types::MatchResult]
          def initialize(threshold:, rate_id:, additional_properties: nil)
            @threshold = threshold
            @rate_id = rate_id
            @additional_properties = additional_properties
            @_field_set = { "threshold": threshold, "rate_id": rate_id }
          end

          # Deserialize a JSON object to an instance of MatchResult
          #
          # @param json_object [String]
          # @return [CandidApiClient::FeeSchedules::V3::Types::MatchResult]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            if parsed_json["threshold"].nil?
              threshold = nil
            else
              threshold = parsed_json["threshold"].to_json
              threshold = CandidApiClient::FeeSchedules::V3::Types::ThresholdMatch.from_json(json_object: threshold)
            end
            rate_id = struct["rate_id"]
            new(
              threshold: threshold,
              rate_id: rate_id,
              additional_properties: struct
            )
          end

          # Serialize an instance of MatchResult to a JSON object
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
            CandidApiClient::FeeSchedules::V3::Types::ThresholdMatch.validate_raw(obj: obj.threshold)
            obj.rate_id.is_a?(String) != false || raise("Passed value for field obj.rate_id is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
