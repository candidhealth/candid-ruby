# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Coverages
      module V1
        module Types
          class CoverageValue
            # @return [Float]
            attr_reader :family
            # @return [Float]
            attr_reader :individual
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param family [Float]
            # @param individual [Float]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageValue]
            def initialize(family: OMIT, individual: OMIT, additional_properties: nil)
              @family = family if family != OMIT
              @individual = individual if individual != OMIT
              @additional_properties = additional_properties
              @_field_set = { "family": family, "individual": individual }.reject do |_k, v|
                v == OMIT
              end
            end

            # Deserialize a JSON object to an instance of CoverageValue
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::CoverageValue]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              family = struct["family"]
              individual = struct["individual"]
              new(
                family: family,
                individual: individual,
                additional_properties: struct
              )
            end

            # Serialize an instance of CoverageValue to a JSON object
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
              obj.family&.is_a?(Float) != false || raise("Passed value for field obj.family is not the expected type, validation failed.")
              obj.individual&.is_a?(Float) != false || raise("Passed value for field obj.individual is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
