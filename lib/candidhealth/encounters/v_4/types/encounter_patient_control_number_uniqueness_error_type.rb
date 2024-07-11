# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module Encounters
    module V4
      module Types
        class EncounterPatientControlNumberUniquenessErrorType
          # @return [String]
          attr_reader :patient_control_number
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param patient_control_number [String]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Encounters::V4::Types::EncounterPatientControlNumberUniquenessErrorType]
          def initialize(patient_control_number:, additional_properties: nil)
            @patient_control_number = patient_control_number
            @additional_properties = additional_properties
            @_field_set = { "patient_control_number": patient_control_number }
          end

          # Deserialize a JSON object to an instance of
          #  EncounterPatientControlNumberUniquenessErrorType
          #
          # @param json_object [String]
          # @return [CandidApiClient::Encounters::V4::Types::EncounterPatientControlNumberUniquenessErrorType]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            patient_control_number = struct["patient_control_number"]
            new(patient_control_number: patient_control_number, additional_properties: struct)
          end

          # Serialize an instance of EncounterPatientControlNumberUniquenessErrorType to a
          #  JSON object
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
            obj.patient_control_number.is_a?(String) != false || raise("Passed value for field obj.patient_control_number is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
