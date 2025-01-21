# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Coverages
      module V1
        module Types
          class RelatedEntityContact
            # @return [String]
            attr_reader :mode
            # @return [String]
            attr_reader :value
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param mode [String]
            # @param value [String]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::RelatedEntityContact]
            def initialize(mode: OMIT, value: OMIT, additional_properties: nil)
              @mode = mode if mode != OMIT
              @value = value if value != OMIT
              @additional_properties = additional_properties
              @_field_set = { "mode": mode, "value": value }.reject do |_k, v|
                v == OMIT
              end
            end

            # Deserialize a JSON object to an instance of RelatedEntityContact
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::RelatedEntityContact]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              mode = struct["mode"]
              value = struct["value"]
              new(
                mode: mode,
                value: value,
                additional_properties: struct
              )
            end

            # Serialize an instance of RelatedEntityContact to a JSON object
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
              obj.mode&.is_a?(String) != false || raise("Passed value for field obj.mode is not the expected type, validation failed.")
              obj.value&.is_a?(String) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
