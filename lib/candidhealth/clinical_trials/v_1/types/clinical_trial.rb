# frozen_string_literal: true

require_relative "clinical_trial_phase"
require "ostruct"
require "json"

module CandidApiClient
  module ClinicalTrials
    module V1
      module Types
        class ClinicalTrial
          # @return [String]
          attr_reader :clinical_trial_id
          # @return [String]
          attr_reader :non_insurance_payer_id
          # @return [Boolean]
          attr_reader :is_active
          # @return [String]
          attr_reader :name
          # @return [String] Must be 8 characters long
          attr_reader :clinical_trial_number
          # @return [CandidApiClient::ClinicalTrials::V1::Types::ClinicalTrialPhase]
          attr_reader :clinical_trial_phase
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param clinical_trial_id [String]
          # @param non_insurance_payer_id [String]
          # @param is_active [Boolean]
          # @param name [String]
          # @param clinical_trial_number [String] Must be 8 characters long
          # @param clinical_trial_phase [CandidApiClient::ClinicalTrials::V1::Types::ClinicalTrialPhase]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::ClinicalTrials::V1::Types::ClinicalTrial]
          def initialize(clinical_trial_id:, non_insurance_payer_id:, is_active:, name:, clinical_trial_number:,
                         clinical_trial_phase: OMIT, additional_properties: nil)
            @clinical_trial_id = clinical_trial_id
            @non_insurance_payer_id = non_insurance_payer_id
            @is_active = is_active
            @name = name
            @clinical_trial_number = clinical_trial_number
            @clinical_trial_phase = clinical_trial_phase if clinical_trial_phase != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "clinical_trial_id": clinical_trial_id,
              "non_insurance_payer_id": non_insurance_payer_id,
              "is_active": is_active,
              "name": name,
              "clinical_trial_number": clinical_trial_number,
              "clinical_trial_phase": clinical_trial_phase
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of ClinicalTrial
          #
          # @param json_object [String]
          # @return [CandidApiClient::ClinicalTrials::V1::Types::ClinicalTrial]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            clinical_trial_id = struct["clinical_trial_id"]
            non_insurance_payer_id = struct["non_insurance_payer_id"]
            is_active = struct["is_active"]
            name = struct["name"]
            clinical_trial_number = struct["clinical_trial_number"]
            clinical_trial_phase = struct["clinical_trial_phase"]
            new(
              clinical_trial_id: clinical_trial_id,
              non_insurance_payer_id: non_insurance_payer_id,
              is_active: is_active,
              name: name,
              clinical_trial_number: clinical_trial_number,
              clinical_trial_phase: clinical_trial_phase,
              additional_properties: struct
            )
          end

          # Serialize an instance of ClinicalTrial to a JSON object
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
            obj.clinical_trial_id.is_a?(String) != false || raise("Passed value for field obj.clinical_trial_id is not the expected type, validation failed.")
            obj.non_insurance_payer_id.is_a?(String) != false || raise("Passed value for field obj.non_insurance_payer_id is not the expected type, validation failed.")
            obj.is_active.is_a?(Boolean) != false || raise("Passed value for field obj.is_active is not the expected type, validation failed.")
            obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
            obj.clinical_trial_number.is_a?(String) != false || raise("Passed value for field obj.clinical_trial_number is not the expected type, validation failed.")
            obj.clinical_trial_phase&.is_a?(CandidApiClient::ClinicalTrials::V1::Types::ClinicalTrialPhase) != false || raise("Passed value for field obj.clinical_trial_phase is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
