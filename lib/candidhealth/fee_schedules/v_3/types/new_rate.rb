# frozen_string_literal: true

require_relative "dimensions"
require_relative "rate_entry"
require "json"

module CandidApiClient
  module FeeSchedules
    module V3
      class NewRate
        attr_reader :dimensions, :entries, :additional_properties

        # @param dimensions [FeeSchedules::V3::Dimensions]
        # @param entries [Array<FeeSchedules::V3::RateEntry>]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [FeeSchedules::V3::NewRate]
        def initialize(dimensions:, entries:, additional_properties: nil)
          # @type [FeeSchedules::V3::Dimensions]
          @dimensions = dimensions
          # @type [Array<FeeSchedules::V3::RateEntry>]
          @entries = entries
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of NewRate
        #
        # @param json_object [JSON]
        # @return [FeeSchedules::V3::NewRate]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          if parsed_json["dimensions"].nil?
            dimensions = nil
          else
            dimensions = parsed_json["dimensions"].to_json
            dimensions = FeeSchedules::V3::Dimensions.from_json(json_object: dimensions)
          end
          entries = parsed_json["entries"]&.map do |v|
            v = v.to_json
            FeeSchedules::V3::RateEntry.from_json(json_object: v)
          end
          new(dimensions: dimensions, entries: entries, additional_properties: struct)
        end

        # Serialize an instance of NewRate to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "dimensions": @dimensions, "entries": @entries }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          FeeSchedules::V3::Dimensions.validate_raw(obj: obj.dimensions)
          obj.entries.is_a?(Array) != false || raise("Passed value for field obj.entries is not the expected type, validation failed.")
        end
      end
    end
  end
end
