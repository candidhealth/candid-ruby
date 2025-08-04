# frozen_string_literal: true

require_relative "coverage_status"
require_relative "subscriber"
require_relative "../../../common/types/relationship"
require_relative "insurance_plan"
require_relative "../../../eligibility_checks/v_1/types/eligibility_check_metadata"
require_relative "latest_eligibility_check"
require_relative "coverage_benefits"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Coverages
      module V1
        module Types
          class MutableCoverage
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageStatus] The status indiciating if the coverage is active or not.
            attr_reader :status
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::Subscriber] The party who has signed-up for or 'owns' the contractual relationship to the
            #  policy or to whom the benefit of the policy for services rendered to them or
            #  their family is due.
            attr_reader :subscriber
            # @return [CandidApiClient::PreEncounter::Common::Types::Relationship] The relationship of beneficiary (patient) to the subscriber.
            #  https://hl7.org/fhir/valueset-relationship.html
            attr_reader :relationship
            # @return [String] The canonical Candid patient UUID corresponding with the patient who benefits
            #  from the insurance coverage
            attr_reader :patient
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::InsurancePlan]
            attr_reader :insurance_plan
            # @return [Boolean] A boolean indicating if the coverage has been verified by a user.
            attr_reader :verified
            # @return [Array<CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckMetadata>] A list of eligibility check metadata that have been initiated on this coverage.
            attr_reader :eligibility_checks
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::LatestEligibilityCheck] The latest eligibility check metadata that has been initiated on this coverage.
            attr_reader :latest_eligibility_check
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageBenefits] The eligibility of the patient for the coverage, manually verified by users.
            attr_reader :benefits
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param status [CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageStatus] The status indiciating if the coverage is active or not.
            # @param subscriber [CandidApiClient::PreEncounter::Coverages::V1::Types::Subscriber] The party who has signed-up for or 'owns' the contractual relationship to the
            #  policy or to whom the benefit of the policy for services rendered to them or
            #  their family is due.
            # @param relationship [CandidApiClient::PreEncounter::Common::Types::Relationship] The relationship of beneficiary (patient) to the subscriber.
            #  https://hl7.org/fhir/valueset-relationship.html
            # @param patient [String] The canonical Candid patient UUID corresponding with the patient who benefits
            #  from the insurance coverage
            # @param insurance_plan [CandidApiClient::PreEncounter::Coverages::V1::Types::InsurancePlan]
            # @param verified [Boolean] A boolean indicating if the coverage has been verified by a user.
            # @param eligibility_checks [Array<CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckMetadata>] A list of eligibility check metadata that have been initiated on this coverage.
            # @param latest_eligibility_check [CandidApiClient::PreEncounter::Coverages::V1::Types::LatestEligibilityCheck] The latest eligibility check metadata that has been initiated on this coverage.
            # @param benefits [CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageBenefits] The eligibility of the patient for the coverage, manually verified by users.
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::MutableCoverage]
            def initialize(status:, subscriber:, relationship:, patient:, insurance_plan:, verified:,
                           eligibility_checks: OMIT, latest_eligibility_check: OMIT, benefits: OMIT, additional_properties: nil)
              @status = status
              @subscriber = subscriber
              @relationship = relationship
              @patient = patient
              @insurance_plan = insurance_plan
              @verified = verified
              @eligibility_checks = eligibility_checks if eligibility_checks != OMIT
              @latest_eligibility_check = latest_eligibility_check if latest_eligibility_check != OMIT
              @benefits = benefits if benefits != OMIT
              @additional_properties = additional_properties
              @_field_set = {
                "status": status,
                "subscriber": subscriber,
                "relationship": relationship,
                "patient": patient,
                "insurance_plan": insurance_plan,
                "verified": verified,
                "eligibility_checks": eligibility_checks,
                "latest_eligibility_check": latest_eligibility_check,
                "benefits": benefits
              }.reject do |_k, v|
                v == OMIT
              end
            end

            # Deserialize a JSON object to an instance of MutableCoverage
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::MutableCoverage]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              parsed_json = JSON.parse(json_object)
              status = struct["status"]
              if parsed_json["subscriber"].nil?
                subscriber = nil
              else
                subscriber = parsed_json["subscriber"].to_json
                subscriber = CandidApiClient::PreEncounter::Coverages::V1::Types::Subscriber.from_json(json_object: subscriber)
              end
              relationship = struct["relationship"]
              patient = struct["patient"]
              if parsed_json["insurance_plan"].nil?
                insurance_plan = nil
              else
                insurance_plan = parsed_json["insurance_plan"].to_json
                insurance_plan = CandidApiClient::PreEncounter::Coverages::V1::Types::InsurancePlan.from_json(json_object: insurance_plan)
              end
              verified = struct["verified"]
              eligibility_checks = parsed_json["eligibility_checks"]&.map do |item|
                item = item.to_json
                CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckMetadata.from_json(json_object: item)
              end
              if parsed_json["latest_eligibility_check"].nil?
                latest_eligibility_check = nil
              else
                latest_eligibility_check = parsed_json["latest_eligibility_check"].to_json
                latest_eligibility_check = CandidApiClient::PreEncounter::Coverages::V1::Types::LatestEligibilityCheck.from_json(json_object: latest_eligibility_check)
              end
              if parsed_json["benefits"].nil?
                benefits = nil
              else
                benefits = parsed_json["benefits"].to_json
                benefits = CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageBenefits.from_json(json_object: benefits)
              end
              new(
                status: status,
                subscriber: subscriber,
                relationship: relationship,
                patient: patient,
                insurance_plan: insurance_plan,
                verified: verified,
                eligibility_checks: eligibility_checks,
                latest_eligibility_check: latest_eligibility_check,
                benefits: benefits,
                additional_properties: struct
              )
            end

            # Serialize an instance of MutableCoverage to a JSON object
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
              obj.status.is_a?(CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
              CandidApiClient::PreEncounter::Coverages::V1::Types::Subscriber.validate_raw(obj: obj.subscriber)
              obj.relationship.is_a?(CandidApiClient::PreEncounter::Common::Types::Relationship) != false || raise("Passed value for field obj.relationship is not the expected type, validation failed.")
              obj.patient.is_a?(String) != false || raise("Passed value for field obj.patient is not the expected type, validation failed.")
              CandidApiClient::PreEncounter::Coverages::V1::Types::InsurancePlan.validate_raw(obj: obj.insurance_plan)
              obj.verified.is_a?(Boolean) != false || raise("Passed value for field obj.verified is not the expected type, validation failed.")
              obj.eligibility_checks&.is_a?(Array) != false || raise("Passed value for field obj.eligibility_checks is not the expected type, validation failed.")
              obj.latest_eligibility_check.nil? || CandidApiClient::PreEncounter::Coverages::V1::Types::LatestEligibilityCheck.validate_raw(obj: obj.latest_eligibility_check)
              obj.benefits.nil? || CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageBenefits.validate_raw(obj: obj.benefits)
            end
          end
        end
      end
    end
  end
end
