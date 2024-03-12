# frozen_string_literal: true

require_relative "../../../commons/types/encounter_external_id"
require "json"

module CandidApiClient
  module Encounters
    module V4
      class EncounterExternalIdUniquenessErrorType
        attr_reader :external_id, :additional_properties

        # @param external_id [Commons::ENCOUNTER_EXTERNAL_ID]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Encounters::V4::EncounterExternalIdUniquenessErrorType]
        def initialize(external_id: nil, additional_properties: nil)
          # @type [Commons::ENCOUNTER_EXTERNAL_ID]
          @external_id = external_id
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of EncounterExternalIdUniquenessErrorType
        #
        # @param json_object [JSON]
        # @return [Encounters::V4::EncounterExternalIdUniquenessErrorType]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          JSON.parse(json_object)
          external_id = struct.external_id
          new(external_id: external_id, additional_properties: struct)
        end

        # Serialize an instance of EncounterExternalIdUniquenessErrorType to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "external_id": @external_id }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.external_id&.is_a?(String) != false || raise("Passed value for field obj.external_id is not the expected type, validation failed.")
        end
      end
    end
  end
end
