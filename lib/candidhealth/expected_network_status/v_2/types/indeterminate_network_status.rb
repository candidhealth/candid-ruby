# frozen_string_literal: true

require_relative "explanation"
require_relative "../../../payers/v_3/types/payer_uuid"
require_relative "../../../organization_providers/v_2/types/organization_provider_id"
require "json"

module CandidApiClient
  module ExpectedNetworkStatus
    module V2
      class IndeterminateNetworkStatus
        attr_reader :error, :explanation, :routed_payer_uuid, :routed_billing_provider_id, :additional_properties

        # @param error [String]
        # @param explanation [ExpectedNetworkStatus::V2::Explanation]
        # @param routed_payer_uuid [Payers::V3::PAYER_UUID]
        # @param routed_billing_provider_id [OrganizationProviders::V2::ORGANIZATION_PROVIDER_ID]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [ExpectedNetworkStatus::V2::IndeterminateNetworkStatus]
        def initialize(error:, explanation:, routed_payer_uuid: nil, routed_billing_provider_id: nil,
                       additional_properties: nil)
          # @type [String]
          @error = error
          # @type [ExpectedNetworkStatus::V2::Explanation]
          @explanation = explanation
          # @type [Payers::V3::PAYER_UUID]
          @routed_payer_uuid = routed_payer_uuid
          # @type [OrganizationProviders::V2::ORGANIZATION_PROVIDER_ID]
          @routed_billing_provider_id = routed_billing_provider_id
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of IndeterminateNetworkStatus
        #
        # @param json_object [JSON]
        # @return [ExpectedNetworkStatus::V2::IndeterminateNetworkStatus]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          JSON.parse(json_object)
          error = struct.error
          explanation = struct.explanation
          routed_payer_uuid = struct.routed_payer_uuid
          routed_billing_provider_id = struct.routed_billing_provider_id
          new(error: error, explanation: explanation, routed_payer_uuid: routed_payer_uuid,
              routed_billing_provider_id: routed_billing_provider_id, additional_properties: struct)
        end

        # Serialize an instance of IndeterminateNetworkStatus to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "error": @error,
            "explanation": @explanation,
            "routed_payer_uuid": @routed_payer_uuid,
            "routed_billing_provider_id": @routed_billing_provider_id
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.error.is_a?(String) != false || raise("Passed value for field obj.error is not the expected type, validation failed.")
          obj.explanation.is_a?(ExpectedNetworkStatus::V2::Explanation) != false || raise("Passed value for field obj.explanation is not the expected type, validation failed.")
          obj.routed_payer_uuid&.is_a?(UUID) != false || raise("Passed value for field obj.routed_payer_uuid is not the expected type, validation failed.")
          obj.routed_billing_provider_id&.is_a?(UUID) != false || raise("Passed value for field obj.routed_billing_provider_id is not the expected type, validation failed.")
        end
      end
    end
  end
end
