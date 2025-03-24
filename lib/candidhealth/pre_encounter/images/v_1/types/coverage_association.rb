# frozen_string_literal: true

require_relative "coverage_image_side"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Images
      module V1
        module Types
          # An association to a Coverage.
          class CoverageAssociation
            # @return [String]
            attr_reader :id
            # @return [CandidApiClient::PreEncounter::Images::V1::Types::CoverageImageSide]
            attr_reader :side
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param id [String]
            # @param side [CandidApiClient::PreEncounter::Images::V1::Types::CoverageImageSide]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Images::V1::Types::CoverageAssociation]
            def initialize(id:, side:, additional_properties: nil)
              @id = id
              @side = side
              @additional_properties = additional_properties
              @_field_set = { "id": id, "side": side }
            end

            # Deserialize a JSON object to an instance of CoverageAssociation
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Images::V1::Types::CoverageAssociation]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              id = struct["id"]
              side = struct["side"]
              new(
                id: id,
                side: side,
                additional_properties: struct
              )
            end

            # Serialize an instance of CoverageAssociation to a JSON object
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
              obj.side.is_a?(CandidApiClient::PreEncounter::Images::V1::Types::CoverageImageSide) != false || raise("Passed value for field obj.side is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
