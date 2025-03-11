# frozen_string_literal: true

require_relative "period"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Common
      module Types
        class CanonicalClinicalTrialAssociation
          # @return [String]
          attr_reader :id
          # @return [String]
          attr_reader :clinical_trial_arm
          # @return [CandidApiClient::PreEncounter::Common::Types::Period]
          attr_reader :period
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param id [String]
          # @param clinical_trial_arm [String]
          # @param period [CandidApiClient::PreEncounter::Common::Types::Period]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::PreEncounter::Common::Types::CanonicalClinicalTrialAssociation]
          def initialize(id:, clinical_trial_arm: OMIT, period: OMIT, additional_properties: nil)
            @id = id
            @clinical_trial_arm = clinical_trial_arm if clinical_trial_arm != OMIT
            @period = period if period != OMIT
            @additional_properties = additional_properties
            @_field_set = { "id": id, "clinical_trial_arm": clinical_trial_arm, "period": period }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of CanonicalClinicalTrialAssociation
          #
          # @param json_object [String]
          # @return [CandidApiClient::PreEncounter::Common::Types::CanonicalClinicalTrialAssociation]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            id = struct["id"]
            clinical_trial_arm = struct["clinical_trial_arm"]
            if parsed_json["period"].nil?
              period = nil
            else
              period = parsed_json["period"].to_json
              period = CandidApiClient::PreEncounter::Common::Types::Period.from_json(json_object: period)
            end
            new(
              id: id,
              clinical_trial_arm: clinical_trial_arm,
              period: period,
              additional_properties: struct
            )
          end

          # Serialize an instance of CanonicalClinicalTrialAssociation to a JSON object
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
            obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
            obj.clinical_trial_arm&.is_a?(String) != false || raise("Passed value for field obj.clinical_trial_arm is not the expected type, validation failed.")
            obj.period.nil? || CandidApiClient::PreEncounter::Common::Types::Period.validate_raw(obj: obj.period)
          end
        end
      end
    end
  end
end
