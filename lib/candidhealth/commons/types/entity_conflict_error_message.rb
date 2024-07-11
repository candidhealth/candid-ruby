# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module Commons
    module Types
      class EntityConflictErrorMessage
        # @return [String]
        attr_reader :entity_name
        # @return [OpenStruct] Additional properties unmapped to the current class definition
        attr_reader :additional_properties
        # @return [Object]
        attr_reader :_field_set
        protected :_field_set

        OMIT = Object.new

        # @param entity_name [String]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [CandidApiClient::Commons::Types::EntityConflictErrorMessage]
        def initialize(entity_name:, additional_properties: nil)
          @entity_name = entity_name
          @additional_properties = additional_properties
          @_field_set = { "entity_name": entity_name }
        end

        # Deserialize a JSON object to an instance of EntityConflictErrorMessage
        #
        # @param json_object [String]
        # @return [CandidApiClient::Commons::Types::EntityConflictErrorMessage]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          entity_name = struct["entity_name"]
          new(entity_name: entity_name, additional_properties: struct)
        end

        # Serialize an instance of EntityConflictErrorMessage to a JSON object
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
          obj.entity_name.is_a?(String) != false || raise("Passed value for field obj.entity_name is not the expected type, validation failed.")
        end
      end
    end
  end
end
