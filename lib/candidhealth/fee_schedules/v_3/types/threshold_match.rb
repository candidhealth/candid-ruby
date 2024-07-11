# frozen_string_literal: true

require_relative "payer_threshold"
require "ostruct"
require "json"

module CandidApiClient
  module FeeSchedules
    module V3
      module Types
        # Threshold and dollar amount matching for a service line
        class ThresholdMatch
          # @return [CandidApiClient::FeeSchedules::V3::Types::PayerThreshold]
          attr_reader :threshold
          # @return [Integer]
          attr_reader :rate_cents
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

          # @param threshold [CandidApiClient::FeeSchedules::V3::Types::PayerThreshold]
          # @param rate_cents [Integer]
          # @param match [Boolean]
          # @param explanation [String]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::FeeSchedules::V3::Types::ThresholdMatch]
          def initialize(threshold:, rate_cents:, match:, explanation:, additional_properties: nil)
            @threshold = threshold
            @rate_cents = rate_cents
            @match = match
            @explanation = explanation
            @additional_properties = additional_properties
            @_field_set = {
              "threshold": threshold,
              "rate_cents": rate_cents,
              "match": match,
              "explanation": explanation
            }
          end

          # Deserialize a JSON object to an instance of ThresholdMatch
          #
          # @param json_object [String]
          # @return [CandidApiClient::FeeSchedules::V3::Types::ThresholdMatch]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            if parsed_json["threshold"].nil?
              threshold = nil
            else
              threshold = parsed_json["threshold"].to_json
              threshold = CandidApiClient::FeeSchedules::V3::Types::PayerThreshold.from_json(json_object: threshold)
            end
            rate_cents = struct["rate_cents"]
            match = struct["match"]
            explanation = struct["explanation"]
            new(
              threshold: threshold,
              rate_cents: rate_cents,
              match: match,
              explanation: explanation,
              additional_properties: struct
            )
          end

          # Serialize an instance of ThresholdMatch to a JSON object
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
            CandidApiClient::FeeSchedules::V3::Types::PayerThreshold.validate_raw(obj: obj.threshold)
            obj.rate_cents.is_a?(Integer) != false || raise("Passed value for field obj.rate_cents is not the expected type, validation failed.")
            obj.match.is_a?(Boolean) != false || raise("Passed value for field obj.match is not the expected type, validation failed.")
            obj.explanation.is_a?(String) != false || raise("Passed value for field obj.explanation is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
