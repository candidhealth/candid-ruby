# frozen_string_literal: true

require_relative "schema_validation_error"
require "ostruct"
require "json"

module CandidApiClient
  module CustomSchemas
    module V1
      module Types
        class SchemaValidationFailure
          # @return [Array<CandidApiClient::CustomSchemas::V1::Types::SchemaValidationError>]
          attr_reader :errors
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param errors [Array<CandidApiClient::CustomSchemas::V1::Types::SchemaValidationError>]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::CustomSchemas::V1::Types::SchemaValidationFailure]
          def initialize(errors:, additional_properties: nil)
            @errors = errors
            @additional_properties = additional_properties
            @_field_set = { "errors": errors }
          end

          # Deserialize a JSON object to an instance of SchemaValidationFailure
          #
          # @param json_object [String]
          # @return [CandidApiClient::CustomSchemas::V1::Types::SchemaValidationFailure]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            errors = parsed_json["errors"]&.map do |item|
              item = item.to_json
              CandidApiClient::CustomSchemas::V1::Types::SchemaValidationError.from_json(json_object: item)
            end
            new(errors: errors, additional_properties: struct)
          end

          # Serialize an instance of SchemaValidationFailure to a JSON object
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
            obj.errors.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
