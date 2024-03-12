# frozen_string_literal: true

require_relative "../../../payers/v_3/types/payer_identifier"
require "date"
require_relative "../../../financials/types/allocation_create"
require "json"

module CandidApiClient
  module InsurancePayments
    module V1
      class InsurancePaymentCreate
        attr_reader :payer_identifier, :amount_cents, :payment_timestamp, :payment_note, :allocations,
                    :additional_properties

        # @param payer_identifier [Payers::V3::PayerIdentifier]
        # @param amount_cents [Integer]
        # @param payment_timestamp [DateTime]
        # @param payment_note [String]
        # @param allocations [Array<Financials::AllocationCreate>]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [InsurancePayments::V1::InsurancePaymentCreate]
        def initialize(payer_identifier:, amount_cents:, allocations:, payment_timestamp: nil, payment_note: nil,
                       additional_properties: nil)
          # @type [Payers::V3::PayerIdentifier]
          @payer_identifier = payer_identifier
          # @type [Integer]
          @amount_cents = amount_cents
          # @type [DateTime]
          @payment_timestamp = payment_timestamp
          # @type [String]
          @payment_note = payment_note
          # @type [Array<Financials::AllocationCreate>]
          @allocations = allocations
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of InsurancePaymentCreate
        #
        # @param json_object [JSON]
        # @return [InsurancePayments::V1::InsurancePaymentCreate]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          if parsed_json["payer_identifier"].nil?
            payer_identifier = nil
          else
            payer_identifier = parsed_json["payer_identifier"].to_json
            payer_identifier = Payers::V3::PayerIdentifier.from_json(json_object: payer_identifier)
          end
          amount_cents = struct.amount_cents
          payment_timestamp = unless parsed_json["payment_timestamp"].nil?
                                DateTime.parse(parsed_json["payment_timestamp"])
                              end
          payment_note = struct.payment_note
          allocations = parsed_json["allocations"]&.map do |v|
            v = v.to_json
            Financials::AllocationCreate.from_json(json_object: v)
          end
          new(payer_identifier: payer_identifier, amount_cents: amount_cents, payment_timestamp: payment_timestamp,
              payment_note: payment_note, allocations: allocations, additional_properties: struct)
        end

        # Serialize an instance of InsurancePaymentCreate to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "payer_identifier": @payer_identifier,
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
          Payers::V3::PayerIdentifier.validate_raw(obj: obj.payer_identifier)
          obj.amount_cents.is_a?(Integer) != false || raise("Passed value for field obj.amount_cents is not the expected type, validation failed.")
          obj.payment_timestamp&.is_a?(DateTime) != false || raise("Passed value for field obj.payment_timestamp is not the expected type, validation failed.")
          obj.payment_note&.is_a?(String) != false || raise("Passed value for field obj.payment_note is not the expected type, validation failed.")
          obj.allocations.is_a?(Array) != false || raise("Passed value for field obj.allocations is not the expected type, validation failed.")
        end
      end
    end
  end
end
