# frozen_string_literal: true

require_relative "schema_instance_validation_error"
require "ostruct"
require "json"

module CandidApiClient
  module Encounters
    module V4
      module Types
        class SchemaInstanceValidationFailure
          # @return [Array<CandidApiClient::Encounters::V4::Types::SchemaInstanceValidationError>]
          attr_reader :errors
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param errors [Array<CandidApiClient::Encounters::V4::Types::SchemaInstanceValidationError>]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Encounters::V4::Types::SchemaInstanceValidationFailure]
          def initialize(errors:, additional_properties: nil)
            @errors = errors
            @additional_properties = additional_properties
            @_field_set = { "errors": errors }
          end

          # Deserialize a JSON object to an instance of SchemaInstanceValidationFailure
          #
          # @param json_object [String]
          # @return [CandidApiClient::Encounters::V4::Types::SchemaInstanceValidationFailure]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            errors = parsed_json["errors"]&.map do |item|
              item = item.to_json
              CandidApiClient::Encounters::V4::Types::SchemaInstanceValidationError.from_json(json_object: item)
            end
            new(errors: errors, additional_properties: struct)
          end

          # Serialize an instance of SchemaInstanceValidationFailure to a JSON object
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
