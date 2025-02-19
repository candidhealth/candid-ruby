# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module Encounters
    module V4
      module Types
        class PayerPlanGroupPayerDoesNotMatchInsuranceCardError
          # @return [String]
          attr_reader :payer_plan_group_payer_uuid
          # @return [String]
          attr_reader :insurance_card_payer_uuid
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param payer_plan_group_payer_uuid [String]
          # @param insurance_card_payer_uuid [String]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Encounters::V4::Types::PayerPlanGroupPayerDoesNotMatchInsuranceCardError]
          def initialize(payer_plan_group_payer_uuid:, insurance_card_payer_uuid: OMIT, additional_properties: nil)
            @payer_plan_group_payer_uuid = payer_plan_group_payer_uuid
            @insurance_card_payer_uuid = insurance_card_payer_uuid if insurance_card_payer_uuid != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "payer_plan_group_payer_uuid": payer_plan_group_payer_uuid,
              "insurance_card_payer_uuid": insurance_card_payer_uuid
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of
          #  PayerPlanGroupPayerDoesNotMatchInsuranceCardError
          #
          # @param json_object [String]
          # @return [CandidApiClient::Encounters::V4::Types::PayerPlanGroupPayerDoesNotMatchInsuranceCardError]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            payer_plan_group_payer_uuid = struct["payer_plan_group_payer_uuid"]
            insurance_card_payer_uuid = struct["insurance_card_payer_uuid"]
            new(
              payer_plan_group_payer_uuid: payer_plan_group_payer_uuid,
              insurance_card_payer_uuid: insurance_card_payer_uuid,
              additional_properties: struct
            )
          end

          # Serialize an instance of PayerPlanGroupPayerDoesNotMatchInsuranceCardError to a
          #  JSON object
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
            obj.payer_plan_group_payer_uuid.is_a?(String) != false || raise("Passed value for field obj.payer_plan_group_payer_uuid is not the expected type, validation failed.")
            obj.insurance_card_payer_uuid&.is_a?(String) != false || raise("Passed value for field obj.insurance_card_payer_uuid is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
