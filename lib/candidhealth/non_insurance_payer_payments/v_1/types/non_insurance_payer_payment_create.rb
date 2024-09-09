# frozen_string_literal: true

require "date"
require_relative "../../../financials/types/allocation_create"
require "ostruct"
require "json"

module CandidApiClient
  module NonInsurancePayerPayments
    module V1
      module Types
        class NonInsurancePayerPaymentCreate
          # @return [String]
          attr_reader :non_insurance_payer_id
          # @return [Integer]
          attr_reader :amount_cents
          # @return [DateTime]
          attr_reader :payment_timestamp
          # @return [String]
          attr_reader :payment_note
          # @return [String]
          attr_reader :check_number
          # @return [Array<CandidApiClient::Financials::Types::AllocationCreate>]
          attr_reader :allocations
          # @return [String]
          attr_reader :invoice_id
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param non_insurance_payer_id [String]
          # @param amount_cents [Integer]
          # @param payment_timestamp [DateTime]
          # @param payment_note [String]
          # @param check_number [String]
          # @param allocations [Array<CandidApiClient::Financials::Types::AllocationCreate>]
          # @param invoice_id [String]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::NonInsurancePayerPayments::V1::Types::NonInsurancePayerPaymentCreate]
          def initialize(non_insurance_payer_id:, amount_cents:, allocations:, payment_timestamp: OMIT, payment_note: OMIT,
                         check_number: OMIT, invoice_id: OMIT, additional_properties: nil)
            @non_insurance_payer_id = non_insurance_payer_id
            @amount_cents = amount_cents
            @payment_timestamp = payment_timestamp if payment_timestamp != OMIT
            @payment_note = payment_note if payment_note != OMIT
            @check_number = check_number if check_number != OMIT
            @allocations = allocations
            @invoice_id = invoice_id if invoice_id != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "non_insurance_payer_id": non_insurance_payer_id,
              "amount_cents": amount_cents,
              "payment_timestamp": payment_timestamp,
              "payment_note": payment_note,
              "check_number": check_number,
              "allocations": allocations,
              "invoice_id": invoice_id
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of NonInsurancePayerPaymentCreate
          #
          # @param json_object [String]
          # @return [CandidApiClient::NonInsurancePayerPayments::V1::Types::NonInsurancePayerPaymentCreate]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            non_insurance_payer_id = struct["non_insurance_payer_id"]
            amount_cents = struct["amount_cents"]
            payment_timestamp = unless parsed_json["payment_timestamp"].nil?
                                  DateTime.parse(parsed_json["payment_timestamp"])
                                end
            payment_note = struct["payment_note"]
            check_number = struct["check_number"]
            allocations = parsed_json["allocations"]&.map do |item|
              item = item.to_json
              CandidApiClient::Financials::Types::AllocationCreate.from_json(json_object: item)
            end
            invoice_id = struct["invoice_id"]
            new(
              non_insurance_payer_id: non_insurance_payer_id,
              amount_cents: amount_cents,
              payment_timestamp: payment_timestamp,
              payment_note: payment_note,
              check_number: check_number,
              allocations: allocations,
              invoice_id: invoice_id,
              additional_properties: struct
            )
          end

          # Serialize an instance of NonInsurancePayerPaymentCreate to a JSON object
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
            obj.amount_cents.is_a?(Integer) != false || raise("Passed value for field obj.amount_cents is not the expected type, validation failed.")
            obj.payment_timestamp&.is_a?(DateTime) != false || raise("Passed value for field obj.payment_timestamp is not the expected type, validation failed.")
            obj.payment_note&.is_a?(String) != false || raise("Passed value for field obj.payment_note is not the expected type, validation failed.")
            obj.check_number&.is_a?(String) != false || raise("Passed value for field obj.check_number is not the expected type, validation failed.")
            obj.allocations.is_a?(Array) != false || raise("Passed value for field obj.allocations is not the expected type, validation failed.")
            obj.invoice_id&.is_a?(String) != false || raise("Passed value for field obj.invoice_id is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
