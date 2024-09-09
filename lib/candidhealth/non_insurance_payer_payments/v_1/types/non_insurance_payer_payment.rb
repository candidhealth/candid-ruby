# frozen_string_literal: true

require_relative "../../../non_insurance_payers/v_1/types/non_insurance_payer"
require "date"
require_relative "../../../financials/types/allocation"
require "ostruct"
require "json"

module CandidApiClient
  module NonInsurancePayerPayments
    module V1
      module Types
        class NonInsurancePayerPayment
          # @return [String]
          attr_reader :non_insurance_payer_payment_id
          # @return [CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayer]
          attr_reader :non_insurance_payer
          # @return [Integer]
          attr_reader :amount_cents
          # @return [String]
          attr_reader :check_number
          # @return [DateTime]
          attr_reader :payment_timestamp
          # @return [String]
          attr_reader :payment_note
          # @return [Array<CandidApiClient::Financials::Types::Allocation>]
          attr_reader :allocations
          # @return [String]
          attr_reader :invoice_id
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param non_insurance_payer_payment_id [String]
          # @param non_insurance_payer [CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayer]
          # @param amount_cents [Integer]
          # @param check_number [String]
          # @param payment_timestamp [DateTime]
          # @param payment_note [String]
          # @param allocations [Array<CandidApiClient::Financials::Types::Allocation>]
          # @param invoice_id [String]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::NonInsurancePayerPayments::V1::Types::NonInsurancePayerPayment]
          def initialize(non_insurance_payer_payment_id:, non_insurance_payer:, amount_cents:, allocations:, check_number: OMIT,
                         payment_timestamp: OMIT, payment_note: OMIT, invoice_id: OMIT, additional_properties: nil)
            @non_insurance_payer_payment_id = non_insurance_payer_payment_id
            @non_insurance_payer = non_insurance_payer
            @amount_cents = amount_cents
            @check_number = check_number if check_number != OMIT
            @payment_timestamp = payment_timestamp if payment_timestamp != OMIT
            @payment_note = payment_note if payment_note != OMIT
            @allocations = allocations
            @invoice_id = invoice_id if invoice_id != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "non_insurance_payer_payment_id": non_insurance_payer_payment_id,
              "non_insurance_payer": non_insurance_payer,
              "amount_cents": amount_cents,
              "check_number": check_number,
              "payment_timestamp": payment_timestamp,
              "payment_note": payment_note,
              "allocations": allocations,
              "invoice_id": invoice_id
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of NonInsurancePayerPayment
          #
          # @param json_object [String]
          # @return [CandidApiClient::NonInsurancePayerPayments::V1::Types::NonInsurancePayerPayment]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            non_insurance_payer_payment_id = struct["non_insurance_payer_payment_id"]
            if parsed_json["non_insurance_payer"].nil?
              non_insurance_payer = nil
            else
              non_insurance_payer = parsed_json["non_insurance_payer"].to_json
              non_insurance_payer = CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayer.from_json(json_object: non_insurance_payer)
            end
            amount_cents = struct["amount_cents"]
            check_number = struct["check_number"]
            payment_timestamp = unless parsed_json["payment_timestamp"].nil?
                                  DateTime.parse(parsed_json["payment_timestamp"])
                                end
            payment_note = struct["payment_note"]
            allocations = parsed_json["allocations"]&.map do |item|
              item = item.to_json
              CandidApiClient::Financials::Types::Allocation.from_json(json_object: item)
            end
            invoice_id = struct["invoice_id"]
            new(
              non_insurance_payer_payment_id: non_insurance_payer_payment_id,
              non_insurance_payer: non_insurance_payer,
              amount_cents: amount_cents,
              check_number: check_number,
              payment_timestamp: payment_timestamp,
              payment_note: payment_note,
              allocations: allocations,
              invoice_id: invoice_id,
              additional_properties: struct
            )
          end

          # Serialize an instance of NonInsurancePayerPayment to a JSON object
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
            obj.non_insurance_payer_payment_id.is_a?(String) != false || raise("Passed value for field obj.non_insurance_payer_payment_id is not the expected type, validation failed.")
            CandidApiClient::NonInsurancePayers::V1::Types::NonInsurancePayer.validate_raw(obj: obj.non_insurance_payer)
            obj.amount_cents.is_a?(Integer) != false || raise("Passed value for field obj.amount_cents is not the expected type, validation failed.")
            obj.check_number&.is_a?(String) != false || raise("Passed value for field obj.check_number is not the expected type, validation failed.")
            obj.payment_timestamp&.is_a?(DateTime) != false || raise("Passed value for field obj.payment_timestamp is not the expected type, validation failed.")
            obj.payment_note&.is_a?(String) != false || raise("Passed value for field obj.payment_note is not the expected type, validation failed.")
            obj.allocations.is_a?(Array) != false || raise("Passed value for field obj.allocations is not the expected type, validation failed.")
            obj.invoice_id&.is_a?(String) != false || raise("Passed value for field obj.invoice_id is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
