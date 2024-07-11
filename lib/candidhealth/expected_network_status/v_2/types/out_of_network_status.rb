# frozen_string_literal: true

require_relative "explanation"
require "ostruct"
require "json"

module CandidApiClient
  module ExpectedNetworkStatus
    module V2
      module Types
        class OutOfNetworkStatus
          # @return [CandidApiClient::ExpectedNetworkStatus::V2::Types::Explanation]
          attr_reader :explanation
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

          # @param explanation [CandidApiClient::ExpectedNetworkStatus::V2::Types::Explanation]
          # @param routed_payer_uuid [String]
          # @param routed_billing_provider_id [String]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::ExpectedNetworkStatus::V2::Types::OutOfNetworkStatus]
          def initialize(explanation:, routed_payer_uuid:, routed_billing_provider_id:, additional_properties: nil)
            @explanation = explanation
            @routed_payer_uuid = routed_payer_uuid
            @routed_billing_provider_id = routed_billing_provider_id
            @additional_properties = additional_properties
            @_field_set = {
              "explanation": explanation,
              "routed_payer_uuid": routed_payer_uuid,
              "routed_billing_provider_id": routed_billing_provider_id
            }
          end

          # Deserialize a JSON object to an instance of OutOfNetworkStatus
          #
          # @param json_object [String]
          # @return [CandidApiClient::ExpectedNetworkStatus::V2::Types::OutOfNetworkStatus]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            explanation = struct["explanation"]
            routed_payer_uuid = struct["routed_payer_uuid"]
            routed_billing_provider_id = struct["routed_billing_provider_id"]
            new(
              explanation: explanation,
              routed_payer_uuid: routed_payer_uuid,
              routed_billing_provider_id: routed_billing_provider_id,
              additional_properties: struct
            )
          end

          # Serialize an instance of OutOfNetworkStatus to a JSON object
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
            obj.explanation.is_a?(CandidApiClient::ExpectedNetworkStatus::V2::Types::Explanation) != false || raise("Passed value for field obj.explanation is not the expected type, validation failed.")
            obj.routed_payer_uuid.is_a?(String) != false || raise("Passed value for field obj.routed_payer_uuid is not the expected type, validation failed.")
            obj.routed_billing_provider_id.is_a?(String) != false || raise("Passed value for field obj.routed_billing_provider_id is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
