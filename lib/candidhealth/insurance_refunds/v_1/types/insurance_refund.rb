# frozen_string_literal: true

require_relative "../../../payers/v_3/types/payer"
require "date"
require_relative "../../../financials/types/allocation"
require_relative "../../../financials/types/refund_reason"
require "ostruct"
require "json"

module CandidApiClient
  module InsuranceRefunds
    module V1
      module Types
        class InsuranceRefund
          # @return [String]
          attr_reader :insurance_refund_id
          # @return [CandidApiClient::Payers::V3::Types::Payer]
          attr_reader :payer
          # @return [Integer]
          attr_reader :amount_cents
          # @return [DateTime]
          attr_reader :refund_timestamp
          # @return [String]
          attr_reader :refund_note
          # @return [Array<CandidApiClient::Financials::Types::Allocation>]
          attr_reader :allocations
          # @return [CandidApiClient::Financials::Types::RefundReason]
          attr_reader :refund_reason
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param insurance_refund_id [String]
          # @param payer [CandidApiClient::Payers::V3::Types::Payer]
          # @param amount_cents [Integer]
          # @param refund_timestamp [DateTime]
          # @param refund_note [String]
          # @param allocations [Array<CandidApiClient::Financials::Types::Allocation>]
          # @param refund_reason [CandidApiClient::Financials::Types::RefundReason]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::InsuranceRefunds::V1::Types::InsuranceRefund]
          def initialize(insurance_refund_id:, payer:, amount_cents:, allocations:, refund_timestamp: OMIT,
                         refund_note: OMIT, refund_reason: OMIT, additional_properties: nil)
            @insurance_refund_id = insurance_refund_id
            @payer = payer
            @amount_cents = amount_cents
            @refund_timestamp = refund_timestamp if refund_timestamp != OMIT
            @refund_note = refund_note if refund_note != OMIT
            @allocations = allocations
            @refund_reason = refund_reason if refund_reason != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "insurance_refund_id": insurance_refund_id,
              "payer": payer,
              "amount_cents": amount_cents,
              "refund_timestamp": refund_timestamp,
              "refund_note": refund_note,
              "allocations": allocations,
              "refund_reason": refund_reason
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of InsuranceRefund
          #
          # @param json_object [String]
          # @return [CandidApiClient::InsuranceRefunds::V1::Types::InsuranceRefund]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            insurance_refund_id = struct["insurance_refund_id"]
            if parsed_json["payer"].nil?
              payer = nil
            else
              payer = parsed_json["payer"].to_json
              payer = CandidApiClient::Payers::V3::Types::Payer.from_json(json_object: payer)
            end
            amount_cents = struct["amount_cents"]
            refund_timestamp = unless parsed_json["refund_timestamp"].nil?
                                 DateTime.parse(parsed_json["refund_timestamp"])
                               end
            refund_note = struct["refund_note"]
            allocations = parsed_json["allocations"]&.map do |item|
              item = item.to_json
              CandidApiClient::Financials::Types::Allocation.from_json(json_object: item)
            end
            refund_reason = struct["refund_reason"]
            new(
              insurance_refund_id: insurance_refund_id,
              payer: payer,
              amount_cents: amount_cents,
              refund_timestamp: refund_timestamp,
              refund_note: refund_note,
              allocations: allocations,
              refund_reason: refund_reason,
              additional_properties: struct
            )
          end

          # Serialize an instance of InsuranceRefund to a JSON object
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
            obj.insurance_refund_id.is_a?(String) != false || raise("Passed value for field obj.insurance_refund_id is not the expected type, validation failed.")
            CandidApiClient::Payers::V3::Types::Payer.validate_raw(obj: obj.payer)
            obj.amount_cents.is_a?(Integer) != false || raise("Passed value for field obj.amount_cents is not the expected type, validation failed.")
            obj.refund_timestamp&.is_a?(DateTime) != false || raise("Passed value for field obj.refund_timestamp is not the expected type, validation failed.")
            obj.refund_note&.is_a?(String) != false || raise("Passed value for field obj.refund_note is not the expected type, validation failed.")
            obj.allocations.is_a?(Array) != false || raise("Passed value for field obj.allocations is not the expected type, validation failed.")
            obj.refund_reason&.is_a?(CandidApiClient::Financials::Types::RefundReason) != false || raise("Passed value for field obj.refund_reason is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
