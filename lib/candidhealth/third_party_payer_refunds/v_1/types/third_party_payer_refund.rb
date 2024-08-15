# frozen_string_literal: true

require_relative "../../../third_party_payers/v_1/types/third_party_payer"
require "date"
require_relative "../../../financials/types/allocation"
require_relative "../../../financials/types/refund_reason"
require "ostruct"
require "json"

module CandidApiClient
  module ThirdPartyPayerRefunds
    module V1
      module Types
        class ThirdPartyPayerRefund
          # @return [String]
          attr_reader :third_party_payer_refund_id
          # @return [CandidApiClient::ThirdPartyPayers::V1::Types::ThirdPartyPayer]
          attr_reader :third_party_payer
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

          # @param third_party_payer_refund_id [String]
          # @param third_party_payer [CandidApiClient::ThirdPartyPayers::V1::Types::ThirdPartyPayer]
          # @param amount_cents [Integer]
          # @param refund_timestamp [DateTime]
          # @param refund_note [String]
          # @param allocations [Array<CandidApiClient::Financials::Types::Allocation>]
          # @param refund_reason [CandidApiClient::Financials::Types::RefundReason]
          # @param invoice_id [String]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::ThirdPartyPayerRefunds::V1::Types::ThirdPartyPayerRefund]
          def initialize(third_party_payer_refund_id:, third_party_payer:, amount_cents:, allocations:, refund_timestamp: OMIT,
                         refund_note: OMIT, refund_reason: OMIT, invoice_id: OMIT, additional_properties: nil)
            @third_party_payer_refund_id = third_party_payer_refund_id
            @third_party_payer = third_party_payer
            @amount_cents = amount_cents
            @refund_timestamp = refund_timestamp if refund_timestamp != OMIT
            @refund_note = refund_note if refund_note != OMIT
            @allocations = allocations
            @refund_reason = refund_reason if refund_reason != OMIT
            @invoice_id = invoice_id if invoice_id != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "third_party_payer_refund_id": third_party_payer_refund_id,
              "third_party_payer": third_party_payer,
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

          # Deserialize a JSON object to an instance of ThirdPartyPayerRefund
          #
          # @param json_object [String]
          # @return [CandidApiClient::ThirdPartyPayerRefunds::V1::Types::ThirdPartyPayerRefund]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            third_party_payer_refund_id = struct["third_party_payer_refund_id"]
            if parsed_json["third_party_payer"].nil?
              third_party_payer = nil
            else
              third_party_payer = parsed_json["third_party_payer"].to_json
              third_party_payer = CandidApiClient::ThirdPartyPayers::V1::Types::ThirdPartyPayer.from_json(json_object: third_party_payer)
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
              third_party_payer_refund_id: third_party_payer_refund_id,
              third_party_payer: third_party_payer,
              amount_cents: amount_cents,
              refund_timestamp: refund_timestamp,
              refund_note: refund_note,
              allocations: allocations,
              refund_reason: refund_reason,
              invoice_id: invoice_id,
              additional_properties: struct
            )
          end

          # Serialize an instance of ThirdPartyPayerRefund to a JSON object
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
            obj.third_party_payer_refund_id.is_a?(String) != false || raise("Passed value for field obj.third_party_payer_refund_id is not the expected type, validation failed.")
            CandidApiClient::ThirdPartyPayers::V1::Types::ThirdPartyPayer.validate_raw(obj: obj.third_party_payer)
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
