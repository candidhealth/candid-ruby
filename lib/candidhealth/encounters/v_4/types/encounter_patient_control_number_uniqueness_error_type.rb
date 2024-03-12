# frozen_string_literal: true

require "json"

module CandidApiClient
  module Encounters
    module V4
      class EncounterPatientControlNumberUniquenessErrorType
        attr_reader :patient_control_number, :additional_properties

        # @param patient_control_number [String]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Encounters::V4::EncounterPatientControlNumberUniquenessErrorType]
        def initialize(patient_control_number:, additional_properties: nil)
          # @type [String]
          @patient_control_number = patient_control_number
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of EncounterPatientControlNumberUniquenessErrorType
        #
        # @param json_object [JSON]
        # @return [Encounters::V4::EncounterPatientControlNumberUniquenessErrorType]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          JSON.parse(json_object)
          patient_control_number = struct.patient_control_number
          new(patient_control_number: patient_control_number, additional_properties: struct)
        end

        # Serialize an instance of EncounterPatientControlNumberUniquenessErrorType to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "patient_control_number": @patient_control_number }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
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
