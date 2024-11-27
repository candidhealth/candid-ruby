# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Tags
      module V1
        module Types
          # An object representing a Tag.
          class MutableTag
            # @return [String]
            attr_reader :value
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param value [String]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Tags::V1::Types::MutableTag]
            def initialize(value:, additional_properties: nil)
              @value = value
              @additional_properties = additional_properties
              @_field_set = { "value": value }
            end

            # Deserialize a JSON object to an instance of MutableTag
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Tags::V1::Types::MutableTag]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              value = struct["value"]
              new(value: value, additional_properties: struct)
            end

            # Serialize an instance of MutableTag to a JSON object
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
              obj.value.is_a?(String) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
