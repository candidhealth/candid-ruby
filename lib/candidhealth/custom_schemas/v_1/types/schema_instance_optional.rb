# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module CustomSchemas
    module V1
      module Types
        class SchemaInstanceOptional
          # @return [String] The schema to which the content must adhere.
          attr_reader :schema_id
          # @return [Hash{String => Object}] A set of key-value pairs that adhere to the naming and type convention of the
          #  schema. Not all keys in the schema must be included, but attaching any key that
          #  does not exist in the schema or attaching a key with the incorrect value type
          #  will result in errors.
          attr_reader :content
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param schema_id [String] The schema to which the content must adhere.
          # @param content [Hash{String => Object}] A set of key-value pairs that adhere to the naming and type convention of the
          #  schema. Not all keys in the schema must be included, but attaching any key that
          #  does not exist in the schema or attaching a key with the incorrect value type
          #  will result in errors.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::CustomSchemas::V1::Types::SchemaInstanceOptional]
          def initialize(schema_id: OMIT, content: OMIT, additional_properties: nil)
            @schema_id = schema_id if schema_id != OMIT
            @content = content if content != OMIT
            @additional_properties = additional_properties
            @_field_set = { "schema_id": schema_id, "content": content }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of SchemaInstanceOptional
          #
          # @param json_object [String]
          # @return [CandidApiClient::CustomSchemas::V1::Types::SchemaInstanceOptional]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            schema_id = struct["schema_id"]
            content = struct["content"]
            new(
              schema_id: schema_id,
              content: content,
              additional_properties: struct
            )
          end

          # Serialize an instance of SchemaInstanceOptional to a JSON object
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
            obj.schema_id&.is_a?(String) != false || raise("Passed value for field obj.schema_id is not the expected type, validation failed.")
            obj.content&.is_a?(Hash) != false || raise("Passed value for field obj.content is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
