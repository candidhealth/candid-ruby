# frozen_string_literal: true

require "date"
require "ostruct"
require "json"

module CandidApiClient
  module FeeSchedules
    module V3
      module Types
        # A rate value in cents for a specific time range. Rate entries can be
        #  deactivated, which is set by using the deelte_rate endpoint. Deactivated rate
        #  entries are not considered when matching against service lines.
        class RateEntry
          # @return [Date]
          attr_reader :start_date
          # @return [Date]
          attr_reader :end_date
          # @return [Integer]
          attr_reader :rate_cents
          # @return [Boolean]
          attr_reader :is_deactivated
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param start_date [Date]
          # @param end_date [Date]
          # @param rate_cents [Integer]
          # @param is_deactivated [Boolean]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::FeeSchedules::V3::Types::RateEntry]
          def initialize(start_date:, rate_cents:, is_deactivated:, end_date: OMIT, additional_properties: nil)
            @start_date = start_date
            @end_date = end_date if end_date != OMIT
            @rate_cents = rate_cents
            @is_deactivated = is_deactivated
            @additional_properties = additional_properties
            @_field_set = {
              "start_date": start_date,
              "end_date": end_date,
              "rate_cents": rate_cents,
              "is_deactivated": is_deactivated
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of RateEntry
          #
          # @param json_object [String]
          # @return [CandidApiClient::FeeSchedules::V3::Types::RateEntry]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            start_date = (Date.parse(parsed_json["start_date"]) unless parsed_json["start_date"].nil?)
            end_date = (Date.parse(parsed_json["end_date"]) unless parsed_json["end_date"].nil?)
            rate_cents = struct["rate_cents"]
            is_deactivated = struct["is_deactivated"]
            new(
              start_date: start_date,
              end_date: end_date,
              rate_cents: rate_cents,
              is_deactivated: is_deactivated,
              additional_properties: struct
            )
          end

          # Serialize an instance of RateEntry to a JSON object
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
            obj.start_date.is_a?(Date) != false || raise("Passed value for field obj.start_date is not the expected type, validation failed.")
            obj.end_date&.is_a?(Date) != false || raise("Passed value for field obj.end_date is not the expected type, validation failed.")
            obj.rate_cents.is_a?(Integer) != false || raise("Passed value for field obj.rate_cents is not the expected type, validation failed.")
            obj.is_deactivated.is_a?(Boolean) != false || raise("Passed value for field obj.is_deactivated is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
