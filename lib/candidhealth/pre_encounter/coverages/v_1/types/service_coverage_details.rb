# frozen_string_literal: true

require_relative "coverage_value"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Coverages
      module V1
        module Types
          class ServiceCoverageDetails
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageValue]
            attr_reader :copay
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageValue]
            attr_reader :coinsurance
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageValue]
            attr_reader :visits
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageValue]
            attr_reader :visits_remaining
            # @return [String]
            attr_reader :additional_notes
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param copay [CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageValue]
            # @param coinsurance [CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageValue]
            # @param visits [CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageValue]
            # @param visits_remaining [CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageValue]
            # @param additional_notes [String]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::ServiceCoverageDetails]
            def initialize(copay: OMIT, coinsurance: OMIT, visits: OMIT, visits_remaining: OMIT,
                           additional_notes: OMIT, additional_properties: nil)
              @copay = copay if copay != OMIT
              @coinsurance = coinsurance if coinsurance != OMIT
              @visits = visits if visits != OMIT
              @visits_remaining = visits_remaining if visits_remaining != OMIT
              @additional_notes = additional_notes if additional_notes != OMIT
              @additional_properties = additional_properties
              @_field_set = {
                "copay": copay,
                "coinsurance": coinsurance,
                "visits": visits,
                "visits_remaining": visits_remaining,
                "additional_notes": additional_notes
              }.reject do |_k, v|
                v == OMIT
              end
            end

            # Deserialize a JSON object to an instance of ServiceCoverageDetails
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::ServiceCoverageDetails]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              parsed_json = JSON.parse(json_object)
              if parsed_json["copay"].nil?
                copay = nil
              else
                copay = parsed_json["copay"].to_json
                copay = CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageValue.from_json(json_object: copay)
              end
              if parsed_json["coinsurance"].nil?
                coinsurance = nil
              else
                coinsurance = parsed_json["coinsurance"].to_json
                coinsurance = CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageValue.from_json(json_object: coinsurance)
              end
              if parsed_json["visits"].nil?
                visits = nil
              else
                visits = parsed_json["visits"].to_json
                visits = CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageValue.from_json(json_object: visits)
              end
              if parsed_json["visits_remaining"].nil?
                visits_remaining = nil
              else
                visits_remaining = parsed_json["visits_remaining"].to_json
                visits_remaining = CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageValue.from_json(json_object: visits_remaining)
              end
              additional_notes = struct["additional_notes"]
              new(
                copay: copay,
                coinsurance: coinsurance,
                visits: visits,
                visits_remaining: visits_remaining,
                additional_notes: additional_notes,
                additional_properties: struct
              )
            end

            # Serialize an instance of ServiceCoverageDetails to a JSON object
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
              obj.copay.nil? || CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageValue.validate_raw(obj: obj.copay)
              obj.coinsurance.nil? || CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageValue.validate_raw(obj: obj.coinsurance)
              obj.visits.nil? || CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageValue.validate_raw(obj: obj.visits)
              obj.visits_remaining.nil? || CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageValue.validate_raw(obj: obj.visits_remaining)
              obj.additional_notes&.is_a?(String) != false || raise("Passed value for field obj.additional_notes is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
