# frozen_string_literal: true

require_relative "phone_number_type"
require "json"

module CandidApiClient
  class Commons
    class PhoneNumber
      attr_reader :number, :type, :additional_properties

      # @param number [String]
      # @param type [Commons::PhoneNumberType]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Commons::PhoneNumber]
      def initialize(number:, type:, additional_properties: nil)
        # @type [String]
        @number = number
        # @type [Commons::PhoneNumberType]
        @type = type
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of PhoneNumber
      #
      # @param json_object [JSON]
      # @return [Commons::PhoneNumber]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        number = struct.number
        type = struct.type
        new(number: number, type: type, additional_properties: struct)
      end

      # Serialize an instance of PhoneNumber to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "number": @number, "type": @type }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.number.is_a?(String) != false || raise("Passed value for field obj.number is not the expected type, validation failed.")
        obj.type.is_a?(Commons::PhoneNumberType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      end
    end
  end
end
