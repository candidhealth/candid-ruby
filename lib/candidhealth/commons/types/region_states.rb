# frozen_string_literal: true

require_relative "state"
require "ostruct"
require "json"

module CandidApiClient
  module Commons
    module Types
      class RegionStates
        # @return [Array<CandidApiClient::Commons::Types::State>]
        attr_reader :states
        # @return [OpenStruct] Additional properties unmapped to the current class definition
        attr_reader :additional_properties
        # @return [Object]
        attr_reader :_field_set
        protected :_field_set

        OMIT = Object.new

        # @param states [Array<CandidApiClient::Commons::Types::State>]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [CandidApiClient::Commons::Types::RegionStates]
        def initialize(states:, additional_properties: nil)
          @states = states
          @additional_properties = additional_properties
          @_field_set = { "states": states }
        end

        # Deserialize a JSON object to an instance of RegionStates
        #
        # @param json_object [String]
        # @return [CandidApiClient::Commons::Types::RegionStates]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          states = struct["states"]
          new(states: states, additional_properties: struct)
        end

        # Serialize an instance of RegionStates to a JSON object
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
          obj.states.is_a?(Array) != false || raise("Passed value for field obj.states is not the expected type, validation failed.")
        end
      end
    end
  end
end
