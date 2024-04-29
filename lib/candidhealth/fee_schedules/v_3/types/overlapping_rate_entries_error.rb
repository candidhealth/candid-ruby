# frozen_string_literal: true

require_relative "rate_entry"
require "json"

module CandidApiClient
  module FeeSchedules
    module V3
      # This error is thrown when two rate entries have time ranges that overlap.
      class OverlappingRateEntriesError
        attr_reader :message, :rate_a, :rate_b, :additional_properties

        # @param message [String]
        # @param rate_a [FeeSchedules::V3::RateEntry]
        # @param rate_b [FeeSchedules::V3::RateEntry]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [FeeSchedules::V3::OverlappingRateEntriesError]
        def initialize(message:, rate_a:, rate_b:, additional_properties: nil)
          # @type [String]
          @message = message
          # @type [FeeSchedules::V3::RateEntry]
          @rate_a = rate_a
          # @type [FeeSchedules::V3::RateEntry]
          @rate_b = rate_b
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of OverlappingRateEntriesError
        #
        # @param json_object [JSON]
        # @return [FeeSchedules::V3::OverlappingRateEntriesError]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          message = struct.message
          if parsed_json["rate_a"].nil?
            rate_a = nil
          else
            rate_a = parsed_json["rate_a"].to_json
            rate_a = FeeSchedules::V3::RateEntry.from_json(json_object: rate_a)
          end
          if parsed_json["rate_b"].nil?
            rate_b = nil
          else
            rate_b = parsed_json["rate_b"].to_json
            rate_b = FeeSchedules::V3::RateEntry.from_json(json_object: rate_b)
          end
          new(message: message, rate_a: rate_a, rate_b: rate_b, additional_properties: struct)
        end

        # Serialize an instance of OverlappingRateEntriesError to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "message": @message, "rate_a": @rate_a, "rate_b": @rate_b }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.message.is_a?(String) != false || raise("Passed value for field obj.message is not the expected type, validation failed.")
          FeeSchedules::V3::RateEntry.validate_raw(obj: obj.rate_a)
          FeeSchedules::V3::RateEntry.validate_raw(obj: obj.rate_b)
        end
      end
    end
  end
end
