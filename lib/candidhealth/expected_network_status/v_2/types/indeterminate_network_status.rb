# frozen_string_literal: true

require_relative "explanation"
require "ostruct"
require "json"

module CandidApiClient
  module ExpectedNetworkStatus
    module V2
      module Types
        class IndeterminateNetworkStatus
          # @return [String]
          attr_reader :error
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

          # @param error [String]
          # @param explanation [CandidApiClient::ExpectedNetworkStatus::V2::Types::Explanation]
          # @param routed_payer_uuid [String]
          # @param routed_billing_provider_id [String]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::ExpectedNetworkStatus::V2::Types::IndeterminateNetworkStatus]
          def initialize(error:, explanation:, routed_payer_uuid: OMIT, routed_billing_provider_id: OMIT,
                         additional_properties: nil)
            @error = error
            @explanation = explanation
            @routed_payer_uuid = routed_payer_uuid if routed_payer_uuid != OMIT
            @routed_billing_provider_id = routed_billing_provider_id if routed_billing_provider_id != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "error": error,
              "explanation": explanation,
              "routed_payer_uuid": routed_payer_uuid,
              "routed_billing_provider_id": routed_billing_provider_id
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of IndeterminateNetworkStatus
          #
          # @param json_object [String]
          # @return [CandidApiClient::ExpectedNetworkStatus::V2::Types::IndeterminateNetworkStatus]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            error = struct["error"]
            explanation = struct["explanation"]
            routed_payer_uuid = struct["routed_payer_uuid"]
            routed_billing_provider_id = struct["routed_billing_provider_id"]
            new(
              error: error,
              explanation: explanation,
              routed_payer_uuid: routed_payer_uuid,
              routed_billing_provider_id: routed_billing_provider_id,
              additional_properties: struct
            )
          end

          # Serialize an instance of IndeterminateNetworkStatus to a JSON object
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
            obj.error.is_a?(String) != false || raise("Passed value for field obj.error is not the expected type, validation failed.")
            obj.explanation.is_a?(CandidApiClient::ExpectedNetworkStatus::V2::Types::Explanation) != false || raise("Passed value for field obj.explanation is not the expected type, validation failed.")
            obj.routed_payer_uuid&.is_a?(String) != false || raise("Passed value for field obj.routed_payer_uuid is not the expected type, validation failed.")
            obj.routed_billing_provider_id&.is_a?(String) != false || raise("Passed value for field obj.routed_billing_provider_id is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
