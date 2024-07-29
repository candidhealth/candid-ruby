# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module Encounters
    module V4
      module Types
        class SchemaDoesNotExistError
          # @return [String]
          attr_reader :schema_id
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param schema_id [String]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Encounters::V4::Types::SchemaDoesNotExistError]
          def initialize(schema_id:, additional_properties: nil)
            @schema_id = schema_id
            @additional_properties = additional_properties
            @_field_set = { "schema_id": schema_id }
          end

          # Deserialize a JSON object to an instance of SchemaDoesNotExistError
          #
          # @param json_object [String]
          # @return [CandidApiClient::Encounters::V4::Types::SchemaDoesNotExistError]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            schema_id = struct["schema_id"]
            new(schema_id: schema_id, additional_properties: struct)
          end

          # Serialize an instance of SchemaDoesNotExistError to a JSON object
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
            obj.schema_id.is_a?(String) != false || raise("Passed value for field obj.schema_id is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
