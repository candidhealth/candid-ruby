# frozen_string_literal: true

require_relative "rate_entry"
require "ostruct"
require "json"

module CandidApiClient
  module FeeSchedules
    module V3
      module Types
        class NewRateVersion
          # @return [String]
          attr_reader :rate_id
          # @return [Integer] New versions of rates must indicate the exact version they modify. When the
          #  system attempts to save this new version, if the latest version in the system
          #  does not equal this previos_version, the request will be rejected with a
          #  EntityConflictError.
          attr_reader :previous_version
          # @return [Array<CandidApiClient::FeeSchedules::V3::Types::RateEntry>]
          attr_reader :entries
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param rate_id [String]
          # @param previous_version [Integer] New versions of rates must indicate the exact version they modify. When the
          #  system attempts to save this new version, if the latest version in the system
          #  does not equal this previos_version, the request will be rejected with a
          #  EntityConflictError.
          # @param entries [Array<CandidApiClient::FeeSchedules::V3::Types::RateEntry>]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::FeeSchedules::V3::Types::NewRateVersion]
          def initialize(rate_id:, previous_version:, entries:, additional_properties: nil)
            @rate_id = rate_id
            @previous_version = previous_version
            @entries = entries
            @additional_properties = additional_properties
            @_field_set = { "rate_id": rate_id, "previous_version": previous_version, "entries": entries }
          end

          # Deserialize a JSON object to an instance of NewRateVersion
          #
          # @param json_object [String]
          # @return [CandidApiClient::FeeSchedules::V3::Types::NewRateVersion]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            rate_id = struct["rate_id"]
            previous_version = struct["previous_version"]
            entries = parsed_json["entries"]&.map do |item|
              item = item.to_json
              CandidApiClient::FeeSchedules::V3::Types::RateEntry.from_json(json_object: item)
            end
            new(
              rate_id: rate_id,
              previous_version: previous_version,
              entries: entries,
              additional_properties: struct
            )
          end

          # Serialize an instance of NewRateVersion to a JSON object
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
            obj.previous_version.is_a?(Integer) != false || raise("Passed value for field obj.previous_version is not the expected type, validation failed.")
            obj.entries.is_a?(Array) != false || raise("Passed value for field obj.entries is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
