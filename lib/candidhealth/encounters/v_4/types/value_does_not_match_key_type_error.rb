# frozen_string_literal: true

require_relative "../../../commons/types/primitive"
require "ostruct"
require "json"

module CandidApiClient
  module Encounters
    module V4
      module Types
        class ValueDoesNotMatchKeyTypeError
          # @return [String]
          attr_reader :schema_id
          # @return [String]
          attr_reader :key
          # @return [CandidApiClient::Commons::Types::Primitive]
          attr_reader :expected_value_type
          # @return [Object]
          attr_reader :value
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param schema_id [String]
          # @param key [String]
          # @param expected_value_type [CandidApiClient::Commons::Types::Primitive]
          # @param value [Object]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Encounters::V4::Types::ValueDoesNotMatchKeyTypeError]
          def initialize(schema_id:, key:, expected_value_type:, value:, additional_properties: nil)
            @schema_id = schema_id
            @key = key
            @expected_value_type = expected_value_type
            @value = value
            @additional_properties = additional_properties
            @_field_set = {
              "schema_id": schema_id,
              "key": key,
              "expected_value_type": expected_value_type,
              "value": value
            }
          end

          # Deserialize a JSON object to an instance of ValueDoesNotMatchKeyTypeError
          #
          # @param json_object [String]
          # @return [CandidApiClient::Encounters::V4::Types::ValueDoesNotMatchKeyTypeError]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            schema_id = struct["schema_id"]
            key = struct["key"]
            expected_value_type = struct["expected_value_type"]
            value = struct["value"]
            new(
              schema_id: schema_id,
              key: key,
              expected_value_type: expected_value_type,
              value: value,
              additional_properties: struct
            )
          end

          # Serialize an instance of ValueDoesNotMatchKeyTypeError to a JSON object
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
            obj.key.is_a?(String) != false || raise("Passed value for field obj.key is not the expected type, validation failed.")
            obj.expected_value_type.is_a?(CandidApiClient::Commons::Types::Primitive) != false || raise("Passed value for field obj.expected_value_type is not the expected type, validation failed.")
            obj.value.is_a?(Object) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
