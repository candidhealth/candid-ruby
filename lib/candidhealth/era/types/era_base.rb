# frozen_string_literal: true

require_relative "../../commons/types/date"
require "json"

module CandidApiClient
  class Era
    class EraBase
      attr_reader :check_number, :check_date, :additional_properties

      # @param check_number [String]
      # @param check_date [Commons::DATE]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Era::EraBase]
      def initialize(check_number:, check_date:, additional_properties: nil)
        # @type [String]
        @check_number = check_number
        # @type [Commons::DATE]
        @check_date = check_date
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of EraBase
      #
      # @param json_object [JSON]
      # @return [Era::EraBase]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        check_number = struct.check_number
        check_date = struct.check_date
        new(check_number: check_number, check_date: check_date, additional_properties: struct)
      end

      # Serialize an instance of EraBase to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "check_number": @check_number, "check_date": @check_date }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.check_number.is_a?(String) != false || raise("Passed value for field obj.check_number is not the expected type, validation failed.")
        obj.check_date.is_a?(String) != false || raise("Passed value for field obj.check_date is not the expected type, validation failed.")
      end
    end
  end
end
