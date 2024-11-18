# frozen_string_literal: true

require_relative "plan_coverage"
require_relative "service_coverage"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Coverages
      module V1
        module Types
          class CoverageBenefits
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::PlanCoverage]
            attr_reader :plan_coverage
            # @return [Array<CandidApiClient::PreEncounter::Coverages::V1::Types::ServiceCoverage>]
            attr_reader :service_specific_coverage
            # @return [String]
            attr_reader :notes
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param plan_coverage [CandidApiClient::PreEncounter::Coverages::V1::Types::PlanCoverage]
            # @param service_specific_coverage [Array<CandidApiClient::PreEncounter::Coverages::V1::Types::ServiceCoverage>]
            # @param notes [String]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageBenefits]
            def initialize(plan_coverage: OMIT, service_specific_coverage: OMIT, notes: OMIT,
                           additional_properties: nil)
              @plan_coverage = plan_coverage if plan_coverage != OMIT
              @service_specific_coverage = service_specific_coverage if service_specific_coverage != OMIT
              @notes = notes if notes != OMIT
              @additional_properties = additional_properties
              @_field_set = {
                "plan_coverage": plan_coverage,
                "service_specific_coverage": service_specific_coverage,
                "notes": notes
              }.reject do |_k, v|
                v == OMIT
              end
            end

            # Deserialize a JSON object to an instance of CoverageBenefits
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageBenefits]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              parsed_json = JSON.parse(json_object)
              if parsed_json["plan_coverage"].nil?
                plan_coverage = nil
              else
                plan_coverage = parsed_json["plan_coverage"].to_json
                plan_coverage = CandidApiClient::PreEncounter::Coverages::V1::Types::PlanCoverage.from_json(json_object: plan_coverage)
              end
              service_specific_coverage = parsed_json["service_specific_coverage"]&.map do |item|
                item = item.to_json
                CandidApiClient::PreEncounter::Coverages::V1::Types::ServiceCoverage.from_json(json_object: item)
              end
              notes = struct["notes"]
              new(
                plan_coverage: plan_coverage,
                service_specific_coverage: service_specific_coverage,
                notes: notes,
                additional_properties: struct
              )
            end

            # Serialize an instance of CoverageBenefits to a JSON object
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
              obj.plan_coverage.nil? || CandidApiClient::PreEncounter::Coverages::V1::Types::PlanCoverage.validate_raw(obj: obj.plan_coverage)
              obj.service_specific_coverage&.is_a?(Array) != false || raise("Passed value for field obj.service_specific_coverage is not the expected type, validation failed.")
              obj.notes&.is_a?(String) != false || raise("Passed value for field obj.notes is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
