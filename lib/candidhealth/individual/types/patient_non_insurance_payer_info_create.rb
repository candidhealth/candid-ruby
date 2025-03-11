# frozen_string_literal: true

require_relative "patient_clinical_trial_info_create"
require "ostruct"
require "json"

module CandidApiClient
  module Individual
    module Types
      class PatientNonInsurancePayerInfoCreate
        # @return [String]
        attr_reader :non_insurance_payer_id
        # @return [String]
        attr_reader :member_id
        # @return [Array<CandidApiClient::Individual::Types::PatientClinicalTrialInfoCreate>]
        attr_reader :clinical_trial_info
        # @return [OpenStruct] Additional properties unmapped to the current class definition
        attr_reader :additional_properties
        # @return [Object]
        attr_reader :_field_set
        protected :_field_set

        OMIT = Object.new

        # @param non_insurance_payer_id [String]
        # @param member_id [String]
        # @param clinical_trial_info [Array<CandidApiClient::Individual::Types::PatientClinicalTrialInfoCreate>]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [CandidApiClient::Individual::Types::PatientNonInsurancePayerInfoCreate]
        def initialize(non_insurance_payer_id:, member_id: OMIT, clinical_trial_info: OMIT, additional_properties: nil)
          @non_insurance_payer_id = non_insurance_payer_id
          @member_id = member_id if member_id != OMIT
          @clinical_trial_info = clinical_trial_info if clinical_trial_info != OMIT
          @additional_properties = additional_properties
          @_field_set = {
            "non_insurance_payer_id": non_insurance_payer_id,
            "member_id": member_id,
            "clinical_trial_info": clinical_trial_info
          }.reject do |_k, v|
            v == OMIT
          end
        end

        # Deserialize a JSON object to an instance of PatientNonInsurancePayerInfoCreate
        #
        # @param json_object [String]
        # @return [CandidApiClient::Individual::Types::PatientNonInsurancePayerInfoCreate]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          non_insurance_payer_id = struct["non_insurance_payer_id"]
          member_id = struct["member_id"]
          clinical_trial_info = parsed_json["clinical_trial_info"]&.map do |item|
            item = item.to_json
            CandidApiClient::Individual::Types::PatientClinicalTrialInfoCreate.from_json(json_object: item)
          end
          new(
            non_insurance_payer_id: non_insurance_payer_id,
            member_id: member_id,
            clinical_trial_info: clinical_trial_info,
            additional_properties: struct
          )
        end

        # Serialize an instance of PatientNonInsurancePayerInfoCreate to a JSON object
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
          obj.non_insurance_payer_id.is_a?(String) != false || raise("Passed value for field obj.non_insurance_payer_id is not the expected type, validation failed.")
          obj.member_id&.is_a?(String) != false || raise("Passed value for field obj.member_id is not the expected type, validation failed.")
          obj.clinical_trial_info&.is_a?(Array) != false || raise("Passed value for field obj.clinical_trial_info is not the expected type, validation failed.")
        end
      end
    end
  end
end
