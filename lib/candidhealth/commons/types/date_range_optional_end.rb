# frozen_string_literal: true

require_relative "date"
require "json"

module CandidApiClient
  class Commons
    class DateRangeOptionalEnd
      attr_reader :start_date, :end_date, :additional_properties

      # @param start_date [Commons::DATE]
      # @param end_date [Commons::DATE]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Commons::DateRangeOptionalEnd]
      def initialize(start_date:, end_date: nil, additional_properties: nil)
        # @type [Commons::DATE]
        @start_date = start_date
        # @type [Commons::DATE]
        @end_date = end_date
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of DateRangeOptionalEnd
      #
      # @param json_object [JSON]
      # @return [Commons::DateRangeOptionalEnd]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        start_date = struct.start_date
        end_date = struct.end_date
        new(start_date: start_date, end_date: end_date, additional_properties: struct)
      end

      # Serialize an instance of DateRangeOptionalEnd to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "start_date": @start_date, "end_date": @end_date }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.start_date.is_a?(String) != false || raise("Passed value for field obj.start_date is not the expected type, validation failed.")
        obj.end_date&.is_a?(String) != false || raise("Passed value for field obj.end_date is not the expected type, validation failed.")
      end
    end
  end
end
