# frozen_string_literal: true

require_relative "identifier_id"
require_relative "identifier_code"
require_relative "identifier_value"
require_relative "../../commons/types/removable_date_range_optional_end"
require "json"

module CandidApiClient
  class Identifiers
    class IdentifierUpdate
      attr_reader :identifier_id, :identifier_code, :identifier_value, :period, :additional_properties

      # @param identifier_id [Identifiers::IDENTIFIER_ID]
      # @param identifier_code [Identifiers::IdentifierCode]
      # @param identifier_value [Identifiers::IdentifierValue]
      # @param period [Commons::RemovableDateRangeOptionalEnd]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Identifiers::IdentifierUpdate]
      def initialize(identifier_id:, identifier_code: nil, identifier_value: nil, period: nil,
                     additional_properties: nil)
        # @type [Identifiers::IDENTIFIER_ID]
        @identifier_id = identifier_id
        # @type [Identifiers::IdentifierCode]
        @identifier_code = identifier_code
        # @type [Identifiers::IdentifierValue]
        @identifier_value = identifier_value
        # @type [Commons::RemovableDateRangeOptionalEnd]
        @period = period
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of IdentifierUpdate
      #
      # @param json_object [JSON]
      # @return [Identifiers::IdentifierUpdate]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        identifier_id = struct.identifier_id
        identifier_code = struct.identifier_code
        if parsed_json["identifier_value"].nil?
          identifier_value = nil
        else
          identifier_value = parsed_json["identifier_value"].to_json
          identifier_value = Identifiers::IdentifierValue.from_json(json_object: identifier_value)
        end
        if parsed_json["period"].nil?
          period = nil
        else
          period = parsed_json["period"].to_json
          period = Commons::RemovableDateRangeOptionalEnd.from_json(json_object: period)
        end
        new(identifier_id: identifier_id, identifier_code: identifier_code, identifier_value: identifier_value,
            period: period, additional_properties: struct)
      end

      # Serialize an instance of IdentifierUpdate to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "identifier_id": @identifier_id,
          "identifier_code": @identifier_code,
          "identifier_value": @identifier_value,
          "period": @period
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.identifier_id.is_a?(String) != false || raise("Passed value for field obj.identifier_id is not the expected type, validation failed.")
        obj.identifier_code&.is_a?(Identifiers::IdentifierCode) != false || raise("Passed value for field obj.identifier_code is not the expected type, validation failed.")
        obj.identifier_value.nil? || Identifiers::IdentifierValue.validate_raw(obj: obj.identifier_value)
        obj.period.nil? || Commons::RemovableDateRangeOptionalEnd.validate_raw(obj: obj.period)
      end
    end
  end
end
