# frozen_string_literal: true

require "json"

module CandidApiClient
  class Commons
    class EntityConflictErrorMessage
      attr_reader :entity_name, :additional_properties

      # @param entity_name [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Commons::EntityConflictErrorMessage]
      def initialize(entity_name:, additional_properties: nil)
        # @type [String]
        @entity_name = entity_name
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of EntityConflictErrorMessage
      #
      # @param json_object [JSON]
      # @return [Commons::EntityConflictErrorMessage]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        entity_name = struct.entity_name
        new(entity_name: entity_name, additional_properties: struct)
      end

      # Serialize an instance of EntityConflictErrorMessage to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "entity_name": @entity_name }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.entity_name.is_a?(String) != false || raise("Passed value for field obj.entity_name is not the expected type, validation failed.")
      end
    end
  end
end
