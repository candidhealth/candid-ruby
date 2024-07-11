# frozen_string_literal: true

require_relative "dimension_match"
require_relative "threshold_match"
require "ostruct"
require "json"

module CandidApiClient
  module FeeSchedules
    module V3
      module Types
        class MatchTestResult
          # @return [CandidApiClient::FeeSchedules::V3::Types::DimensionMatch]
          attr_reader :dimensions
          # @return [CandidApiClient::FeeSchedules::V3::Types::ThresholdMatch]
          attr_reader :threshold
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param dimensions [CandidApiClient::FeeSchedules::V3::Types::DimensionMatch]
          # @param threshold [CandidApiClient::FeeSchedules::V3::Types::ThresholdMatch]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::FeeSchedules::V3::Types::MatchTestResult]
          def initialize(dimensions:, threshold:, additional_properties: nil)
            @dimensions = dimensions
            @threshold = threshold
            @additional_properties = additional_properties
            @_field_set = { "dimensions": dimensions, "threshold": threshold }
          end

          # Deserialize a JSON object to an instance of MatchTestResult
          #
          # @param json_object [String]
          # @return [CandidApiClient::FeeSchedules::V3::Types::MatchTestResult]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            if parsed_json["dimensions"].nil?
              dimensions = nil
            else
              dimensions = parsed_json["dimensions"].to_json
              dimensions = CandidApiClient::FeeSchedules::V3::Types::DimensionMatch.from_json(json_object: dimensions)
            end
            if parsed_json["threshold"].nil?
              threshold = nil
            else
              threshold = parsed_json["threshold"].to_json
              threshold = CandidApiClient::FeeSchedules::V3::Types::ThresholdMatch.from_json(json_object: threshold)
            end
            new(
              dimensions: dimensions,
              threshold: threshold,
              additional_properties: struct
            )
          end

          # Serialize an instance of MatchTestResult to a JSON object
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
            CandidApiClient::FeeSchedules::V3::Types::DimensionMatch.validate_raw(obj: obj.dimensions)
            CandidApiClient::FeeSchedules::V3::Types::ThresholdMatch.validate_raw(obj: obj.threshold)
          end
        end
      end
    end
  end
end
