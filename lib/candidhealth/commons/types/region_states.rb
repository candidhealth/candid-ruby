# frozen_string_literal: true

require_relative "state"
require "json"

module CandidApiClient
  class Commons
    class RegionStates
      attr_reader :states, :additional_properties

      # @param states [Array<Commons::State>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Commons::RegionStates]
      def initialize(states:, additional_properties: nil)
        # @type [Array<Commons::State>]
        @states = states
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of RegionStates
      #
      # @param json_object [JSON]
      # @return [Commons::RegionStates]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        states = struct.states
        new(states: states, additional_properties: struct)
      end

      # Serialize an instance of RegionStates to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "states": @states }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.states.is_a?(Array) != false || raise("Passed value for field obj.states is not the expected type, validation failed.")
      end
    end
  end
end
