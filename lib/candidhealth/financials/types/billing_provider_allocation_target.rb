# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module Financials
    module Types
      class BillingProviderAllocationTarget
        # @return [String]
        attr_reader :billing_provider_id
        # @return [OpenStruct] Additional properties unmapped to the current class definition
        attr_reader :additional_properties
        # @return [Object]
        attr_reader :_field_set
        protected :_field_set

        OMIT = Object.new

        # @param billing_provider_id [String]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [CandidApiClient::Financials::Types::BillingProviderAllocationTarget]
        def initialize(billing_provider_id:, additional_properties: nil)
          @billing_provider_id = billing_provider_id
          @additional_properties = additional_properties
          @_field_set = { "billing_provider_id": billing_provider_id }
        end

        # Deserialize a JSON object to an instance of BillingProviderAllocationTarget
        #
        # @param json_object [String]
        # @return [CandidApiClient::Financials::Types::BillingProviderAllocationTarget]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          billing_provider_id = struct["billing_provider_id"]
          new(billing_provider_id: billing_provider_id, additional_properties: struct)
        end

        # Serialize an instance of BillingProviderAllocationTarget to a JSON object
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
          obj.billing_provider_id.is_a?(String) != false || raise("Passed value for field obj.billing_provider_id is not the expected type, validation failed.")
        end
      end
    end
  end
end
