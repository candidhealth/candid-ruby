# frozen_string_literal: true

require_relative "service_type_code"
require_relative "service_coverage_details"
require_relative "coverage_details"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Coverages
      module V1
        module Types
          class ServiceCoverage
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::ServiceTypeCode]
            attr_reader :service_code
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::ServiceCoverageDetails]
            attr_reader :in_network
            # @return [Array<CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageDetails>]
            attr_reader :in_network_flat
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::ServiceCoverageDetails]
            attr_reader :out_of_network
            # @return [Array<CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageDetails>]
            attr_reader :out_of_network_flat
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param service_code [CandidApiClient::PreEncounter::Coverages::V1::Types::ServiceTypeCode]
            # @param in_network [CandidApiClient::PreEncounter::Coverages::V1::Types::ServiceCoverageDetails]
            # @param in_network_flat [Array<CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageDetails>]
            # @param out_of_network [CandidApiClient::PreEncounter::Coverages::V1::Types::ServiceCoverageDetails]
            # @param out_of_network_flat [Array<CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageDetails>]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::ServiceCoverage]
            def initialize(service_code:, in_network: OMIT, in_network_flat: OMIT, out_of_network: OMIT,
                           out_of_network_flat: OMIT, additional_properties: nil)
              @service_code = service_code
              @in_network = in_network if in_network != OMIT
              @in_network_flat = in_network_flat if in_network_flat != OMIT
              @out_of_network = out_of_network if out_of_network != OMIT
              @out_of_network_flat = out_of_network_flat if out_of_network_flat != OMIT
              @additional_properties = additional_properties
              @_field_set = {
                "service_code": service_code,
                "in_network": in_network,
                "in_network_flat": in_network_flat,
                "out_of_network": out_of_network,
                "out_of_network_flat": out_of_network_flat
              }.reject do |_k, v|
                v == OMIT
              end
            end

            # Deserialize a JSON object to an instance of ServiceCoverage
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::ServiceCoverage]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              parsed_json = JSON.parse(json_object)
              service_code = struct["service_code"]
              if parsed_json["in_network"].nil?
                in_network = nil
              else
                in_network = parsed_json["in_network"].to_json
                in_network = CandidApiClient::PreEncounter::Coverages::V1::Types::ServiceCoverageDetails.from_json(json_object: in_network)
              end
              in_network_flat = parsed_json["in_network_flat"]&.map do |item|
                item = item.to_json
                CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageDetails.from_json(json_object: item)
              end
              if parsed_json["out_of_network"].nil?
                out_of_network = nil
              else
                out_of_network = parsed_json["out_of_network"].to_json
                out_of_network = CandidApiClient::PreEncounter::Coverages::V1::Types::ServiceCoverageDetails.from_json(json_object: out_of_network)
              end
              out_of_network_flat = parsed_json["out_of_network_flat"]&.map do |item|
                item = item.to_json
                CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageDetails.from_json(json_object: item)
              end
              new(
                service_code: service_code,
                in_network: in_network,
                in_network_flat: in_network_flat,
                out_of_network: out_of_network,
                out_of_network_flat: out_of_network_flat,
                additional_properties: struct
              )
            end

            # Serialize an instance of ServiceCoverage to a JSON object
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
              obj.service_code.is_a?(CandidApiClient::PreEncounter::Coverages::V1::Types::ServiceTypeCode) != false || raise("Passed value for field obj.service_code is not the expected type, validation failed.")
              obj.in_network.nil? || CandidApiClient::PreEncounter::Coverages::V1::Types::ServiceCoverageDetails.validate_raw(obj: obj.in_network)
              obj.in_network_flat&.is_a?(Array) != false || raise("Passed value for field obj.in_network_flat is not the expected type, validation failed.")
              obj.out_of_network.nil? || CandidApiClient::PreEncounter::Coverages::V1::Types::ServiceCoverageDetails.validate_raw(obj: obj.out_of_network)
              obj.out_of_network_flat&.is_a?(Array) != false || raise("Passed value for field obj.out_of_network_flat is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
