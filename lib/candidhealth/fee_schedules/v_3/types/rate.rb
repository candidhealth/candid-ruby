# frozen_string_literal: true

require_relative "../../../commons/types/rate_id"
require_relative "dimensions"
require "date"
require_relative "../../../commons/types/user_id"
require_relative "rate_entry"
require "json"

module CandidApiClient
  module FeeSchedules
    module V3
      # A comprehensive rate including the current rate value and all values for historic time ranges. The time ranges specified by each RateEntry are disjoint. A rate must always have at least one entry.
      class Rate
        attr_reader :rate_id, :dimensions, :version, :updated_at, :updated_by, :entries, :additional_properties

        # @param rate_id [Commons::RATE_ID]
        # @param dimensions [FeeSchedules::V3::Dimensions] The dimension values that distinguish this rate from others.
        # @param version [Integer] The version of this rate in the system.
        # @param updated_at [Date]
        # @param updated_by [Commons::USER_ID]
        # @param entries [Array<FeeSchedules::V3::RateEntry>]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [FeeSchedules::V3::Rate]
        def initialize(rate_id:, dimensions:, version:, updated_at:, updated_by:, entries:, additional_properties: nil)
          # @type [Commons::RATE_ID]
          @rate_id = rate_id
          # @type [FeeSchedules::V3::Dimensions] The dimension values that distinguish this rate from others.
          @dimensions = dimensions
          # @type [Integer] The version of this rate in the system.
          @version = version
          # @type [Date]
          @updated_at = updated_at
          # @type [Commons::USER_ID]
          @updated_by = updated_by
          # @type [Array<FeeSchedules::V3::RateEntry>]
          @entries = entries
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of Rate
        #
        # @param json_object [JSON]
        # @return [FeeSchedules::V3::Rate]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          rate_id = struct.rate_id
          if parsed_json["dimensions"].nil?
            dimensions = nil
          else
            dimensions = parsed_json["dimensions"].to_json
            dimensions = FeeSchedules::V3::Dimensions.from_json(json_object: dimensions)
          end
          version = struct.version
          updated_at = (Date.parse(parsed_json["updated_at"]) unless parsed_json["updated_at"].nil?)
          updated_by = struct.updated_by
          entries = parsed_json["entries"]&.map do |v|
            v = v.to_json
            FeeSchedules::V3::RateEntry.from_json(json_object: v)
          end
          new(rate_id: rate_id, dimensions: dimensions, version: version, updated_at: updated_at,
              updated_by: updated_by, entries: entries, additional_properties: struct)
        end

        # Serialize an instance of Rate to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "rate_id": @rate_id,
            "dimensions": @dimensions,
            "version": @version,
            "updated_at": @updated_at,
            "updated_by": @updated_by,
            "entries": @entries
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.rate_id.is_a?(UUID) != false || raise("Passed value for field obj.rate_id is not the expected type, validation failed.")
          FeeSchedules::V3::Dimensions.validate_raw(obj: obj.dimensions)
          obj.version.is_a?(Integer) != false || raise("Passed value for field obj.version is not the expected type, validation failed.")
          obj.updated_at.is_a?(Date) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
          obj.updated_by.is_a?(UUID) != false || raise("Passed value for field obj.updated_by is not the expected type, validation failed.")
          obj.entries.is_a?(Array) != false || raise("Passed value for field obj.entries is not the expected type, validation failed.")
        end
      end
    end
  end
end
