# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module Encounters
    module V4
      module Types
        class KeyDoesNotExistError
          # @return [String]
          attr_reader :key
          # @return [String]
          attr_reader :schema_id
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param key [String]
          # @param schema_id [String]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Encounters::V4::Types::KeyDoesNotExistError]
          def initialize(key:, schema_id:, additional_properties: nil)
            @key = key
            @schema_id = schema_id
            @additional_properties = additional_properties
            @_field_set = { "key": key, "schema_id": schema_id }
          end

          # Deserialize a JSON object to an instance of KeyDoesNotExistError
          #
          # @param json_object [String]
          # @return [CandidApiClient::Encounters::V4::Types::KeyDoesNotExistError]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            key = struct["key"]
            schema_id = struct["schema_id"]
            new(
              key: key,
              schema_id: schema_id,
              additional_properties: struct
            )
          end

          # Serialize an instance of KeyDoesNotExistError to a JSON object
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
            obj.key.is_a?(String) != false || raise("Passed value for field obj.key is not the expected type, validation failed.")
            obj.schema_id.is_a?(String) != false || raise("Passed value for field obj.schema_id is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
