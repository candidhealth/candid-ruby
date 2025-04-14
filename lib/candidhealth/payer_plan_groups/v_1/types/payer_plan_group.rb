# frozen_string_literal: true

require_relative "../../../payers/v_3/types/payer"
require_relative "../../../commons/types/source_of_payment_code"
require "ostruct"
require "json"

module CandidApiClient
  module PayerPlanGroups
    module V1
      module Types
        class PayerPlanGroup
          # @return [String]
          attr_reader :payer_plan_group_id
          # @return [CandidApiClient::Payers::V3::Types::Payer]
          attr_reader :payer
          # @return [Boolean]
          attr_reader :is_active
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

          # @param payer_plan_group_id [String]
          # @param payer [CandidApiClient::Payers::V3::Types::Payer]
          # @param is_active [Boolean]
          # @param plan_group_name [String]
          # @param payer_uuid [String]
          # @param plan_type [CandidApiClient::Commons::Types::SourceOfPaymentCode]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::PayerPlanGroups::V1::Types::PayerPlanGroup]
          def initialize(payer_plan_group_id:, payer:, is_active:, plan_group_name:, payer_uuid:, plan_type:,
                         additional_properties: nil)
            @payer_plan_group_id = payer_plan_group_id
            @payer = payer
            @is_active = is_active
            @plan_group_name = plan_group_name
            @payer_uuid = payer_uuid
            @plan_type = plan_type
            @additional_properties = additional_properties
            @_field_set = {
              "payer_plan_group_id": payer_plan_group_id,
              "payer": payer,
              "is_active": is_active,
              "plan_group_name": plan_group_name,
              "payer_uuid": payer_uuid,
              "plan_type": plan_type
            }
          end

          # Deserialize a JSON object to an instance of PayerPlanGroup
          #
          # @param json_object [String]
          # @return [CandidApiClient::PayerPlanGroups::V1::Types::PayerPlanGroup]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            payer_plan_group_id = struct["payer_plan_group_id"]
            if parsed_json["payer"].nil?
              payer = nil
            else
              payer = parsed_json["payer"].to_json
              payer = CandidApiClient::Payers::V3::Types::Payer.from_json(json_object: payer)
            end
            is_active = struct["is_active"]
            plan_group_name = struct["plan_group_name"]
            payer_uuid = struct["payer_uuid"]
            plan_type = struct["plan_type"]
            new(
              payer_plan_group_id: payer_plan_group_id,
              payer: payer,
              is_active: is_active,
              plan_group_name: plan_group_name,
              payer_uuid: payer_uuid,
              plan_type: plan_type,
              additional_properties: struct
            )
          end

          # Serialize an instance of PayerPlanGroup to a JSON object
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
            obj.payer_plan_group_id.is_a?(String) != false || raise("Passed value for field obj.payer_plan_group_id is not the expected type, validation failed.")
            CandidApiClient::Payers::V3::Types::Payer.validate_raw(obj: obj.payer)
            obj.is_active.is_a?(Boolean) != false || raise("Passed value for field obj.is_active is not the expected type, validation failed.")
            obj.plan_group_name.is_a?(String) != false || raise("Passed value for field obj.plan_group_name is not the expected type, validation failed.")
            obj.payer_uuid.is_a?(String) != false || raise("Passed value for field obj.payer_uuid is not the expected type, validation failed.")
            obj.plan_type.is_a?(CandidApiClient::Commons::Types::SourceOfPaymentCode) != false || raise("Passed value for field obj.plan_type is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
