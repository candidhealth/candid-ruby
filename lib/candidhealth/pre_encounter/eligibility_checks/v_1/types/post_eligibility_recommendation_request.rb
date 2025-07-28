# frozen_string_literal: true

require_relative "eligibility_recommendation_patient_info"
require_relative "eligibility_recommendation_payload"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          class PostEligibilityRecommendationRequest
            # @return [String]
            attr_reader :eligibility_check_id
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityRecommendationPatientInfo]
            attr_reader :patient
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityRecommendationPayload]
            attr_reader :recommendation
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param eligibility_check_id [String]
            # @param patient [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityRecommendationPatientInfo]
            # @param recommendation [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityRecommendationPayload]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::PostEligibilityRecommendationRequest]
            def initialize(eligibility_check_id:, patient:, recommendation:, additional_properties: nil)
              @eligibility_check_id = eligibility_check_id
              @patient = patient
              @recommendation = recommendation
              @additional_properties = additional_properties
              @_field_set = {
                "eligibility_check_id": eligibility_check_id,
                "patient": patient,
                "recommendation": recommendation
              }
            end

            # Deserialize a JSON object to an instance of PostEligibilityRecommendationRequest
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::PostEligibilityRecommendationRequest]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              parsed_json = JSON.parse(json_object)
              eligibility_check_id = struct["eligibility_check_id"]
              if parsed_json["patient"].nil?
                patient = nil
              else
                patient = parsed_json["patient"].to_json
                patient = CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityRecommendationPatientInfo.from_json(json_object: patient)
              end
              if parsed_json["recommendation"].nil?
                recommendation = nil
              else
                recommendation = parsed_json["recommendation"].to_json
                recommendation = CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityRecommendationPayload.from_json(json_object: recommendation)
              end
              new(
                eligibility_check_id: eligibility_check_id,
                patient: patient,
                recommendation: recommendation,
                additional_properties: struct
              )
            end

            # Serialize an instance of PostEligibilityRecommendationRequest to a JSON object
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
              obj.eligibility_check_id.is_a?(String) != false || raise("Passed value for field obj.eligibility_check_id is not the expected type, validation failed.")
              CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityRecommendationPatientInfo.validate_raw(obj: obj.patient)
              CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityRecommendationPayload.validate_raw(obj: obj.recommendation)
            end
          end
        end
      end
    end
  end
end
