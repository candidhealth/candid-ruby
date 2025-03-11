# frozen_string_literal: true

require_relative "../../clinical_trials/v_1/types/clinical_trial"
require "ostruct"
require "json"

module CandidApiClient
  module Individual
    module Types
      class PatientClinicalTrialInfo
        # @return [String]
        attr_reader :clinical_trial_arm
        # @return [CandidApiClient::ClinicalTrials::V1::Types::ClinicalTrial]
        attr_reader :clinical_trial
        # @return [OpenStruct] Additional properties unmapped to the current class definition
        attr_reader :additional_properties
        # @return [Object]
        attr_reader :_field_set
        protected :_field_set

        OMIT = Object.new

        # @param clinical_trial_arm [String]
        # @param clinical_trial [CandidApiClient::ClinicalTrials::V1::Types::ClinicalTrial]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [CandidApiClient::Individual::Types::PatientClinicalTrialInfo]
        def initialize(clinical_trial:, clinical_trial_arm: OMIT, additional_properties: nil)
          @clinical_trial_arm = clinical_trial_arm if clinical_trial_arm != OMIT
          @clinical_trial = clinical_trial
          @additional_properties = additional_properties
          @_field_set = {
            "clinical_trial_arm": clinical_trial_arm,
            "clinical_trial": clinical_trial
          }.reject do |_k, v|
            v == OMIT
          end
        end

        # Deserialize a JSON object to an instance of PatientClinicalTrialInfo
        #
        # @param json_object [String]
        # @return [CandidApiClient::Individual::Types::PatientClinicalTrialInfo]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          clinical_trial_arm = struct["clinical_trial_arm"]
          if parsed_json["clinical_trial"].nil?
            clinical_trial = nil
          else
            clinical_trial = parsed_json["clinical_trial"].to_json
            clinical_trial = CandidApiClient::ClinicalTrials::V1::Types::ClinicalTrial.from_json(json_object: clinical_trial)
          end
          new(
            clinical_trial_arm: clinical_trial_arm,
            clinical_trial: clinical_trial,
            additional_properties: struct
          )
        end

        # Serialize an instance of PatientClinicalTrialInfo to a JSON object
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
          obj.clinical_trial_arm&.is_a?(String) != false || raise("Passed value for field obj.clinical_trial_arm is not the expected type, validation failed.")
          CandidApiClient::ClinicalTrials::V1::Types::ClinicalTrial.validate_raw(obj: obj.clinical_trial)
        end
      end
    end
  end
end
