# frozen_string_literal: true

require_relative "schema_field"
require "ostruct"
require "json"

module CandidApiClient
  module CustomSchemas
    module V1
      module Types
        class Schema
          # @return [String]
          attr_reader :id
          # @return [String]
          attr_reader :name
          # @return [String]
          attr_reader :description
          # @return [Array<CandidApiClient::CustomSchemas::V1::Types::SchemaField>]
          attr_reader :fields
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param id [String]
          # @param name [String]
          # @param description [String]
          # @param fields [Array<CandidApiClient::CustomSchemas::V1::Types::SchemaField>]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::CustomSchemas::V1::Types::Schema]
          def initialize(id:, name:, fields:, description: OMIT, additional_properties: nil)
            @id = id
            @name = name
            @description = description if description != OMIT
            @fields = fields
            @additional_properties = additional_properties
            @_field_set = { "id": id, "name": name, "description": description, "fields": fields }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of Schema
          #
          # @param json_object [String]
          # @return [CandidApiClient::CustomSchemas::V1::Types::Schema]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            id = struct["id"]
            name = struct["name"]
            description = struct["description"]
            fields = parsed_json["fields"]&.map do |item|
              item = item.to_json
              CandidApiClient::CustomSchemas::V1::Types::SchemaField.from_json(json_object: item)
            end
            new(
              id: id,
              name: name,
              description: description,
              fields: fields,
              additional_properties: struct
            )
          end

          # Serialize an instance of Schema to a JSON object
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
            obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
            obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
            obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
            obj.fields.is_a?(Array) != false || raise("Passed value for field obj.fields is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
