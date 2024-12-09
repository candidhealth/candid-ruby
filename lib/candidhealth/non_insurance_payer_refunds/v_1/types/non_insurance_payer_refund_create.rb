# frozen_string_literal: true

require "date"
require_relative "../../../financials/types/allocation_create"
require_relative "../../../financials/types/refund_reason"
require "ostruct"
require "json"

module CandidApiClient
  module NonInsurancePayerRefunds
    module V1
      module Types
        class NonInsurancePayerRefundCreate
          # @return [String]
          attr_reader :non_insurance_payer_id
          # @return [String]
          attr_reader :invoice_id
          # @return [Integer]
          attr_reader :amount_cents
          # @return [DateTime]
          attr_reader :refund_timestamp
          # @return [String]
          attr_reader :refund_note
          # @return [String]
          attr_reader :check_number
          # @return [Array<CandidApiClient::Financials::Types::AllocationCreate>]
          attr_reader :allocations
          # @return [CandidApiClient::Financials::Types::RefundReason]
          attr_reader :refund_reason
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param non_insurance_payer_id [String]
          # @param invoice_id [String]
          # @param amount_cents [Integer]
          # @param refund_timestamp [DateTime]
          # @param refund_note [String]
          # @param check_number [String]
          # @param allocations [Array<CandidApiClient::Financials::Types::AllocationCreate>]
          # @param refund_reason [CandidApiClient::Financials::Types::RefundReason]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefundCreate]
          def initialize(non_insurance_payer_id:, amount_cents:, allocations:, invoice_id: OMIT, refund_timestamp: OMIT,
                         refund_note: OMIT, check_number: OMIT, refund_reason: OMIT, additional_properties: nil)
            @non_insurance_payer_id = non_insurance_payer_id
            @invoice_id = invoice_id if invoice_id != OMIT
            @amount_cents = amount_cents
            @refund_timestamp = refund_timestamp if refund_timestamp != OMIT
            @refund_note = refund_note if refund_note != OMIT
            @check_number = check_number if check_number != OMIT
            @allocations = allocations
            @refund_reason = refund_reason if refund_reason != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "non_insurance_payer_id": non_insurance_payer_id,
              "invoice_id": invoice_id,
              "amount_cents": amount_cents,
              "refund_timestamp": refund_timestamp,
              "refund_note": refund_note,
              "check_number": check_number,
              "allocations": allocations,
              "refund_reason": refund_reason
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of NonInsurancePayerRefundCreate
          #
          # @param json_object [String]
          # @return [CandidApiClient::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefundCreate]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            non_insurance_payer_id = struct["non_insurance_payer_id"]
            invoice_id = struct["invoice_id"]
            amount_cents = struct["amount_cents"]
            refund_timestamp = unless parsed_json["refund_timestamp"].nil?
                                 DateTime.parse(parsed_json["refund_timestamp"])
                               end
            refund_note = struct["refund_note"]
            check_number = struct["check_number"]
            allocations = parsed_json["allocations"]&.map do |item|
              item = item.to_json
              CandidApiClient::Financials::Types::AllocationCreate.from_json(json_object: item)
            end
            refund_reason = struct["refund_reason"]
            new(
              non_insurance_payer_id: non_insurance_payer_id,
              invoice_id: invoice_id,
              amount_cents: amount_cents,
              refund_timestamp: refund_timestamp,
              refund_note: refund_note,
              check_number: check_number,
              allocations: allocations,
              refund_reason: refund_reason,
              additional_properties: struct
            )
          end

          # Serialize an instance of NonInsurancePayerRefundCreate to a JSON object
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
            obj.non_insurance_payer_id.is_a?(String) != false || raise("Passed value for field obj.non_insurance_payer_id is not the expected type, validation failed.")
            obj.invoice_id&.is_a?(String) != false || raise("Passed value for field obj.invoice_id is not the expected type, validation failed.")
            obj.amount_cents.is_a?(Integer) != false || raise("Passed value for field obj.amount_cents is not the expected type, validation failed.")
            obj.refund_timestamp&.is_a?(DateTime) != false || raise("Passed value for field obj.refund_timestamp is not the expected type, validation failed.")
            obj.refund_note&.is_a?(String) != false || raise("Passed value for field obj.refund_note is not the expected type, validation failed.")
            obj.check_number&.is_a?(String) != false || raise("Passed value for field obj.check_number is not the expected type, validation failed.")
            obj.allocations.is_a?(Array) != false || raise("Passed value for field obj.allocations is not the expected type, validation failed.")
            obj.refund_reason&.is_a?(CandidApiClient::Financials::Types::RefundReason) != false || raise("Passed value for field obj.refund_reason is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
