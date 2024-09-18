# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Patients
      module V1
        module Types
          class PotentialDuplicatePatient
            # @return [String]
            attr_reader :existing_patient_id
            # @return [String]
            attr_reader :existing_patient_mrn
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param existing_patient_id [String]
            # @param existing_patient_mrn [String]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Patients::V1::Types::PotentialDuplicatePatient]
            def initialize(existing_patient_id:, existing_patient_mrn:, additional_properties: nil)
              @existing_patient_id = existing_patient_id
              @existing_patient_mrn = existing_patient_mrn
              @additional_properties = additional_properties
              @_field_set = { "existing_patient_id": existing_patient_id, "existing_patient_mrn": existing_patient_mrn }
            end

            # Deserialize a JSON object to an instance of PotentialDuplicatePatient
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Patients::V1::Types::PotentialDuplicatePatient]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              existing_patient_id = struct["existing_patient_id"]
              existing_patient_mrn = struct["existing_patient_mrn"]
              new(
                existing_patient_id: existing_patient_id,
                existing_patient_mrn: existing_patient_mrn,
                additional_properties: struct
              )
            end

            # Serialize an instance of PotentialDuplicatePatient to a JSON object
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
              obj.existing_patient_id.is_a?(String) != false || raise("Passed value for field obj.existing_patient_id is not the expected type, validation failed.")
              obj.existing_patient_mrn.is_a?(String) != false || raise("Passed value for field obj.existing_patient_mrn is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
