# frozen_string_literal: true

require "json"

module CandidApiClient
  module Encounters
    module V4
      class EncounterGuarantorMissingContactInfoErrorType
        attr_reader :missing_fields, :additional_properties

        # @param missing_fields [Array<String>]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Encounters::V4::EncounterGuarantorMissingContactInfoErrorType]
        def initialize(missing_fields:, additional_properties: nil)
          # @type [Array<String>]
          @missing_fields = missing_fields
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of EncounterGuarantorMissingContactInfoErrorType
        #
        # @param json_object [JSON]
        # @return [Encounters::V4::EncounterGuarantorMissingContactInfoErrorType]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          JSON.parse(json_object)
          missing_fields = struct.missing_fields
          new(missing_fields: missing_fields, additional_properties: struct)
        end

        # Serialize an instance of EncounterGuarantorMissingContactInfoErrorType to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "missing_fields": @missing_fields }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
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
