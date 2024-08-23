# frozen_string_literal: true

require_relative "plan_coverage_details"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Coverages
      module V1
        module Types
          class PlanCoverage
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::PlanCoverageDetails]
            attr_reader :in_network
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::PlanCoverageDetails]
            attr_reader :out_of_network
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param in_network [CandidApiClient::PreEncounter::Coverages::V1::Types::PlanCoverageDetails]
            # @param out_of_network [CandidApiClient::PreEncounter::Coverages::V1::Types::PlanCoverageDetails]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::PlanCoverage]
            def initialize(in_network: OMIT, out_of_network: OMIT, additional_properties: nil)
              @in_network = in_network if in_network != OMIT
              @out_of_network = out_of_network if out_of_network != OMIT
              @additional_properties = additional_properties
              @_field_set = { "in_network": in_network, "out_of_network": out_of_network }.reject do |_k, v|
                v == OMIT
              end
            end

            # Deserialize a JSON object to an instance of PlanCoverage
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::PlanCoverage]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              parsed_json = JSON.parse(json_object)
              if parsed_json["in_network"].nil?
                in_network = nil
              else
                in_network = parsed_json["in_network"].to_json
                in_network = CandidApiClient::PreEncounter::Coverages::V1::Types::PlanCoverageDetails.from_json(json_object: in_network)
              end
              if parsed_json["out_of_network"].nil?
                out_of_network = nil
              else
                out_of_network = parsed_json["out_of_network"].to_json
                out_of_network = CandidApiClient::PreEncounter::Coverages::V1::Types::PlanCoverageDetails.from_json(json_object: out_of_network)
              end
              new(
                in_network: in_network,
                out_of_network: out_of_network,
                additional_properties: struct
              )
            end

            # Serialize an instance of PlanCoverage to a JSON object
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
              obj.in_network.nil? || CandidApiClient::PreEncounter::Coverages::V1::Types::PlanCoverageDetails.validate_raw(obj: obj.in_network)
              obj.out_of_network.nil? || CandidApiClient::PreEncounter::Coverages::V1::Types::PlanCoverageDetails.validate_raw(obj: obj.out_of_network)
            end
          end
        end
      end
    end
  end
end
