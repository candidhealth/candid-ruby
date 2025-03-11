# frozen_string_literal: true

require_relative "../../non_insurance_payers/v_1/types/non_insurance_payer"
require_relative "patient_clinical_trial_info"
require "ostruct"
require "json"

module CandidApiClient
  module Individual
    module Types
      class PatientNonInsurancePayerInfo
        # @return [CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayer]
        attr_reader :non_insurance_payer
        # @return [String]
        attr_reader :member_id
        # @return [Array<CandidApiClient::Individual::Types::PatientClinicalTrialInfo>] A patient cannot be associated with a given trial more than once
        attr_reader :clinical_trial_info
        # @return [OpenStruct] Additional properties unmapped to the current class definition
        attr_reader :additional_properties
        # @return [Object]
        attr_reader :_field_set
        protected :_field_set

        OMIT = Object.new

        # @param non_insurance_payer [CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayer]
        # @param member_id [String]
        # @param clinical_trial_info [Array<CandidApiClient::Individual::Types::PatientClinicalTrialInfo>] A patient cannot be associated with a given trial more than once
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [CandidApiClient::Individual::Types::PatientNonInsurancePayerInfo]
        def initialize(non_insurance_payer:, clinical_trial_info:, member_id: OMIT, additional_properties: nil)
          @non_insurance_payer = non_insurance_payer
          @member_id = member_id if member_id != OMIT
          @clinical_trial_info = clinical_trial_info
          @additional_properties = additional_properties
          @_field_set = {
            "non_insurance_payer": non_insurance_payer,
            "member_id": member_id,
            "clinical_trial_info": clinical_trial_info
          }.reject do |_k, v|
            v == OMIT
          end
        end

        # Deserialize a JSON object to an instance of PatientNonInsurancePayerInfo
        #
        # @param json_object [String]
        # @return [CandidApiClient::Individual::Types::PatientNonInsurancePayerInfo]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          if parsed_json["non_insurance_payer"].nil?
            non_insurance_payer = nil
          else
            non_insurance_payer = parsed_json["non_insurance_payer"].to_json
            non_insurance_payer = CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayer.from_json(json_object: non_insurance_payer)
          end
          member_id = struct["member_id"]
          clinical_trial_info = parsed_json["clinical_trial_info"]&.map do |item|
            item = item.to_json
            CandidApiClient::Individual::Types::PatientClinicalTrialInfo.from_json(json_object: item)
          end
          new(
            non_insurance_payer: non_insurance_payer,
            member_id: member_id,
            clinical_trial_info: clinical_trial_info,
            additional_properties: struct
          )
        end

        # Serialize an instance of PatientNonInsurancePayerInfo to a JSON object
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
          CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayer.validate_raw(obj: obj.non_insurance_payer)
          obj.member_id&.is_a?(String) != false || raise("Passed value for field obj.member_id is not the expected type, validation failed.")
          obj.clinical_trial_info.is_a?(Array) != false || raise("Passed value for field obj.clinical_trial_info is not the expected type, validation failed.")
        end
      end
    end
  end
end
