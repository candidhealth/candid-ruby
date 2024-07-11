# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module Encounters
    module V4
      module Types
        class EncounterExternalIdUniquenessErrorType
          # @return [String]
          attr_reader :external_id
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param external_id [String]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Encounters::V4::Types::EncounterExternalIdUniquenessErrorType]
          def initialize(external_id: OMIT, additional_properties: nil)
            @external_id = external_id if external_id != OMIT
            @additional_properties = additional_properties
            @_field_set = { "external_id": external_id }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of
          #  EncounterExternalIdUniquenessErrorType
          #
          # @param json_object [String]
          # @return [CandidApiClient::Encounters::V4::Types::EncounterExternalIdUniquenessErrorType]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            external_id = struct["external_id"]
            new(external_id: external_id, additional_properties: struct)
          end

          # Serialize an instance of EncounterExternalIdUniquenessErrorType to a JSON object
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
            obj.external_id&.is_a?(String) != false || raise("Passed value for field obj.external_id is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
