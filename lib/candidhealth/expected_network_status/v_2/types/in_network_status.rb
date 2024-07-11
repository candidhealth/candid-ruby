# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module ExpectedNetworkStatus
    module V2
      module Types
        class InNetworkStatus
          # @return [String]
          attr_reader :routed_payer_uuid
          # @return [String]
          attr_reader :routed_billing_provider_id
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param routed_payer_uuid [String]
          # @param routed_billing_provider_id [String]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::ExpectedNetworkStatus::V2::Types::InNetworkStatus]
          def initialize(routed_payer_uuid:, routed_billing_provider_id:, additional_properties: nil)
            @routed_payer_uuid = routed_payer_uuid
            @routed_billing_provider_id = routed_billing_provider_id
            @additional_properties = additional_properties
            @_field_set = {
              "routed_payer_uuid": routed_payer_uuid,
              "routed_billing_provider_id": routed_billing_provider_id
            }
          end

          # Deserialize a JSON object to an instance of InNetworkStatus
          #
          # @param json_object [String]
          # @return [CandidApiClient::ExpectedNetworkStatus::V2::Types::InNetworkStatus]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            routed_payer_uuid = struct["routed_payer_uuid"]
            routed_billing_provider_id = struct["routed_billing_provider_id"]
            new(
              routed_payer_uuid: routed_payer_uuid,
              routed_billing_provider_id: routed_billing_provider_id,
              additional_properties: struct
            )
          end

          # Serialize an instance of InNetworkStatus to a JSON object
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
            obj.routed_payer_uuid.is_a?(String) != false || raise("Passed value for field obj.routed_payer_uuid is not the expected type, validation failed.")
            obj.routed_billing_provider_id.is_a?(String) != false || raise("Passed value for field obj.routed_billing_provider_id is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
