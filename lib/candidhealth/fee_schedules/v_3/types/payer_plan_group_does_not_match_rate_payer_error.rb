# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module FeeSchedules
    module V3
      module Types
        class PayerPlanGroupDoesNotMatchRatePayerError
          # @return [String]
          attr_reader :rate_payer_uuid
          # @return [String]
          attr_reader :payer_plan_group_payer_uuid
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param rate_payer_uuid [String]
          # @param payer_plan_group_payer_uuid [String]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::FeeSchedules::V3::Types::PayerPlanGroupDoesNotMatchRatePayerError]
          def initialize(rate_payer_uuid:, payer_plan_group_payer_uuid:, additional_properties: nil)
            @rate_payer_uuid = rate_payer_uuid
            @payer_plan_group_payer_uuid = payer_plan_group_payer_uuid
            @additional_properties = additional_properties
            @_field_set = {
              "rate_payer_uuid": rate_payer_uuid,
              "payer_plan_group_payer_uuid": payer_plan_group_payer_uuid
            }
          end

          # Deserialize a JSON object to an instance of
          #  PayerPlanGroupDoesNotMatchRatePayerError
          #
          # @param json_object [String]
          # @return [CandidApiClient::FeeSchedules::V3::Types::PayerPlanGroupDoesNotMatchRatePayerError]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            rate_payer_uuid = struct["rate_payer_uuid"]
            payer_plan_group_payer_uuid = struct["payer_plan_group_payer_uuid"]
            new(
              rate_payer_uuid: rate_payer_uuid,
              payer_plan_group_payer_uuid: payer_plan_group_payer_uuid,
              additional_properties: struct
            )
          end

          # Serialize an instance of PayerPlanGroupDoesNotMatchRatePayerError to a JSON
          #  object
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
            obj.rate_payer_uuid.is_a?(String) != false || raise("Passed value for field obj.rate_payer_uuid is not the expected type, validation failed.")
            obj.payer_plan_group_payer_uuid.is_a?(String) != false || raise("Passed value for field obj.payer_plan_group_payer_uuid is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
