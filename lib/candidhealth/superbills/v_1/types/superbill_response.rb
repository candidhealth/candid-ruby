# frozen_string_literal: true

require_relative "superbill"
require "ostruct"
require "json"

module CandidApiClient
  module Superbills
    module V1
      module Types
        class SuperbillResponse
          # @return [Array<CandidApiClient::Superbills::V1::Types::Superbill>] Each object represents a single Superbill for a single billing provider.
          attr_reader :superbills
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param superbills [Array<CandidApiClient::Superbills::V1::Types::Superbill>] Each object represents a single Superbill for a single billing provider.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Superbills::V1::Types::SuperbillResponse]
          def initialize(superbills:, additional_properties: nil)
            @superbills = superbills
            @additional_properties = additional_properties
            @_field_set = { "superbills": superbills }
          end

          # Deserialize a JSON object to an instance of SuperbillResponse
          #
          # @param json_object [String]
          # @return [CandidApiClient::Superbills::V1::Types::SuperbillResponse]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            superbills = parsed_json["superbills"]&.map do |item|
              item = item.to_json
              CandidApiClient::Superbills::V1::Types::Superbill.from_json(json_object: item)
            end
            new(superbills: superbills, additional_properties: struct)
          end

          # Serialize an instance of SuperbillResponse to a JSON object
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
            obj.superbills.is_a?(Array) != false || raise("Passed value for field obj.superbills is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
