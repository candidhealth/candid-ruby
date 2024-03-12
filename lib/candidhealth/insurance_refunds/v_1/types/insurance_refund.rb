# frozen_string_literal: true

require_relative "insurance_refund_id"
require_relative "../../../payers/v_3/types/payer"
require "date"
require_relative "../../../financials/types/allocation"
require_relative "../../../financials/types/refund_reason"
require "json"

module CandidApiClient
  module InsuranceRefunds
    module V1
      class InsuranceRefund
        attr_reader :insurance_refund_id, :payer, :amount_cents, :refund_timestamp, :refund_note, :allocations,
                    :refund_reason, :additional_properties

        # @param insurance_refund_id [InsuranceRefunds::V1::INSURANCE_REFUND_ID]
        # @param payer [Payers::V3::Payer]
        # @param amount_cents [Integer]
        # @param refund_timestamp [DateTime]
        # @param refund_note [String]
        # @param allocations [Array<Financials::Allocation>]
        # @param refund_reason [Financials::RefundReason]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [InsuranceRefunds::V1::InsuranceRefund]
        def initialize(insurance_refund_id:, payer:, amount_cents:, allocations:, refund_timestamp: nil,
                       refund_note: nil, refund_reason: nil, additional_properties: nil)
          # @type [InsuranceRefunds::V1::INSURANCE_REFUND_ID]
          @insurance_refund_id = insurance_refund_id
          # @type [Payers::V3::Payer]
          @payer = payer
          # @type [Integer]
          @amount_cents = amount_cents
          # @type [DateTime]
          @refund_timestamp = refund_timestamp
          # @type [String]
          @refund_note = refund_note
          # @type [Array<Financials::Allocation>]
          @allocations = allocations
          # @type [Financials::RefundReason]
          @refund_reason = refund_reason
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of InsuranceRefund
        #
        # @param json_object [JSON]
        # @return [InsuranceRefunds::V1::InsuranceRefund]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          insurance_refund_id = struct.insurance_refund_id
          if parsed_json["payer"].nil?
            payer = nil
          else
            payer = parsed_json["payer"].to_json
            payer = Payers::V3::Payer.from_json(json_object: payer)
          end
          amount_cents = struct.amount_cents
          refund_timestamp = unless parsed_json["refund_timestamp"].nil?
                               DateTime.parse(parsed_json["refund_timestamp"])
                             end
          refund_note = struct.refund_note
          allocations = parsed_json["allocations"]&.map do |v|
            v = v.to_json
            Financials::Allocation.from_json(json_object: v)
          end
          refund_reason = struct.refund_reason
          new(insurance_refund_id: insurance_refund_id, payer: payer, amount_cents: amount_cents,
              refund_timestamp: refund_timestamp, refund_note: refund_note, allocations: allocations, refund_reason: refund_reason, additional_properties: struct)
        end

        # Serialize an instance of InsuranceRefund to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "insurance_refund_id": @insurance_refund_id,
            "payer": @payer,
            "amount_cents": @amount_cents,
            "refund_timestamp": @refund_timestamp,
            "refund_note": @refund_note,
            "allocations": @allocations,
            "refund_reason": @refund_reason
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.insurance_refund_id.is_a?(UUID) != false || raise("Passed value for field obj.insurance_refund_id is not the expected type, validation failed.")
          Payers::V3::Payer.validate_raw(obj: obj.payer)
          obj.amount_cents.is_a?(Integer) != false || raise("Passed value for field obj.amount_cents is not the expected type, validation failed.")
          obj.refund_timestamp&.is_a?(DateTime) != false || raise("Passed value for field obj.refund_timestamp is not the expected type, validation failed.")
          obj.refund_note&.is_a?(String) != false || raise("Passed value for field obj.refund_note is not the expected type, validation failed.")
          obj.allocations.is_a?(Array) != false || raise("Passed value for field obj.allocations is not the expected type, validation failed.")
          obj.refund_reason&.is_a?(Financials::RefundReason) != false || raise("Passed value for field obj.refund_reason is not the expected type, validation failed.")
        end
      end
    end
  end
end
