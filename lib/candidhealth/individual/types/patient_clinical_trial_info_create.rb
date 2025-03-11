# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module Individual
    module Types
      class PatientClinicalTrialInfoCreate
        # @return [String]
        attr_reader :clinical_trial_arm
        # @return [String]
        attr_reader :clinical_trial_id
        # @return [OpenStruct] Additional properties unmapped to the current class definition
        attr_reader :additional_properties
        # @return [Object]
        attr_reader :_field_set
        protected :_field_set

        OMIT = Object.new

        # @param clinical_trial_arm [String]
        # @param clinical_trial_id [String]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [CandidApiClient::Individual::Types::PatientClinicalTrialInfoCreate]
        def initialize(clinical_trial_id:, clinical_trial_arm: OMIT, additional_properties: nil)
          @clinical_trial_arm = clinical_trial_arm if clinical_trial_arm != OMIT
          @clinical_trial_id = clinical_trial_id
          @additional_properties = additional_properties
          @_field_set = {
            "clinical_trial_arm": clinical_trial_arm,
            "clinical_trial_id": clinical_trial_id
          }.reject do |_k, v|
            v == OMIT
          end
        end

        # Deserialize a JSON object to an instance of PatientClinicalTrialInfoCreate
        #
        # @param json_object [String]
        # @return [CandidApiClient::Individual::Types::PatientClinicalTrialInfoCreate]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          clinical_trial_arm = struct["clinical_trial_arm"]
          clinical_trial_id = struct["clinical_trial_id"]
          new(
            clinical_trial_arm: clinical_trial_arm,
            clinical_trial_id: clinical_trial_id,
            additional_properties: struct
          )
        end

        # Serialize an instance of PatientClinicalTrialInfoCreate to a JSON object
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
          obj.clinical_trial_id.is_a?(String) != false || raise("Passed value for field obj.clinical_trial_id is not the expected type, validation failed.")
        end
      end
    end
  end
end
