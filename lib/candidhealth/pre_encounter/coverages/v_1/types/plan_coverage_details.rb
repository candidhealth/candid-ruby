# frozen_string_literal: true

require_relative "coverage_value"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Coverages
      module V1
        module Types
          class PlanCoverageDetails
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageValue]
            attr_reader :deductible
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageValue]
            attr_reader :deductible_remaining
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageValue]
            attr_reader :deductible_year_to_date
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageValue]
            attr_reader :oop_max
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageValue]
            attr_reader :oop_max_remaining
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageValue]
            attr_reader :oop_year_to_date
            # @return [String]
            attr_reader :additional_notes
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param deductible [CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageValue]
            # @param deductible_remaining [CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageValue]
            # @param deductible_year_to_date [CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageValue]
            # @param oop_max [CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageValue]
            # @param oop_max_remaining [CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageValue]
            # @param oop_year_to_date [CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageValue]
            # @param additional_notes [String]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::PlanCoverageDetails]
            def initialize(deductible: OMIT, deductible_remaining: OMIT, deductible_year_to_date: OMIT, oop_max: OMIT,
                           oop_max_remaining: OMIT, oop_year_to_date: OMIT, additional_notes: OMIT, additional_properties: nil)
              @deductible = deductible if deductible != OMIT
              @deductible_remaining = deductible_remaining if deductible_remaining != OMIT
              @deductible_year_to_date = deductible_year_to_date if deductible_year_to_date != OMIT
              @oop_max = oop_max if oop_max != OMIT
              @oop_max_remaining = oop_max_remaining if oop_max_remaining != OMIT
              @oop_year_to_date = oop_year_to_date if oop_year_to_date != OMIT
              @additional_notes = additional_notes if additional_notes != OMIT
              @additional_properties = additional_properties
              @_field_set = {
                "deductible": deductible,
                "deductible_remaining": deductible_remaining,
                "deductible_year_to_date": deductible_year_to_date,
                "oop_max": oop_max,
                "oop_max_remaining": oop_max_remaining,
                "oop_year_to_date": oop_year_to_date,
                "additional_notes": additional_notes
              }.reject do |_k, v|
                v == OMIT
              end
            end

            # Deserialize a JSON object to an instance of PlanCoverageDetails
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::PlanCoverageDetails]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              parsed_json = JSON.parse(json_object)
              if parsed_json["deductible"].nil?
                deductible = nil
              else
                deductible = parsed_json["deductible"].to_json
                deductible = CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageValue.from_json(json_object: deductible)
              end
              if parsed_json["deductible_remaining"].nil?
                deductible_remaining = nil
              else
                deductible_remaining = parsed_json["deductible_remaining"].to_json
                deductible_remaining = CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageValue.from_json(json_object: deductible_remaining)
              end
              if parsed_json["deductible_year_to_date"].nil?
                deductible_year_to_date = nil
              else
                deductible_year_to_date = parsed_json["deductible_year_to_date"].to_json
                deductible_year_to_date = CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageValue.from_json(json_object: deductible_year_to_date)
              end
              if parsed_json["oop_max"].nil?
                oop_max = nil
              else
                oop_max = parsed_json["oop_max"].to_json
                oop_max = CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageValue.from_json(json_object: oop_max)
              end
              if parsed_json["oop_max_remaining"].nil?
                oop_max_remaining = nil
              else
                oop_max_remaining = parsed_json["oop_max_remaining"].to_json
                oop_max_remaining = CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageValue.from_json(json_object: oop_max_remaining)
              end
              if parsed_json["oop_year_to_date"].nil?
                oop_year_to_date = nil
              else
                oop_year_to_date = parsed_json["oop_year_to_date"].to_json
                oop_year_to_date = CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageValue.from_json(json_object: oop_year_to_date)
              end
              additional_notes = struct["additional_notes"]
              new(
                deductible: deductible,
                deductible_remaining: deductible_remaining,
                deductible_year_to_date: deductible_year_to_date,
                oop_max: oop_max,
                oop_max_remaining: oop_max_remaining,
                oop_year_to_date: oop_year_to_date,
                additional_notes: additional_notes,
                additional_properties: struct
              )
            end

            # Serialize an instance of PlanCoverageDetails to a JSON object
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
              obj.deductible.nil? || CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageValue.validate_raw(obj: obj.deductible)
              obj.deductible_remaining.nil? || CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageValue.validate_raw(obj: obj.deductible_remaining)
              obj.deductible_year_to_date.nil? || CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageValue.validate_raw(obj: obj.deductible_year_to_date)
              obj.oop_max.nil? || CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageValue.validate_raw(obj: obj.oop_max)
              obj.oop_max_remaining.nil? || CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageValue.validate_raw(obj: obj.oop_max_remaining)
              obj.oop_year_to_date.nil? || CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageValue.validate_raw(obj: obj.oop_year_to_date)
              obj.additional_notes&.is_a?(String) != false || raise("Passed value for field obj.additional_notes is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
