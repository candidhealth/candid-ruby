# frozen_string_literal: true

require_relative "payer_threshold"
require "json"

module CandidApiClient
  module FeeSchedules
    module V3
      # Threshold and dollar amount matching for a service line
      class ThresholdMatch
        attr_reader :threshold, :rate_cents, :match, :explanation, :additional_properties

        # @param threshold [FeeSchedules::V3::PayerThreshold]
        # @param rate_cents [Integer]
        # @param match [Boolean]
        # @param explanation [String]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [FeeSchedules::V3::ThresholdMatch]
        def initialize(threshold:, rate_cents:, match:, explanation:, additional_properties: nil)
          # @type [FeeSchedules::V3::PayerThreshold]
          @threshold = threshold
          # @type [Integer]
          @rate_cents = rate_cents
          # @type [Boolean]
          @match = match
          # @type [String]
          @explanation = explanation
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of ThresholdMatch
        #
        # @param json_object [JSON]
        # @return [FeeSchedules::V3::ThresholdMatch]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          if parsed_json["threshold"].nil?
            threshold = nil
          else
            threshold = parsed_json["threshold"].to_json
            threshold = FeeSchedules::V3::PayerThreshold.from_json(json_object: threshold)
          end
          rate_cents = struct.rate_cents
          match = struct.match
          explanation = struct.explanation
          new(threshold: threshold, rate_cents: rate_cents, match: match, explanation: explanation,
              additional_properties: struct)
        end

        # Serialize an instance of ThresholdMatch to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "threshold": @threshold, "rate_cents": @rate_cents, "match": @match, "explanation": @explanation }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          FeeSchedules::V3::PayerThreshold.validate_raw(obj: obj.threshold)
          obj.rate_cents.is_a?(Integer) != false || raise("Passed value for field obj.rate_cents is not the expected type, validation failed.")
          obj.match.is_a?(Boolean) != false || raise("Passed value for field obj.match is not the expected type, validation failed.")
          obj.explanation.is_a?(String) != false || raise("Passed value for field obj.explanation is not the expected type, validation failed.")
        end
      end
    end
  end
end
