# frozen_string_literal: true

require_relative "insurance_payment_id"
require_relative "../../../payers/v_3/types/payer"
require "date"
require_relative "../../../financials/types/allocation"
require "json"

module CandidApiClient
  module InsurancePayments
    module V1
      class InsurancePayment
        attr_reader :insurance_payment_id, :payer, :amount_cents, :payment_timestamp, :payment_note, :allocations,
                    :additional_properties

        # @param insurance_payment_id [InsurancePayments::V1::INSURANCE_PAYMENT_ID]
        # @param payer [Payers::V3::Payer]
        # @param amount_cents [Integer]
        # @param payment_timestamp [DateTime]
        # @param payment_note [String]
        # @param allocations [Array<Financials::Allocation>]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [InsurancePayments::V1::InsurancePayment]
        def initialize(insurance_payment_id:, payer:, amount_cents:, allocations:, payment_timestamp: nil,
                       payment_note: nil, additional_properties: nil)
          # @type [InsurancePayments::V1::INSURANCE_PAYMENT_ID]
          @insurance_payment_id = insurance_payment_id
          # @type [Payers::V3::Payer]
          @payer = payer
          # @type [Integer]
          @amount_cents = amount_cents
          # @type [DateTime]
          @payment_timestamp = payment_timestamp
          # @type [String]
          @payment_note = payment_note
          # @type [Array<Financials::Allocation>]
          @allocations = allocations
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of InsurancePayment
        #
        # @param json_object [JSON]
        # @return [InsurancePayments::V1::InsurancePayment]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          insurance_payment_id = struct.insurance_payment_id
          if parsed_json["payer"].nil?
            payer = nil
          else
            payer = parsed_json["payer"].to_json
            payer = Payers::V3::Payer.from_json(json_object: payer)
          end
          amount_cents = struct.amount_cents
          payment_timestamp = unless parsed_json["payment_timestamp"].nil?
                                DateTime.parse(parsed_json["payment_timestamp"])
                              end
          payment_note = struct.payment_note
          allocations = parsed_json["allocations"]&.map do |v|
            v = v.to_json
            Financials::Allocation.from_json(json_object: v)
          end
          new(insurance_payment_id: insurance_payment_id, payer: payer, amount_cents: amount_cents,
              payment_timestamp: payment_timestamp, payment_note: payment_note, allocations: allocations, additional_properties: struct)
        end

        # Serialize an instance of InsurancePayment to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "insurance_payment_id": @insurance_payment_id,
            "payer": @payer,
            "amount_cents": @amount_cents,
            "payment_timestamp": @payment_timestamp,
            "payment_note": @payment_note,
            "allocations": @allocations
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.insurance_payment_id.is_a?(UUID) != false || raise("Passed value for field obj.insurance_payment_id is not the expected type, validation failed.")
          Payers::V3::Payer.validate_raw(obj: obj.payer)
          obj.amount_cents.is_a?(Integer) != false || raise("Passed value for field obj.amount_cents is not the expected type, validation failed.")
          obj.payment_timestamp&.is_a?(DateTime) != false || raise("Passed value for field obj.payment_timestamp is not the expected type, validation failed.")
          obj.payment_note&.is_a?(String) != false || raise("Passed value for field obj.payment_note is not the expected type, validation failed.")
          obj.allocations.is_a?(Array) != false || raise("Passed value for field obj.allocations is not the expected type, validation failed.")
        end
      end
    end
  end
end
