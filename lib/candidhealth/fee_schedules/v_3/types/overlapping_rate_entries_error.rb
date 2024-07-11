# frozen_string_literal: true

require_relative "rate_entry"
require "ostruct"
require "json"

module CandidApiClient
  module FeeSchedules
    module V3
      module Types
        # This error is thrown when two rate entries have time ranges that overlap.
        class OverlappingRateEntriesError
          # @return [String]
          attr_reader :message
          # @return [CandidApiClient::FeeSchedules::V3::Types::RateEntry]
          attr_reader :rate_a
          # @return [CandidApiClient::FeeSchedules::V3::Types::RateEntry]
          attr_reader :rate_b
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param message [String]
          # @param rate_a [CandidApiClient::FeeSchedules::V3::Types::RateEntry]
          # @param rate_b [CandidApiClient::FeeSchedules::V3::Types::RateEntry]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::FeeSchedules::V3::Types::OverlappingRateEntriesError]
          def initialize(message:, rate_a:, rate_b:, additional_properties: nil)
            @message = message
            @rate_a = rate_a
            @rate_b = rate_b
            @additional_properties = additional_properties
            @_field_set = { "message": message, "rate_a": rate_a, "rate_b": rate_b }
          end

          # Deserialize a JSON object to an instance of OverlappingRateEntriesError
          #
          # @param json_object [String]
          # @return [CandidApiClient::FeeSchedules::V3::Types::OverlappingRateEntriesError]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            message = struct["message"]
            if parsed_json["rate_a"].nil?
              rate_a = nil
            else
              rate_a = parsed_json["rate_a"].to_json
              rate_a = CandidApiClient::FeeSchedules::V3::Types::RateEntry.from_json(json_object: rate_a)
            end
            if parsed_json["rate_b"].nil?
              rate_b = nil
            else
              rate_b = parsed_json["rate_b"].to_json
              rate_b = CandidApiClient::FeeSchedules::V3::Types::RateEntry.from_json(json_object: rate_b)
            end
            new(
              message: message,
              rate_a: rate_a,
              rate_b: rate_b,
              additional_properties: struct
            )
          end

          # Serialize an instance of OverlappingRateEntriesError to a JSON object
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
            obj.message.is_a?(String) != false || raise("Passed value for field obj.message is not the expected type, validation failed.")
            CandidApiClient::FeeSchedules::V3::Types::RateEntry.validate_raw(obj: obj.rate_a)
            CandidApiClient::FeeSchedules::V3::Types::RateEntry.validate_raw(obj: obj.rate_b)
          end
        end
      end
    end
  end
end
