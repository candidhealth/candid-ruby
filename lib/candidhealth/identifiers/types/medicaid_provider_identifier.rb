# frozen_string_literal: true

require_relative "../../commons/types/state"
require "json"

module CandidApiClient
  class Identifiers
    class MedicaidProviderIdentifier
      attr_reader :state, :provider_number, :additional_properties

      # @param state [Commons::State]
      # @param provider_number [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Identifiers::MedicaidProviderIdentifier]
      def initialize(state:, provider_number:, additional_properties: nil)
        # @type [Commons::State]
        @state = state
        # @type [String]
        @provider_number = provider_number
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of MedicaidProviderIdentifier
      #
      # @param json_object [JSON]
      # @return [Identifiers::MedicaidProviderIdentifier]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        state = struct.state
        provider_number = struct.provider_number
        new(state: state, provider_number: provider_number, additional_properties: struct)
      end

      # Serialize an instance of MedicaidProviderIdentifier to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "state": @state, "provider_number": @provider_number }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.state.is_a?(Commons::State) != false || raise("Passed value for field obj.state is not the expected type, validation failed.")
        obj.provider_number.is_a?(String) != false || raise("Passed value for field obj.provider_number is not the expected type, validation failed.")
      end
    end
  end
end
