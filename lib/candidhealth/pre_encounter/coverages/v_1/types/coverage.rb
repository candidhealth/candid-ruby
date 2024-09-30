# frozen_string_literal: true

require "date"
require_relative "coverage_status"
require_relative "subscriber"
require_relative "../../../common/types/relationship"
require_relative "insurance_plan"
require_relative "eligibility_check_metadata"
require_relative "latest_eligibility_check"
require_relative "coverage_benefits"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Coverages
      module V1
        module Types
          # A coverage object with immutable server-owned properties.
          class Coverage
            # @return [String]
            attr_reader :id
            # @return [String] The organization that owns this coverage.
            attr_reader :organization_id
            # @return [Boolean] True if the coverage is deactivated. Deactivated coverages are not returned in
            #  search results but are returned in all other endpoints including scan.
            attr_reader :deactivated
            # @return [Integer] The version of the coverage. Any update to any property of a coverage object
            #  will create a new version.
            attr_reader :version
            # @return [DateTime]
            attr_reader :updated_at
            # @return [String] The user ID of the user who last updated the coverage.
            attr_reader :updating_user_id
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageStatus] The status indiciating if the coverage is active or not.
            attr_reader :status
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::Subscriber] The party who has signed-up for or 'owns' the contractual relationship to the
            #  policy or to whom the benefit of the policy for services rendered to them or
            #  their family is due.
            attr_reader :subscriber
            # @return [CandidApiClient::PreEncounter::Common::Types::Relationship] The relationship of beneficiary (patient) to the subscriber.
            #  https://hl7.org/fhir/valueset-relationship.html
            attr_reader :relationship
            # @return [String] The patient who benefits from the insurance coverage
            attr_reader :patient
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::InsurancePlan]
            attr_reader :insurance_plan
            # @return [Boolean] A boolean indicating if the coverage has been verified by a user.
            attr_reader :verified
            # @return [Array<CandidApiClient::PreEncounter::Coverages::V1::Types::EligibilityCheckMetadata>] A list of eligibility check metadata that have been initiated on this coverage.
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

            # @param id [String]
            # @param organization_id [String] The organization that owns this coverage.
            # @param deactivated [Boolean] True if the coverage is deactivated. Deactivated coverages are not returned in
            #  search results but are returned in all other endpoints including scan.
            # @param version [Integer] The version of the coverage. Any update to any property of a coverage object
            #  will create a new version.
            # @param updated_at [DateTime]
            # @param updating_user_id [String] The user ID of the user who last updated the coverage.
            # @param status [CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageStatus] The status indiciating if the coverage is active or not.
            # @param subscriber [CandidApiClient::PreEncounter::Coverages::V1::Types::Subscriber] The party who has signed-up for or 'owns' the contractual relationship to the
            #  policy or to whom the benefit of the policy for services rendered to them or
            #  their family is due.
            # @param relationship [CandidApiClient::PreEncounter::Common::Types::Relationship] The relationship of beneficiary (patient) to the subscriber.
            #  https://hl7.org/fhir/valueset-relationship.html
            # @param patient [String] The patient who benefits from the insurance coverage
            # @param insurance_plan [CandidApiClient::PreEncounter::Coverages::V1::Types::InsurancePlan]
            # @param verified [Boolean] A boolean indicating if the coverage has been verified by a user.
            # @param eligibility_checks [Array<CandidApiClient::PreEncounter::Coverages::V1::Types::EligibilityCheckMetadata>] A list of eligibility check metadata that have been initiated on this coverage.
            # @param latest_eligibility_check [CandidApiClient::PreEncounter::Coverages::V1::Types::LatestEligibilityCheck] The latest eligibility check metadata that has been initiated on this coverage.
            # @param benefits [CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageBenefits] The eligibility of the patient for the coverage, manually verified by users.
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage]
            def initialize(id:, organization_id:, deactivated:, version:, updated_at:, updating_user_id:, status:,
                           subscriber:, relationship:, patient:, insurance_plan:, verified:, eligibility_checks: OMIT, latest_eligibility_check: OMIT, benefits: OMIT, additional_properties: nil)
              @id = id
              @organization_id = organization_id
              @deactivated = deactivated
              @version = version
              @updated_at = updated_at
              @updating_user_id = updating_user_id
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
                "id": id,
                "organization_id": organization_id,
                "deactivated": deactivated,
                "version": version,
                "updated_at": updated_at,
                "updating_user_id": updating_user_id,
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

            # Deserialize a JSON object to an instance of Coverage
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::Coverage]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              parsed_json = JSON.parse(json_object)
              id = struct["id"]
              organization_id = struct["organization_id"]
              deactivated = struct["deactivated"]
              version = struct["version"]
              updated_at = (DateTime.parse(parsed_json["updated_at"]) unless parsed_json["updated_at"].nil?)
              updating_user_id = struct["updating_user_id"]
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
                CandidApiClient::PreEncounter::Coverages::V1::Types::EligibilityCheckMetadata.from_json(json_object: item)
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
                id: id,
                organization_id: organization_id,
                deactivated: deactivated,
                version: version,
                updated_at: updated_at,
                updating_user_id: updating_user_id,
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

            # Serialize an instance of Coverage to a JSON object
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
              obj.organization_id.is_a?(String) != false || raise("Passed value for field obj.organization_id is not the expected type, validation failed.")
              obj.deactivated.is_a?(Boolean) != false || raise("Passed value for field obj.deactivated is not the expected type, validation failed.")
              obj.version.is_a?(Integer) != false || raise("Passed value for field obj.version is not the expected type, validation failed.")
              obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
              obj.updating_user_id.is_a?(String) != false || raise("Passed value for field obj.updating_user_id is not the expected type, validation failed.")
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
