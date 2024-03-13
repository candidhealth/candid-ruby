# frozen_string_literal: true

require_relative "era_id"
require_relative "../../commons/types/date"
require "json"

module CandidApiClient
  class Era
    class Era
      attr_reader :era_id, :check_number, :check_date, :additional_properties

      # @param era_id [Era::ERA_ID]
      # @param check_number [String]
      # @param check_date [Commons::DATE]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Era::Era]
      def initialize(era_id:, check_number:, check_date:, additional_properties: nil)
        # @type [Era::ERA_ID]
        @era_id = era_id
        # @type [String]
        @check_number = check_number
        # @type [Commons::DATE]
        @check_date = check_date
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of Era
      #
      # @param json_object [JSON]
      # @return [Era::Era]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        era_id = struct.era_id
        check_number = struct.check_number
        check_date = struct.check_date
        new(era_id: era_id, check_number: check_number, check_date: check_date, additional_properties: struct)
      end

      # Serialize an instance of Era to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "era_id": @era_id, "check_number": @check_number, "check_date": @check_date }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.era_id.is_a?(String) != false || raise("Passed value for field obj.era_id is not the expected type, validation failed.")
        obj.check_number.is_a?(String) != false || raise("Passed value for field obj.check_number is not the expected type, validation failed.")
        obj.check_date.is_a?(String) != false || raise("Passed value for field obj.check_date is not the expected type, validation failed.")
      end
    end
  end
end
