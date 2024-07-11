# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module Encounters
    module V4
      module Types
        class EncounterGuarantorMissingContactInfoErrorType
          # @return [Array<String>]
          attr_reader :missing_fields
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param missing_fields [Array<String>]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Encounters::V4::Types::EncounterGuarantorMissingContactInfoErrorType]
          def initialize(missing_fields:, additional_properties: nil)
            @missing_fields = missing_fields
            @additional_properties = additional_properties
            @_field_set = { "missing_fields": missing_fields }
          end

          # Deserialize a JSON object to an instance of
          #  EncounterGuarantorMissingContactInfoErrorType
          #
          # @param json_object [String]
          # @return [CandidApiClient::Encounters::V4::Types::EncounterGuarantorMissingContactInfoErrorType]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            missing_fields = struct["missing_fields"]
            new(missing_fields: missing_fields, additional_properties: struct)
          end

          # Serialize an instance of EncounterGuarantorMissingContactInfoErrorType to a JSON
          #  object
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
            obj.missing_fields.is_a?(Array) != false || raise("Passed value for field obj.missing_fields is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
