# frozen_string_literal: true

require_relative "dimensions"
require "date"
require_relative "rate_entry"
require "ostruct"
require "json"

module CandidApiClient
  module FeeSchedules
    module V3
      module Types
        # A comprehensive rate including the current rate value and all values for
        #  historic time ranges. The time ranges specified by each RateEntry are disjoint.
        #  A rate must always have at least one entry.
        class Rate
          # @return [String]
          attr_reader :rate_id
          # @return [CandidApiClient::FeeSchedules::V3::Types::Dimensions] The dimension values that distinguish this rate from others.
          attr_reader :dimensions
          # @return [Integer] The version of this rate in the system.
          attr_reader :version
          # @return [Date]
          attr_reader :updated_at
          # @return [String]
          attr_reader :updated_by
          # @return [Array<CandidApiClient::FeeSchedules::V3::Types::RateEntry>]
          attr_reader :entries
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param rate_id [String]
          # @param dimensions [CandidApiClient::FeeSchedules::V3::Types::Dimensions] The dimension values that distinguish this rate from others.
          # @param version [Integer] The version of this rate in the system.
          # @param updated_at [Date]
          # @param updated_by [String]
          # @param entries [Array<CandidApiClient::FeeSchedules::V3::Types::RateEntry>]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::FeeSchedules::V3::Types::Rate]
          def initialize(rate_id:, dimensions:, version:, updated_at:, updated_by:, entries:,
                         additional_properties: nil)
            @rate_id = rate_id
            @dimensions = dimensions
            @version = version
            @updated_at = updated_at
            @updated_by = updated_by
            @entries = entries
            @additional_properties = additional_properties
            @_field_set = {
              "rate_id": rate_id,
              "dimensions": dimensions,
              "version": version,
              "updated_at": updated_at,
              "updated_by": updated_by,
              "entries": entries
            }
          end

          # Deserialize a JSON object to an instance of Rate
          #
          # @param json_object [String]
          # @return [CandidApiClient::FeeSchedules::V3::Types::Rate]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            rate_id = struct["rate_id"]
            if parsed_json["dimensions"].nil?
              dimensions = nil
            else
              dimensions = parsed_json["dimensions"].to_json
              dimensions = CandidApiClient::FeeSchedules::V3::Types::Dimensions.from_json(json_object: dimensions)
            end
            version = struct["version"]
            updated_at = (Date.parse(parsed_json["updated_at"]) unless parsed_json["updated_at"].nil?)
            updated_by = struct["updated_by"]
            entries = parsed_json["entries"]&.map do |item|
              item = item.to_json
              CandidApiClient::FeeSchedules::V3::Types::RateEntry.from_json(json_object: item)
            end
            new(
              rate_id: rate_id,
              dimensions: dimensions,
              version: version,
              updated_at: updated_at,
              updated_by: updated_by,
              entries: entries,
              additional_properties: struct
            )
          end

          # Serialize an instance of Rate to a JSON object
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
            obj.rate_id.is_a?(String) != false || raise("Passed value for field obj.rate_id is not the expected type, validation failed.")
            CandidApiClient::FeeSchedules::V3::Types::Dimensions.validate_raw(obj: obj.dimensions)
            obj.version.is_a?(Integer) != false || raise("Passed value for field obj.version is not the expected type, validation failed.")
            obj.updated_at.is_a?(Date) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
            obj.updated_by.is_a?(String) != false || raise("Passed value for field obj.updated_by is not the expected type, validation failed.")
            obj.entries.is_a?(Array) != false || raise("Passed value for field obj.entries is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
