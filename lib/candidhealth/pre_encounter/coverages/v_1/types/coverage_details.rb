# frozen_string_literal: true

require_relative "benefit_type"
require_relative "coverage_level"
require_relative "coverage_value_unit"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Coverages
      module V1
        module Types
          class CoverageDetails
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::BenefitType]
            attr_reader :type
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageLevel]
            attr_reader :coverage_level
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageValueUnit]
            attr_reader :unit
            # @return [Float]
            attr_reader :value
            # @return [String]
            attr_reader :additional_notes
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param type [CandidApiClient::PreEncounter::Coverages::V1::Types::BenefitType]
            # @param coverage_level [CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageLevel]
            # @param unit [CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageValueUnit]
            # @param value [Float]
            # @param additional_notes [String]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageDetails]
            def initialize(type:, coverage_level:, unit:, value:, additional_notes: OMIT, additional_properties: nil)
              @type = type
              @coverage_level = coverage_level
              @unit = unit
              @value = value
              @additional_notes = additional_notes if additional_notes != OMIT
              @additional_properties = additional_properties
              @_field_set = {
                "type": type,
                "coverageLevel": coverage_level,
                "unit": unit,
                "value": value,
                "additional_notes": additional_notes
              }.reject do |_k, v|
                v == OMIT
              end
            end

            # Deserialize a JSON object to an instance of CoverageDetails
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageDetails]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              type = struct["type"]
              coverage_level = struct["coverageLevel"]
              unit = struct["unit"]
              value = struct["value"]
              additional_notes = struct["additional_notes"]
              new(
                type: type,
                coverage_level: coverage_level,
                unit: unit,
                value: value,
                additional_notes: additional_notes,
                additional_properties: struct
              )
            end

            # Serialize an instance of CoverageDetails to a JSON object
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
              obj.type.is_a?(CandidApiClient::PreEncounter::Coverages::V1::Types::BenefitType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
              obj.coverage_level.is_a?(CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageLevel) != false || raise("Passed value for field obj.coverage_level is not the expected type, validation failed.")
              obj.unit.is_a?(CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageValueUnit) != false || raise("Passed value for field obj.unit is not the expected type, validation failed.")
              obj.value.is_a?(Float) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
              obj.additional_notes&.is_a?(String) != false || raise("Passed value for field obj.additional_notes is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
