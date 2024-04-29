# frozen_string_literal: true

require_relative "threshold_match"
require_relative "../../../commons/types/rate_id"
require "json"

module CandidApiClient
  module FeeSchedules
    module V3
      class MatchResult
        attr_reader :threshold, :rate_id, :additional_properties

        # @param threshold [FeeSchedules::V3::ThresholdMatch]
        # @param rate_id [Commons::RATE_ID]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [FeeSchedules::V3::MatchResult]
        def initialize(threshold:, rate_id:, additional_properties: nil)
          # @type [FeeSchedules::V3::ThresholdMatch]
          @threshold = threshold
          # @type [Commons::RATE_ID]
          @rate_id = rate_id
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of MatchResult
        #
        # @param json_object [JSON]
        # @return [FeeSchedules::V3::MatchResult]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          if parsed_json["threshold"].nil?
            threshold = nil
          else
            threshold = parsed_json["threshold"].to_json
            threshold = FeeSchedules::V3::ThresholdMatch.from_json(json_object: threshold)
          end
          rate_id = struct.rate_id
          new(threshold: threshold, rate_id: rate_id, additional_properties: struct)
        end

        # Serialize an instance of MatchResult to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "threshold": @threshold, "rate_id": @rate_id }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          FeeSchedules::V3::ThresholdMatch.validate_raw(obj: obj.threshold)
          obj.rate_id.is_a?(UUID) != false || raise("Passed value for field obj.rate_id is not the expected type, validation failed.")
        end
      end
    end
  end
end
