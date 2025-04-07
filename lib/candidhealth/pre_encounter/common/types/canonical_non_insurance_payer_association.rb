# frozen_string_literal: true

require_relative "period"
require_relative "canonical_clinical_trial_association"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Common
      module Types
        class CanonicalNonInsurancePayerAssociation
          # @return [String]
          attr_reader :id
          # @return [String]
          attr_reader :member_id
          # @return [CandidApiClient::PreEncounter::Common::Types::Period]
          attr_reader :period
          # @return [Array<CandidApiClient::PreEncounter::Common::Types::CanonicalClinicalTrialAssociation>] A patient cannot be associated with a given trial more than once
          attr_reader :clinical_trial_info
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param id [String]
          # @param member_id [String]
          # @param period [CandidApiClient::PreEncounter::Common::Types::Period]
          # @param clinical_trial_info [Array<CandidApiClient::PreEncounter::Common::Types::CanonicalClinicalTrialAssociation>] A patient cannot be associated with a given trial more than once
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::PreEncounter::Common::Types::CanonicalNonInsurancePayerAssociation]
          def initialize(id:, member_id: OMIT, period: OMIT, clinical_trial_info: OMIT, additional_properties: nil)
            @id = id
            @member_id = member_id if member_id != OMIT
            @period = period if period != OMIT
            @clinical_trial_info = clinical_trial_info if clinical_trial_info != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "id": id,
              "member_id": member_id,
              "period": period,
              "clinical_trial_info": clinical_trial_info
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of
          #  CanonicalNonInsurancePayerAssociation
          #
          # @param json_object [String]
          # @return [CandidApiClient::PreEncounter::Common::Types::CanonicalNonInsurancePayerAssociation]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            id = struct["id"]
            member_id = struct["member_id"]
            if parsed_json["period"].nil?
              period = nil
            else
              period = parsed_json["period"].to_json
              period = CandidApiClient::PreEncounter::Common::Types::Period.from_json(json_object: period)
            end
            clinical_trial_info = parsed_json["clinical_trial_info"]&.map do |item|
              item = item.to_json
              CandidApiClient::PreEncounter::Common::Types::CanonicalClinicalTrialAssociation.from_json(json_object: item)
            end
            new(
              id: id,
              member_id: member_id,
              period: period,
              clinical_trial_info: clinical_trial_info,
              additional_properties: struct
            )
          end

          # Serialize an instance of CanonicalNonInsurancePayerAssociation to a JSON object
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
            obj.member_id&.is_a?(String) != false || raise("Passed value for field obj.member_id is not the expected type, validation failed.")
            obj.period.nil? || CandidApiClient::PreEncounter::Common::Types::Period.validate_raw(obj: obj.period)
            obj.clinical_trial_info&.is_a?(Array) != false || raise("Passed value for field obj.clinical_trial_info is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
