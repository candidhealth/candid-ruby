# frozen_string_literal: true

require_relative "dimensions"
require_relative "rate_entry"
require "ostruct"
require "json"

module CandidApiClient
  module FeeSchedules
    module V3
      module Types
        class NewRate
          # @return [CandidApiClient::FeeSchedules::V3::Types::Dimensions]
          attr_reader :dimensions
          # @return [Array<CandidApiClient::FeeSchedules::V3::Types::RateEntry>]
          attr_reader :entries
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param dimensions [CandidApiClient::FeeSchedules::V3::Types::Dimensions]
          # @param entries [Array<CandidApiClient::FeeSchedules::V3::Types::RateEntry>]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::FeeSchedules::V3::Types::NewRate]
          def initialize(dimensions:, entries:, additional_properties: nil)
            @dimensions = dimensions
            @entries = entries
            @additional_properties = additional_properties
            @_field_set = { "dimensions": dimensions, "entries": entries }
          end

          # Deserialize a JSON object to an instance of NewRate
          #
          # @param json_object [String]
          # @return [CandidApiClient::FeeSchedules::V3::Types::NewRate]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            if parsed_json["dimensions"].nil?
              dimensions = nil
            else
              dimensions = parsed_json["dimensions"].to_json
              dimensions = CandidApiClient::FeeSchedules::V3::Types::Dimensions.from_json(json_object: dimensions)
            end
            entries = parsed_json["entries"]&.map do |item|
              item = item.to_json
              CandidApiClient::FeeSchedules::V3::Types::RateEntry.from_json(json_object: item)
            end
            new(
              dimensions: dimensions,
              entries: entries,
              additional_properties: struct
            )
          end

          # Serialize an instance of NewRate to a JSON object
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
            CandidApiClient::FeeSchedules::V3::Types::Dimensions.validate_raw(obj: obj.dimensions)
            obj.entries.is_a?(Array) != false || raise("Passed value for field obj.entries is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
