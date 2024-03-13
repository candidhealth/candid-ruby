# frozen_string_literal: true

require_relative "../../../organization_providers/v_2/types/organization_provider_id"
require_relative "../../../payers/v_3/types/payer_uuid"
require "json"

module CandidApiClient
  module ExpectedNetworkStatus
    module V2
      class InNetworkRenderingProvidersDetail
        attr_reader :rendering_providers, :routed_payer_uuid, :routed_billing_provider_id, :additional_properties

        # @param rendering_providers [Array<OrganizationProviders::V2::ORGANIZATION_PROVIDER_ID>]
        # @param routed_payer_uuid [Payers::V3::PAYER_String]
        # @param routed_billing_provider_id [OrganizationProviders::V2::ORGANIZATION_PROVIDER_ID]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [ExpectedNetworkStatus::V2::InNetworkRenderingProvidersDetail]
        def initialize(rendering_providers:, routed_payer_uuid:, routed_billing_provider_id:,
                       additional_properties: nil)
          # @type [Array<OrganizationProviders::V2::ORGANIZATION_PROVIDER_ID>]
          @rendering_providers = rendering_providers
          # @type [Payers::V3::PAYER_String]
          @routed_payer_uuid = routed_payer_uuid
          # @type [OrganizationProviders::V2::ORGANIZATION_PROVIDER_ID]
          @routed_billing_provider_id = routed_billing_provider_id
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of InNetworkRenderingProvidersDetail
        #
        # @param json_object [JSON]
        # @return [ExpectedNetworkStatus::V2::InNetworkRenderingProvidersDetail]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          JSON.parse(json_object)
          rendering_providers = struct.rendering_providers
          routed_payer_uuid = struct.routed_payer_uuid
          routed_billing_provider_id = struct.routed_billing_provider_id
          new(rendering_providers: rendering_providers, routed_payer_uuid: routed_payer_uuid,
              routed_billing_provider_id: routed_billing_provider_id, additional_properties: struct)
        end

        # Serialize an instance of InNetworkRenderingProvidersDetail to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "rendering_providers": @rendering_providers,
            "routed_payer_uuid": @routed_payer_uuid,
            "routed_billing_provider_id": @routed_billing_provider_id
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.rendering_providers.is_a?(Array) != false || raise("Passed value for field obj.rendering_providers is not the expected type, validation failed.")
          obj.routed_payer_uuid.is_a?(String) != false || raise("Passed value for field obj.routed_payer_uuid is not the expected type, validation failed.")
          obj.routed_billing_provider_id.is_a?(String) != false || raise("Passed value for field obj.routed_billing_provider_id is not the expected type, validation failed.")
        end
      end
    end
  end
end
