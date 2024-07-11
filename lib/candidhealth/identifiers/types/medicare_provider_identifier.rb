# frozen_string_literal: true

require_relative "../../commons/types/state"
require "ostruct"
require "json"

module CandidApiClient
  module Identifiers
    module Types
      class MedicareProviderIdentifier
        # @return [CandidApiClient::Commons::Types::State]
        attr_reader :state
        # @return [String]
        attr_reader :provider_number
        # @return [OpenStruct] Additional properties unmapped to the current class definition
        attr_reader :additional_properties
        # @return [Object]
        attr_reader :_field_set
        protected :_field_set

        OMIT = Object.new

        # @param state [CandidApiClient::Commons::Types::State]
        # @param provider_number [String]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [CandidApiClient::Identifiers::Types::MedicareProviderIdentifier]
        def initialize(state:, provider_number:, additional_properties: nil)
          @state = state
          @provider_number = provider_number
          @additional_properties = additional_properties
          @_field_set = { "state": state, "provider_number": provider_number }
        end

        # Deserialize a JSON object to an instance of MedicareProviderIdentifier
        #
        # @param json_object [String]
        # @return [CandidApiClient::Identifiers::Types::MedicareProviderIdentifier]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          state = struct["state"]
          provider_number = struct["provider_number"]
          new(
            state: state,
            provider_number: provider_number,
            additional_properties: struct
          )
        end

        # Serialize an instance of MedicareProviderIdentifier to a JSON object
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
          obj.state.is_a?(CandidApiClient::Commons::Types::State) != false || raise("Passed value for field obj.state is not the expected type, validation failed.")
          obj.provider_number.is_a?(String) != false || raise("Passed value for field obj.provider_number is not the expected type, validation failed.")
        end
      end
    end
  end
end
