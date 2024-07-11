# frozen_string_literal: true

require_relative "../../../commons/types/claim_adjustment_group_codes"
require_relative "carc"
require "ostruct"
require "json"

module CandidApiClient
  module X12
    module V1
      module Types
        class ClaimAdjustmentReasonCode
          # @return [CandidApiClient::Commons::Types::ClaimAdjustmentGroupCodes]
          attr_reader :group_code
          # @return [CandidApiClient::X12::V1::Types::Carc]
          attr_reader :reason_code
          # @return [Integer]
          attr_reader :amount_cents
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param group_code [CandidApiClient::Commons::Types::ClaimAdjustmentGroupCodes]
          # @param reason_code [CandidApiClient::X12::V1::Types::Carc]
          # @param amount_cents [Integer]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::X12::V1::Types::ClaimAdjustmentReasonCode]
          def initialize(group_code:, reason_code:, amount_cents:, additional_properties: nil)
            @group_code = group_code
            @reason_code = reason_code
            @amount_cents = amount_cents
            @additional_properties = additional_properties
            @_field_set = { "group_code": group_code, "reason_code": reason_code, "amount_cents": amount_cents }
          end

          # Deserialize a JSON object to an instance of ClaimAdjustmentReasonCode
          #
          # @param json_object [String]
          # @return [CandidApiClient::X12::V1::Types::ClaimAdjustmentReasonCode]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            group_code = struct["group_code"]
            reason_code = struct["reason_code"]
            amount_cents = struct["amount_cents"]
            new(
              group_code: group_code,
              reason_code: reason_code,
              amount_cents: amount_cents,
              additional_properties: struct
            )
          end

          # Serialize an instance of ClaimAdjustmentReasonCode to a JSON object
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
            obj.group_code.is_a?(CandidApiClient::Commons::Types::ClaimAdjustmentGroupCodes) != false || raise("Passed value for field obj.group_code is not the expected type, validation failed.")
            obj.reason_code.is_a?(CandidApiClient::X12::V1::Types::Carc) != false || raise("Passed value for field obj.reason_code is not the expected type, validation failed.")
            obj.amount_cents.is_a?(Integer) != false || raise("Passed value for field obj.amount_cents is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
