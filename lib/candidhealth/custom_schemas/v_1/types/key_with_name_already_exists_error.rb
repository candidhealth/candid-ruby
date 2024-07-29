# frozen_string_literal: true

require_relative "../../../commons/types/primitive"
require "ostruct"
require "json"

module CandidApiClient
  module CustomSchemas
    module V1
      module Types
        class KeyWithNameAlreadyExistsError
          # @return [String]
          attr_reader :key
          # @return [CandidApiClient::Commons::Types::Primitive]
          attr_reader :value_type
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param key [String]
          # @param value_type [CandidApiClient::Commons::Types::Primitive]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::CustomSchemas::V1::Types::KeyWithNameAlreadyExistsError]
          def initialize(key:, value_type:, additional_properties: nil)
            @key = key
            @value_type = value_type
            @additional_properties = additional_properties
            @_field_set = { "key": key, "value_type": value_type }
          end

          # Deserialize a JSON object to an instance of KeyWithNameAlreadyExistsError
          #
          # @param json_object [String]
          # @return [CandidApiClient::CustomSchemas::V1::Types::KeyWithNameAlreadyExistsError]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            key = struct["key"]
            value_type = struct["value_type"]
            new(
              key: key,
              value_type: value_type,
              additional_properties: struct
            )
          end

          # Serialize an instance of KeyWithNameAlreadyExistsError to a JSON object
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
            obj.value_type.is_a?(CandidApiClient::Commons::Types::Primitive) != false || raise("Passed value for field obj.value_type is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
