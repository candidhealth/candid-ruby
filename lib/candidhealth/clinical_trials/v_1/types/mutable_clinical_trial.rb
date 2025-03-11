# frozen_string_literal: true

require_relative "clinical_trial_phase"
require "ostruct"
require "json"

module CandidApiClient
  module ClinicalTrials
    module V1
      module Types
        class MutableClinicalTrial
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

          # @param name [String]
          # @param clinical_trial_number [String] Must be 8 characters long
          # @param clinical_trial_phase [CandidApiClient::ClinicalTrials::V1::Types::ClinicalTrialPhase]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::ClinicalTrials::V1::Types::MutableClinicalTrial]
          def initialize(name:, clinical_trial_number:, clinical_trial_phase: OMIT, additional_properties: nil)
            @name = name
            @clinical_trial_number = clinical_trial_number
            @clinical_trial_phase = clinical_trial_phase if clinical_trial_phase != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "name": name,
              "clinical_trial_number": clinical_trial_number,
              "clinical_trial_phase": clinical_trial_phase
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of MutableClinicalTrial
          #
          # @param json_object [String]
          # @return [CandidApiClient::ClinicalTrials::V1::Types::MutableClinicalTrial]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            name = struct["name"]
            clinical_trial_number = struct["clinical_trial_number"]
            clinical_trial_phase = struct["clinical_trial_phase"]
            new(
              name: name,
              clinical_trial_number: clinical_trial_number,
              clinical_trial_phase: clinical_trial_phase,
              additional_properties: struct
            )
          end

          # Serialize an instance of MutableClinicalTrial to a JSON object
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
            obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
            obj.clinical_trial_number.is_a?(String) != false || raise("Passed value for field obj.clinical_trial_number is not the expected type, validation failed.")
            obj.clinical_trial_phase&.is_a?(CandidApiClient::ClinicalTrials::V1::Types::ClinicalTrialPhase) != false || raise("Passed value for field obj.clinical_trial_phase is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
