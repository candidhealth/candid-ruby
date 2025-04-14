# frozen_string_literal: true

require_relative "../../../commons/types/source_of_payment_code"
require "ostruct"
require "json"

module CandidApiClient
  module PayerPlanGroups
    module V1
      module Types
        class MutablePayerPlanGroup
          # @return [String]
          attr_reader :plan_group_name
          # @return [String]
          attr_reader :payer_uuid
          # @return [CandidApiClient::Commons::Types::SourceOfPaymentCode]
          attr_reader :plan_type
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param plan_group_name [String]
          # @param payer_uuid [String]
          # @param plan_type [CandidApiClient::Commons::Types::SourceOfPaymentCode]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::PayerPlanGroups::V1::Types::MutablePayerPlanGroup]
          def initialize(plan_group_name:, payer_uuid:, plan_type:, additional_properties: nil)
            @plan_group_name = plan_group_name
            @payer_uuid = payer_uuid
            @plan_type = plan_type
            @additional_properties = additional_properties
            @_field_set = { "plan_group_name": plan_group_name, "payer_uuid": payer_uuid, "plan_type": plan_type }
          end

          # Deserialize a JSON object to an instance of MutablePayerPlanGroup
          #
          # @param json_object [String]
          # @return [CandidApiClient::PayerPlanGroups::V1::Types::MutablePayerPlanGroup]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            plan_group_name = struct["plan_group_name"]
            payer_uuid = struct["payer_uuid"]
            plan_type = struct["plan_type"]
            new(
              plan_group_name: plan_group_name,
              payer_uuid: payer_uuid,
              plan_type: plan_type,
              additional_properties: struct
            )
          end

          # Serialize an instance of MutablePayerPlanGroup to a JSON object
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
            obj.plan_group_name.is_a?(String) != false || raise("Passed value for field obj.plan_group_name is not the expected type, validation failed.")
            obj.payer_uuid.is_a?(String) != false || raise("Passed value for field obj.payer_uuid is not the expected type, validation failed.")
            obj.plan_type.is_a?(CandidApiClient::Commons::Types::SourceOfPaymentCode) != false || raise("Passed value for field obj.plan_type is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
