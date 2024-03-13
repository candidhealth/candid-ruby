# frozen_string_literal: true

require_relative "patient_refund_id"
require_relative "../../../commons/types/organization_id"
require_relative "../../../financials/types/patient_transaction_source"
require_relative "../../../commons/types/patient_external_id"
require "date"
require_relative "../../../financials/types/allocation"
require_relative "../../../commons/types/invoice_id"
require_relative "../../../financials/types/refund_reason"
require "json"

module CandidApiClient
  module PatientRefunds
    module V1
      class PatientRefund
        attr_reader :patient_refund_id, :organization_id, :source_internal_id, :refund_source, :amount_cents,
                    :patient_external_id, :refund_timestamp, :refund_note, :allocations, :invoice, :refund_reason, :additional_properties

        # @param patient_refund_id [PatientRefunds::V1::PATIENT_REFUND_ID]
        # @param organization_id [Commons::ORGANIZATION_ID]
        # @param source_internal_id [String]
        # @param refund_source [Financials::PatientTransactionSource]
        # @param amount_cents [Integer]
        # @param patient_external_id [Commons::PATIENT_EXTERNAL_ID]
        # @param refund_timestamp [DateTime]
        # @param refund_note [String]
        # @param allocations [Array<Financials::Allocation>]
        # @param invoice [Commons::INVOICE_ID]
        # @param refund_reason [Financials::RefundReason]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [PatientRefunds::V1::PatientRefund]
        def initialize(patient_refund_id:, organization_id:, refund_source:, amount_cents:, patient_external_id:,
                       allocations:, source_internal_id: nil, refund_timestamp: nil, refund_note: nil, invoice: nil, refund_reason: nil, additional_properties: nil)
          # @type [PatientRefunds::V1::PATIENT_REFUND_ID]
          @patient_refund_id = patient_refund_id
          # @type [Commons::ORGANIZATION_ID]
          @organization_id = organization_id
          # @type [String]
          @source_internal_id = source_internal_id
          # @type [Financials::PatientTransactionSource]
          @refund_source = refund_source
          # @type [Integer]
          @amount_cents = amount_cents
          # @type [Commons::PATIENT_EXTERNAL_ID]
          @patient_external_id = patient_external_id
          # @type [DateTime]
          @refund_timestamp = refund_timestamp
          # @type [String]
          @refund_note = refund_note
          # @type [Array<Financials::Allocation>]
          @allocations = allocations
          # @type [Commons::INVOICE_ID]
          @invoice = invoice
          # @type [Financials::RefundReason]
          @refund_reason = refund_reason
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of PatientRefund
        #
        # @param json_object [JSON]
        # @return [PatientRefunds::V1::PatientRefund]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          patient_refund_id = struct.patient_refund_id
          organization_id = struct.organization_id
          source_internal_id = struct.source_internal_id
          refund_source = struct.refund_source
          amount_cents = struct.amount_cents
          patient_external_id = struct.patient_external_id
          refund_timestamp = unless parsed_json["refund_timestamp"].nil?
                               DateTime.parse(parsed_json["refund_timestamp"])
                             end
          refund_note = struct.refund_note
          allocations = parsed_json["allocations"]&.map do |v|
            v = v.to_json
            Financials::Allocation.from_json(json_object: v)
          end
          invoice = struct.invoice
          refund_reason = struct.refund_reason
          new(patient_refund_id: patient_refund_id, organization_id: organization_id,
              source_internal_id: source_internal_id, refund_source: refund_source, amount_cents: amount_cents, patient_external_id: patient_external_id, refund_timestamp: refund_timestamp, refund_note: refund_note, allocations: allocations, invoice: invoice, refund_reason: refund_reason, additional_properties: struct)
        end

        # Serialize an instance of PatientRefund to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "patient_refund_id": @patient_refund_id,
            "organization_id": @organization_id,
            "source_internal_id": @source_internal_id,
            "refund_source": @refund_source,
            "amount_cents": @amount_cents,
            "patient_external_id": @patient_external_id,
            "refund_timestamp": @refund_timestamp,
            "refund_note": @refund_note,
            "allocations": @allocations,
            "invoice": @invoice,
            "refund_reason": @refund_reason
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.patient_refund_id.is_a?(UUID) != false || raise("Passed value for field obj.patient_refund_id is not the expected type, validation failed.")
          obj.organization_id.is_a?(UUID) != false || raise("Passed value for field obj.organization_id is not the expected type, validation failed.")
          obj.source_internal_id&.is_a?(String) != false || raise("Passed value for field obj.source_internal_id is not the expected type, validation failed.")
          obj.refund_source.is_a?(Financials::PatientTransactionSource) != false || raise("Passed value for field obj.refund_source is not the expected type, validation failed.")
          obj.amount_cents.is_a?(Integer) != false || raise("Passed value for field obj.amount_cents is not the expected type, validation failed.")
          obj.patient_external_id.is_a?(String) != false || raise("Passed value for field obj.patient_external_id is not the expected type, validation failed.")
          obj.refund_timestamp&.is_a?(DateTime) != false || raise("Passed value for field obj.refund_timestamp is not the expected type, validation failed.")
          obj.refund_note&.is_a?(String) != false || raise("Passed value for field obj.refund_note is not the expected type, validation failed.")
          obj.allocations.is_a?(Array) != false || raise("Passed value for field obj.allocations is not the expected type, validation failed.")
          obj.invoice&.is_a?(UUID) != false || raise("Passed value for field obj.invoice is not the expected type, validation failed.")
          obj.refund_reason&.is_a?(Financials::RefundReason) != false || raise("Passed value for field obj.refund_reason is not the expected type, validation failed.")
        end
      end
    end
  end
end
