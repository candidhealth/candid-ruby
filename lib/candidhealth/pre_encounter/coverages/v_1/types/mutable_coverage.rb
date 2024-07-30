# frozen_string_literal: true

require_relative "coverage_status"
require_relative "subscriber"
require_relative "../../../common/types/relationship"
require_relative "insurance_plan"
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
            # @return [String] The patient who benefits from the insurance coverage
            attr_reader :patient
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::InsurancePlan]
            attr_reader :insurance_plan
            # @return [Boolean] A boolean indicating if the coverage has been verified by a user.
            attr_reader :verified
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
            # @param patient [String] The patient who benefits from the insurance coverage
            # @param insurance_plan [CandidApiClient::PreEncounter::Coverages::V1::Types::InsurancePlan]
            # @param verified [Boolean] A boolean indicating if the coverage has been verified by a user.
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::MutableCoverage]
            def initialize(status:, subscriber:, relationship:, patient:, insurance_plan:, verified:,
                           additional_properties: nil)
              @status = status
              @subscriber = subscriber
              @relationship = relationship
              @patient = patient
              @insurance_plan = insurance_plan
              @verified = verified
              @additional_properties = additional_properties
              @_field_set = {
                "status": status,
                "subscriber": subscriber,
                "relationship": relationship,
                "patient": patient,
                "insurance_plan": insurance_plan,
                "verified": verified
              }
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
              new(
                status: status,
                subscriber: subscriber,
                relationship: relationship,
                patient: patient,
                insurance_plan: insurance_plan,
                verified: verified,
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
            end
          end
        end
      end
    end
  end
end
