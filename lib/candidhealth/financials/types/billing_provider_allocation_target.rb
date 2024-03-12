# frozen_string_literal: true

require_relative "../../commons/types/provider_id"
require "json"

module CandidApiClient
  class Financials
    class BillingProviderAllocationTarget
      attr_reader :billing_provider_id, :additional_properties

      # @param billing_provider_id [Commons::PROVIDER_ID]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Financials::BillingProviderAllocationTarget]
      def initialize(billing_provider_id:, additional_properties: nil)
        # @type [Commons::PROVIDER_ID]
        @billing_provider_id = billing_provider_id
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of BillingProviderAllocationTarget
      #
      # @param json_object [JSON]
      # @return [Financials::BillingProviderAllocationTarget]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        billing_provider_id = struct.billing_provider_id
        new(billing_provider_id: billing_provider_id, additional_properties: struct)
      end

      # Serialize an instance of BillingProviderAllocationTarget to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "billing_provider_id": @billing_provider_id }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.billing_provider_id.is_a?(UUID) != false || raise("Passed value for field obj.billing_provider_id is not the expected type, validation failed.")
      end
    end
  end
end
