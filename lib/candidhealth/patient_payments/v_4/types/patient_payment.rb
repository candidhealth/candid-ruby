# frozen_string_literal: true

require_relative "patient_payment_id"
require_relative "../../../commons/types/organization_id"
require_relative "../../../financials/types/patient_transaction_source"
require_relative "../../../commons/types/patient_external_id"
require "date"
require_relative "../../../financials/types/allocation"
require_relative "../../../commons/types/invoice_id"
require "json"

module CandidApiClient
  module PatientPayments
    module V4
      class PatientPayment
        attr_reader :patient_payment_id, :organization_id, :source_internal_id, :payment_source, :amount_cents,
                    :patient_external_id, :payment_timestamp, :payment_note, :allocations, :invoice, :additional_properties

        # @param patient_payment_id [PatientPayments::V4::PATIENT_PAYMENT_ID]
        # @param organization_id [Commons::ORGANIZATION_ID]
        # @param source_internal_id [String]
        # @param payment_source [Financials::PatientTransactionSource]
        # @param amount_cents [Integer]
        # @param patient_external_id [Commons::PATIENT_EXTERNAL_ID]
        # @param payment_timestamp [DateTime]
        # @param payment_note [String]
        # @param allocations [Array<Financials::Allocation>]
        # @param invoice [Commons::INVOICE_ID]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [PatientPayments::V4::PatientPayment]
        def initialize(patient_payment_id:, organization_id:, payment_source:, amount_cents:, patient_external_id:,
                       allocations:, source_internal_id: nil, payment_timestamp: nil, payment_note: nil, invoice: nil, additional_properties: nil)
          # @type [PatientPayments::V4::PATIENT_PAYMENT_ID]
          @patient_payment_id = patient_payment_id
          # @type [Commons::ORGANIZATION_ID]
          @organization_id = organization_id
          # @type [String]
          @source_internal_id = source_internal_id
          # @type [Financials::PatientTransactionSource]
          @payment_source = payment_source
          # @type [Integer]
          @amount_cents = amount_cents
          # @type [Commons::PATIENT_EXTERNAL_ID]
          @patient_external_id = patient_external_id
          # @type [DateTime]
          @payment_timestamp = payment_timestamp
          # @type [String]
          @payment_note = payment_note
          # @type [Array<Financials::Allocation>]
          @allocations = allocations
          # @type [Commons::INVOICE_ID]
          @invoice = invoice
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of PatientPayment
        #
        # @param json_object [JSON]
        # @return [PatientPayments::V4::PatientPayment]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          patient_payment_id = struct.patient_payment_id
          organization_id = struct.organization_id
          source_internal_id = struct.source_internal_id
          payment_source = struct.payment_source
          amount_cents = struct.amount_cents
          patient_external_id = struct.patient_external_id
          payment_timestamp = unless parsed_json["payment_timestamp"].nil?
                                DateTime.parse(parsed_json["payment_timestamp"])
                              end
          payment_note = struct.payment_note
          allocations = parsed_json["allocations"]&.map do |v|
            v = v.to_json
            Financials::Allocation.from_json(json_object: v)
          end
          invoice = struct.invoice
          new(patient_payment_id: patient_payment_id, organization_id: organization_id,
              source_internal_id: source_internal_id, payment_source: payment_source, amount_cents: amount_cents, patient_external_id: patient_external_id, payment_timestamp: payment_timestamp, payment_note: payment_note, allocations: allocations, invoice: invoice, additional_properties: struct)
        end

        # Serialize an instance of PatientPayment to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "patient_payment_id": @patient_payment_id,
            "organization_id": @organization_id,
            "source_internal_id": @source_internal_id,
            "payment_source": @payment_source,
            "amount_cents": @amount_cents,
            "patient_external_id": @patient_external_id,
            "payment_timestamp": @payment_timestamp,
            "payment_note": @payment_note,
            "allocations": @allocations,
            "invoice": @invoice
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.patient_payment_id.is_a?(String) != false || raise("Passed value for field obj.patient_payment_id is not the expected type, validation failed.")
          obj.organization_id.is_a?(String) != false || raise("Passed value for field obj.organization_id is not the expected type, validation failed.")
          obj.source_internal_id&.is_a?(String) != false || raise("Passed value for field obj.source_internal_id is not the expected type, validation failed.")
          obj.payment_source.is_a?(Financials::PatientTransactionSource) != false || raise("Passed value for field obj.payment_source is not the expected type, validation failed.")
          obj.amount_cents.is_a?(Integer) != false || raise("Passed value for field obj.amount_cents is not the expected type, validation failed.")
          obj.patient_external_id.is_a?(String) != false || raise("Passed value for field obj.patient_external_id is not the expected type, validation failed.")
          obj.payment_timestamp&.is_a?(DateTime) != false || raise("Passed value for field obj.payment_timestamp is not the expected type, validation failed.")
          obj.payment_note&.is_a?(String) != false || raise("Passed value for field obj.payment_note is not the expected type, validation failed.")
          obj.allocations.is_a?(Array) != false || raise("Passed value for field obj.allocations is not the expected type, validation failed.")
          obj.invoice&.is_a?(String) != false || raise("Passed value for field obj.invoice is not the expected type, validation failed.")
        end
      end
    end
  end
end
