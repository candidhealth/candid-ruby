# frozen_string_literal: true

require_relative "../../../coverages/v_1/types/eligibility_status"
require_relative "../../../coverages/v_1/types/plan_metadata"
require_relative "../../../coverages/v_1/types/coverage_benefits"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          class ParsedResponse
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::EligibilityStatus]
            attr_reader :eligibility_status
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::PlanMetadata]
            attr_reader :plan_metadata
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageBenefits]
            attr_reader :benefits
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param eligibility_status [CandidApiClient::PreEncounter::Coverages::V1::Types::EligibilityStatus]
            # @param plan_metadata [CandidApiClient::PreEncounter::Coverages::V1::Types::PlanMetadata]
            # @param benefits [CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageBenefits]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::ParsedResponse]
            def initialize(eligibility_status:, plan_metadata: OMIT, benefits: OMIT, additional_properties: nil)
              @eligibility_status = eligibility_status
              @plan_metadata = plan_metadata if plan_metadata != OMIT
              @benefits = benefits if benefits != OMIT
              @additional_properties = additional_properties
              @_field_set = {
                "eligibility_status": eligibility_status,
                "plan_metadata": plan_metadata,
                "benefits": benefits
              }.reject do |_k, v|
                v == OMIT
              end
            end

            # Deserialize a JSON object to an instance of ParsedResponse
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::EligibilityChecks::V1::Types::ParsedResponse]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              parsed_json = JSON.parse(json_object)
              eligibility_status = struct["eligibility_status"]
              if parsed_json["plan_metadata"].nil?
                plan_metadata = nil
              else
                plan_metadata = parsed_json["plan_metadata"].to_json
                plan_metadata = CandidApiClient::PreEncounter::Coverages::V1::Types::PlanMetadata.from_json(json_object: plan_metadata)
              end
              if parsed_json["benefits"].nil?
                benefits = nil
              else
                benefits = parsed_json["benefits"].to_json
                benefits = CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageBenefits.from_json(json_object: benefits)
              end
              new(
                eligibility_status: eligibility_status,
                plan_metadata: plan_metadata,
                benefits: benefits,
                additional_properties: struct
              )
            end

            # Serialize an instance of ParsedResponse to a JSON object
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
              obj.eligibility_status.is_a?(CandidApiClient::PreEncounter::Coverages::V1::Types::EligibilityStatus) != false || raise("Passed value for field obj.eligibility_status is not the expected type, validation failed.")
              obj.plan_metadata.nil? || CandidApiClient::PreEncounter::Coverages::V1::Types::PlanMetadata.validate_raw(obj: obj.plan_metadata)
              obj.benefits.nil? || CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageBenefits.validate_raw(obj: obj.benefits)
            end
          end
        end
      end
    end
  end
end
