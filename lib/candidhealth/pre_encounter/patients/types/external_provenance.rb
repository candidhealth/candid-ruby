# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Patients
      module Types
        # Information about the upstream system that owns this patient data.
        class ExternalProvenance
          # @return [String]
          attr_reader :external_id
          # @return [String]
          attr_reader :system_name
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param external_id [String]
          # @param system_name [String]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::PreEncounter::Patients::Types::ExternalProvenance]
          def initialize(external_id:, system_name:, additional_properties: nil)
            @external_id = external_id
            @system_name = system_name
            @additional_properties = additional_properties
            @_field_set = { "externalId": external_id, "systemName": system_name }
          end

          # Deserialize a JSON object to an instance of ExternalProvenance
          #
          # @param json_object [String]
          # @return [CandidApiClient::PreEncounter::Patients::Types::ExternalProvenance]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            external_id = struct["externalId"]
            system_name = struct["systemName"]
            new(
              external_id: external_id,
              system_name: system_name,
              additional_properties: struct
            )
          end

          # Serialize an instance of ExternalProvenance to a JSON object
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
            obj.external_id.is_a?(String) != false || raise("Passed value for field obj.external_id is not the expected type, validation failed.")
            obj.system_name.is_a?(String) != false || raise("Passed value for field obj.system_name is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
