# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module Encounters
    module V4
      module Types
        class InvalidTagNamesErrorType
          # @return [Array<String>]
          attr_reader :invalid_tag_names
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param invalid_tag_names [Array<String>]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Encounters::V4::Types::InvalidTagNamesErrorType]
          def initialize(invalid_tag_names:, additional_properties: nil)
            @invalid_tag_names = invalid_tag_names
            @additional_properties = additional_properties
            @_field_set = { "invalid_tag_names": invalid_tag_names }
          end

          # Deserialize a JSON object to an instance of InvalidTagNamesErrorType
          #
          # @param json_object [String]
          # @return [CandidApiClient::Encounters::V4::Types::InvalidTagNamesErrorType]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            invalid_tag_names = struct["invalid_tag_names"]
            new(invalid_tag_names: invalid_tag_names, additional_properties: struct)
          end

          # Serialize an instance of InvalidTagNamesErrorType to a JSON object
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
            obj.invalid_tag_names.is_a?(Array) != false || raise("Passed value for field obj.invalid_tag_names is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
