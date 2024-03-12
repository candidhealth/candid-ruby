# frozen_string_literal: true

require_relative "../../../commons/types/claim_adjustment_group_codes"
require_relative "carc"
require "json"

module CandidApiClient
  module X12
    module V1
      class ClaimAdjustmentReasonCode
        attr_reader :group_code, :reason_code, :amount_cents, :additional_properties

        # @param group_code [Commons::ClaimAdjustmentGroupCodes]
        # @param reason_code [X12::V1::Carc]
        # @param amount_cents [Integer]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [X12::V1::ClaimAdjustmentReasonCode]
        def initialize(group_code:, reason_code:, amount_cents:, additional_properties: nil)
          # @type [Commons::ClaimAdjustmentGroupCodes]
          @group_code = group_code
          # @type [X12::V1::Carc]
          @reason_code = reason_code
          # @type [Integer]
          @amount_cents = amount_cents
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of ClaimAdjustmentReasonCode
        #
        # @param json_object [JSON]
        # @return [X12::V1::ClaimAdjustmentReasonCode]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          JSON.parse(json_object)
          group_code = struct.group_code
          reason_code = struct.reason_code
          amount_cents = struct.amount_cents
          new(group_code: group_code, reason_code: reason_code, amount_cents: amount_cents,
              additional_properties: struct)
        end

        # Serialize an instance of ClaimAdjustmentReasonCode to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "group_code": @group_code, "reason_code": @reason_code, "amount_cents": @amount_cents }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.group_code.is_a?(Commons::ClaimAdjustmentGroupCodes) != false || raise("Passed value for field obj.group_code is not the expected type, validation failed.")
          obj.reason_code.is_a?(X12::V1::Carc) != false || raise("Passed value for field obj.reason_code is not the expected type, validation failed.")
          obj.amount_cents.is_a?(Integer) != false || raise("Passed value for field obj.amount_cents is not the expected type, validation failed.")
        end
      end
    end
  end
end
