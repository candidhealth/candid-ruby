# frozen_string_literal: true

require_relative "../../commons/types/date_range_optional_end"
require_relative "identifier_code"
require_relative "identifier_value"
require "json"

module CandidApiClient
  class Identifiers
    class IdentifierBase
      attr_reader :period, :identifier_code, :identifier_value, :additional_properties

      # @param period [Commons::DateRangeOptionalEnd]
      # @param identifier_code [Identifiers::IdentifierCode]
      # @param identifier_value [Identifiers::IdentifierValue]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Identifiers::IdentifierBase]
      def initialize(identifier_code:, identifier_value:, period: nil, additional_properties: nil)
        # @type [Commons::DateRangeOptionalEnd]
        @period = period
        # @type [Identifiers::IdentifierCode]
        @identifier_code = identifier_code
        # @type [Identifiers::IdentifierValue]
        @identifier_value = identifier_value
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of IdentifierBase
      #
      # @param json_object [JSON]
      # @return [Identifiers::IdentifierBase]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["period"].nil?
          period = nil
        else
          period = parsed_json["period"].to_json
          period = Commons::DateRangeOptionalEnd.from_json(json_object: period)
        end
        identifier_code = struct.identifier_code
        if parsed_json["identifier_value"].nil?
          identifier_value = nil
        else
          identifier_value = parsed_json["identifier_value"].to_json
          identifier_value = Identifiers::IdentifierValue.from_json(json_object: identifier_value)
        end
        new(period: period, identifier_code: identifier_code, identifier_value: identifier_value,
            additional_properties: struct)
      end

      # Serialize an instance of IdentifierBase to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "period": @period, "identifier_code": @identifier_code, "identifier_value": @identifier_value }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.period.nil? || Commons::DateRangeOptionalEnd.validate_raw(obj: obj.period)
        obj.identifier_code.is_a?(Identifiers::IdentifierCode) != false || raise("Passed value for field obj.identifier_code is not the expected type, validation failed.")
        Identifiers::IdentifierValue.validate_raw(obj: obj.identifier_value)
      end
    end
  end
end
