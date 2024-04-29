# frozen_string_literal: true

require_relative "../../../commons/types/rate_id"
require_relative "rate_entry"
require "json"

module CandidApiClient
  module FeeSchedules
    module V3
      class NewRateVersion
        attr_reader :rate_id, :previous_version, :entries, :additional_properties

        # @param rate_id [Commons::RATE_ID]
        # @param previous_version [Integer] New versions of rates must indicate the exact version they modify. When the system attempts to save this new version, if the latest version in the system does not equal this previos_version, the request will be rejected with a EntityConflictError.
        # @param entries [Array<FeeSchedules::V3::RateEntry>]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [FeeSchedules::V3::NewRateVersion]
        def initialize(rate_id:, previous_version:, entries:, additional_properties: nil)
          # @type [Commons::RATE_ID]
          @rate_id = rate_id
          # @type [Integer] New versions of rates must indicate the exact version they modify. When the system attempts to save this new version, if the latest version in the system does not equal this previos_version, the request will be rejected with a EntityConflictError.
          @previous_version = previous_version
          # @type [Array<FeeSchedules::V3::RateEntry>]
          @entries = entries
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of NewRateVersion
        #
        # @param json_object [JSON]
        # @return [FeeSchedules::V3::NewRateVersion]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          rate_id = struct.rate_id
          previous_version = struct.previous_version
          entries = parsed_json["entries"]&.map do |v|
            v = v.to_json
            FeeSchedules::V3::RateEntry.from_json(json_object: v)
          end
          new(rate_id: rate_id, previous_version: previous_version, entries: entries, additional_properties: struct)
        end

        # Serialize an instance of NewRateVersion to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "rate_id": @rate_id, "previous_version": @previous_version, "entries": @entries }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.rate_id.is_a?(UUID) != false || raise("Passed value for field obj.rate_id is not the expected type, validation failed.")
          obj.previous_version.is_a?(Integer) != false || raise("Passed value for field obj.previous_version is not the expected type, validation failed.")
          obj.entries.is_a?(Array) != false || raise("Passed value for field obj.entries is not the expected type, validation failed.")
        end
      end
    end
  end
end
