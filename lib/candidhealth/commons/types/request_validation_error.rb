# frozen_string_literal: true

require "json"

module CandidApiClient
  class Commons
    class RequestValidationError
      attr_reader :field_name, :human_readable_message, :additional_properties

      # @param field_name [String]
      # @param human_readable_message [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Commons::RequestValidationError]
      def initialize(field_name:, human_readable_message: nil, additional_properties: nil)
        # @type [String]
        @field_name = field_name
        # @type [String]
        @human_readable_message = human_readable_message
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of RequestValidationError
      #
      # @param json_object [JSON]
      # @return [Commons::RequestValidationError]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        field_name = struct.fieldName
        human_readable_message = struct.humanReadableMessage
        new(field_name: field_name, human_readable_message: human_readable_message, additional_properties: struct)
      end

      # Serialize an instance of RequestValidationError to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "fieldName": @field_name, "humanReadableMessage": @human_readable_message }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.field_name.is_a?(String) != false || raise("Passed value for field obj.field_name is not the expected type, validation failed.")
        obj.human_readable_message&.is_a?(String) != false || raise("Passed value for field obj.human_readable_message is not the expected type, validation failed.")
      end
    end
  end
end
