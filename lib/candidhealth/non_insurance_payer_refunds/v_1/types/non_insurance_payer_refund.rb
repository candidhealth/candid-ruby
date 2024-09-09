# frozen_string_literal: true

require_relative "../../../non_insurance_payers/v_1/types/non_insurance_payer"
require "date"
require_relative "../../../financials/types/allocation"
require_relative "../../../financials/types/refund_reason"
require "ostruct"
require "json"

module CandidApiClient
  module NonInsurancePayerRefunds
    module V1
      module Types
        class NonInsurancePayerRefund
          # @return [String]
          attr_reader :non_insurance_payer_refund_id
          # @return [CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayer]
          attr_reader :non_insurance_payer
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
          # @return [String]
          attr_reader :invoice_id
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param non_insurance_payer_refund_id [String]
          # @param non_insurance_payer [CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayer]
          # @param amount_cents [Integer]
          # @param refund_timestamp [DateTime]
          # @param refund_note [String]
          # @param allocations [Array<CandidApiClient::Financials::Types::Allocation>]
          # @param refund_reason [CandidApiClient::Financials::Types::RefundReason]
          # @param invoice_id [String]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefund]
          def initialize(non_insurance_payer_refund_id:, non_insurance_payer:, amount_cents:, allocations:, refund_timestamp: OMIT,
                         refund_note: OMIT, refund_reason: OMIT, invoice_id: OMIT, additional_properties: nil)
            @non_insurance_payer_refund_id = non_insurance_payer_refund_id
            @non_insurance_payer = non_insurance_payer
            @amount_cents = amount_cents
            @refund_timestamp = refund_timestamp if refund_timestamp != OMIT
            @refund_note = refund_note if refund_note != OMIT
            @allocations = allocations
            @refund_reason = refund_reason if refund_reason != OMIT
            @invoice_id = invoice_id if invoice_id != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "non_insurance_payer_refund_id": non_insurance_payer_refund_id,
              "non_insurance_payer": non_insurance_payer,
              "amount_cents": amount_cents,
              "refund_timestamp": refund_timestamp,
              "refund_note": refund_note,
              "allocations": allocations,
              "refund_reason": refund_reason,
              "invoice_id": invoice_id
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of NonInsurancePayerRefund
          #
          # @param json_object [String]
          # @return [CandidApiClient::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefund]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            non_insurance_payer_refund_id = struct["non_insurance_payer_refund_id"]
            if parsed_json["non_insurance_payer"].nil?
              non_insurance_payer = nil
            else
              non_insurance_payer = parsed_json["non_insurance_payer"].to_json
              non_insurance_payer = CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayer.from_json(json_object: non_insurance_payer)
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
            invoice_id = struct["invoice_id"]
            new(
              non_insurance_payer_refund_id: non_insurance_payer_refund_id,
              non_insurance_payer: non_insurance_payer,
              amount_cents: amount_cents,
              refund_timestamp: refund_timestamp,
              refund_note: refund_note,
              allocations: allocations,
              refund_reason: refund_reason,
              invoice_id: invoice_id,
              additional_properties: struct
            )
          end

          # Serialize an instance of NonInsurancePayerRefund to a JSON object
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
            obj.non_insurance_payer_refund_id.is_a?(String) != false || raise("Passed value for field obj.non_insurance_payer_refund_id is not the expected type, validation failed.")
            CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayer.validate_raw(obj: obj.non_insurance_payer)
            obj.amount_cents.is_a?(Integer) != false || raise("Passed value for field obj.amount_cents is not the expected type, validation failed.")
            obj.refund_timestamp&.is_a?(DateTime) != false || raise("Passed value for field obj.refund_timestamp is not the expected type, validation failed.")
            obj.refund_note&.is_a?(String) != false || raise("Passed value for field obj.refund_note is not the expected type, validation failed.")
            obj.allocations.is_a?(Array) != false || raise("Passed value for field obj.allocations is not the expected type, validation failed.")
            obj.refund_reason&.is_a?(CandidApiClient::Financials::Types::RefundReason) != false || raise("Passed value for field obj.refund_reason is not the expected type, validation failed.")
            obj.invoice_id&.is_a?(String) != false || raise("Passed value for field obj.invoice_id is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
