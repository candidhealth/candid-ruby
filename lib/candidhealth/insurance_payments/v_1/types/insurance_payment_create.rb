# frozen_string_literal: true

require_relative "../../../payers/v_3/types/payer_identifier"
require "date"
require_relative "../../../financials/types/allocation_create"
require "ostruct"
require "json"

module CandidApiClient
  module InsurancePayments
    module V1
      module Types
        class InsurancePaymentCreate
          # @return [CandidApiClient::Payers::V3::Types::PayerIdentifier]
          attr_reader :payer_identifier
          # @return [Integer]
          attr_reader :amount_cents
          # @return [DateTime]
          attr_reader :payment_timestamp
          # @return [String]
          attr_reader :payment_note
          # @return [Array<CandidApiClient::Financials::Types::AllocationCreate>]
          attr_reader :allocations
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param payer_identifier [CandidApiClient::Payers::V3::Types::PayerIdentifier]
          # @param amount_cents [Integer]
          # @param payment_timestamp [DateTime]
          # @param payment_note [String]
          # @param allocations [Array<CandidApiClient::Financials::Types::AllocationCreate>]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::InsurancePayments::V1::Types::InsurancePaymentCreate]
          def initialize(payer_identifier:, amount_cents:, allocations:, payment_timestamp: OMIT, payment_note: OMIT,
                         additional_properties: nil)
            @payer_identifier = payer_identifier
            @amount_cents = amount_cents
            @payment_timestamp = payment_timestamp if payment_timestamp != OMIT
            @payment_note = payment_note if payment_note != OMIT
            @allocations = allocations
            @additional_properties = additional_properties
            @_field_set = {
              "payer_identifier": payer_identifier,
              "amount_cents": amount_cents,
              "payment_timestamp": payment_timestamp,
              "payment_note": payment_note,
              "allocations": allocations
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of InsurancePaymentCreate
          #
          # @param json_object [String]
          # @return [CandidApiClient::InsurancePayments::V1::Types::InsurancePaymentCreate]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            if parsed_json["payer_identifier"].nil?
              payer_identifier = nil
            else
              payer_identifier = parsed_json["payer_identifier"].to_json
              payer_identifier = CandidApiClient::Payers::V3::Types::PayerIdentifier.from_json(json_object: payer_identifier)
            end
            amount_cents = struct["amount_cents"]
            payment_timestamp = unless parsed_json["payment_timestamp"].nil?
                                  DateTime.parse(parsed_json["payment_timestamp"])
                                end
            payment_note = struct["payment_note"]
            allocations = parsed_json["allocations"]&.map do |item|
              item = item.to_json
              CandidApiClient::Financials::Types::AllocationCreate.from_json(json_object: item)
            end
            new(
              payer_identifier: payer_identifier,
              amount_cents: amount_cents,
              payment_timestamp: payment_timestamp,
              payment_note: payment_note,
              allocations: allocations,
              additional_properties: struct
            )
          end

          # Serialize an instance of InsurancePaymentCreate to a JSON object
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
            CandidApiClient::Payers::V3::Types::PayerIdentifier.validate_raw(obj: obj.payer_identifier)
            obj.amount_cents.is_a?(Integer) != false || raise("Passed value for field obj.amount_cents is not the expected type, validation failed.")
            obj.payment_timestamp&.is_a?(DateTime) != false || raise("Passed value for field obj.payment_timestamp is not the expected type, validation failed.")
            obj.payment_note&.is_a?(String) != false || raise("Passed value for field obj.payment_note is not the expected type, validation failed.")
            obj.allocations.is_a?(Array) != false || raise("Passed value for field obj.allocations is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
