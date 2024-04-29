# frozen_string_literal: true

require_relative "dimension_match"
require_relative "threshold_match"
require "json"

module CandidApiClient
  module FeeSchedules
    module V3
      class MatchTestResult
        attr_reader :dimensions, :threshold, :additional_properties

        # @param dimensions [FeeSchedules::V3::DimensionMatch]
        # @param threshold [FeeSchedules::V3::ThresholdMatch]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [FeeSchedules::V3::MatchTestResult]
        def initialize(dimensions:, threshold:, additional_properties: nil)
          # @type [FeeSchedules::V3::DimensionMatch]
          @dimensions = dimensions
          # @type [FeeSchedules::V3::ThresholdMatch]
          @threshold = threshold
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of MatchTestResult
        #
        # @param json_object [JSON]
        # @return [FeeSchedules::V3::MatchTestResult]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          if parsed_json["dimensions"].nil?
            dimensions = nil
          else
            dimensions = parsed_json["dimensions"].to_json
            dimensions = FeeSchedules::V3::DimensionMatch.from_json(json_object: dimensions)
          end
          if parsed_json["threshold"].nil?
            threshold = nil
          else
            threshold = parsed_json["threshold"].to_json
            threshold = FeeSchedules::V3::ThresholdMatch.from_json(json_object: threshold)
          end
          new(dimensions: dimensions, threshold: threshold, additional_properties: struct)
        end

        # Serialize an instance of MatchTestResult to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "dimensions": @dimensions, "threshold": @threshold }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          FeeSchedules::V3::DimensionMatch.validate_raw(obj: obj.dimensions)
          FeeSchedules::V3::ThresholdMatch.validate_raw(obj: obj.threshold)
        end
      end
    end
  end
end
