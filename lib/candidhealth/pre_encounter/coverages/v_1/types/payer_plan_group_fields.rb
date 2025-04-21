# frozen_string_literal: true

require_relative "network_type"
require "ostruct"
require "json"

module CandidApiClient
  module PreEncounter
    module Coverages
      module V1
        module Types
          class PayerPlanGroupFields
            # @return [String]
            attr_reader :payer_plan_group_id
            # @return [String]
            attr_reader :payer_id
            # @return [String]
            attr_reader :payer_name
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::NetworkType]
            attr_reader :plan_type
            # @return [OpenStruct] Additional properties unmapped to the current class definition
            attr_reader :additional_properties
            # @return [Object]
            attr_reader :_field_set
            protected :_field_set

            OMIT = Object.new

            # @param payer_plan_group_id [String]
            # @param payer_id [String]
            # @param payer_name [String]
            # @param plan_type [CandidApiClient::PreEncounter::Coverages::V1::Types::NetworkType]
            # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::PayerPlanGroupFields]
            def initialize(payer_plan_group_id:, payer_id:, payer_name:, plan_type:, additional_properties: nil)
              @payer_plan_group_id = payer_plan_group_id
              @payer_id = payer_id
              @payer_name = payer_name
              @plan_type = plan_type
              @additional_properties = additional_properties
              @_field_set = {
                "payer_plan_group_id": payer_plan_group_id,
                "payer_id": payer_id,
                "payer_name": payer_name,
                "plan_type": plan_type
              }
            end

            # Deserialize a JSON object to an instance of PayerPlanGroupFields
            #
            # @param json_object [String]
            # @return [CandidApiClient::PreEncounter::Coverages::V1::Types::PayerPlanGroupFields]
            def self.from_json(json_object:)
              struct = JSON.parse(json_object, object_class: OpenStruct)
              payer_plan_group_id = struct["payer_plan_group_id"]
              payer_id = struct["payer_id"]
              payer_name = struct["payer_name"]
              plan_type = struct["plan_type"]
              new(
                payer_plan_group_id: payer_plan_group_id,
                payer_id: payer_id,
                payer_name: payer_name,
                plan_type: plan_type,
                additional_properties: struct
              )
            end

            # Serialize an instance of PayerPlanGroupFields to a JSON object
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
              obj.payer_id.is_a?(String) != false || raise("Passed value for field obj.payer_id is not the expected type, validation failed.")
              obj.payer_name.is_a?(String) != false || raise("Passed value for field obj.payer_name is not the expected type, validation failed.")
              obj.plan_type.is_a?(CandidApiClient::PreEncounter::Coverages::V1::Types::NetworkType) != false || raise("Passed value for field obj.plan_type is not the expected type, validation failed.")
            end
          end
        end
      end
    end
  end
end
