# frozen_string_literal: true

require_relative "../../../financials/types/patient_transaction_source"
require "date"
require_relative "../../../financials/types/allocation"
require_relative "../../../financials/types/refund_reason"
require "ostruct"
require "json"

module CandidApiClient
  module PatientRefunds
    module V1
      module Types
        class PatientRefund
          # @return [String]
          attr_reader :patient_refund_id
          # @return [String]
          attr_reader :organization_id
          # @return [String]
          attr_reader :source_internal_id
          # @return [CandidApiClient::Financials::Types::PatientTransactionSource]
          attr_reader :refund_source
          # @return [Integer]
          attr_reader :amount_cents
          # @return [String]
          attr_reader :patient_external_id
          # @return [DateTime]
          attr_reader :refund_timestamp
          # @return [String]
          attr_reader :refund_note
          # @return [Array<CandidApiClient::Financials::Types::Allocation>]
          attr_reader :allocations
          # @return [String]
          attr_reader :invoice
          # @return [CandidApiClient::Financials::Types::RefundReason]
          attr_reader :refund_reason
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param patient_refund_id [String]
          # @param organization_id [String]
          # @param source_internal_id [String]
          # @param refund_source [CandidApiClient::Financials::Types::PatientTransactionSource]
          # @param amount_cents [Integer]
          # @param patient_external_id [String]
          # @param refund_timestamp [DateTime]
          # @param refund_note [String]
          # @param allocations [Array<CandidApiClient::Financials::Types::Allocation>]
          # @param invoice [String]
          # @param refund_reason [CandidApiClient::Financials::Types::RefundReason]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::PatientRefunds::V1::Types::PatientRefund]
          def initialize(patient_refund_id:, organization_id:, refund_source:, amount_cents:, patient_external_id:,
                         allocations:, source_internal_id: OMIT, refund_timestamp: OMIT, refund_note: OMIT, invoice: OMIT, refund_reason: OMIT, additional_properties: nil)
            @patient_refund_id = patient_refund_id
            @organization_id = organization_id
            @source_internal_id = source_internal_id if source_internal_id != OMIT
            @refund_source = refund_source
            @amount_cents = amount_cents
            @patient_external_id = patient_external_id
            @refund_timestamp = refund_timestamp if refund_timestamp != OMIT
            @refund_note = refund_note if refund_note != OMIT
            @allocations = allocations
            @invoice = invoice if invoice != OMIT
            @refund_reason = refund_reason if refund_reason != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "patient_refund_id": patient_refund_id,
              "organization_id": organization_id,
              "source_internal_id": source_internal_id,
              "refund_source": refund_source,
              "amount_cents": amount_cents,
              "patient_external_id": patient_external_id,
              "refund_timestamp": refund_timestamp,
              "refund_note": refund_note,
              "allocations": allocations,
              "invoice": invoice,
              "refund_reason": refund_reason
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of PatientRefund
          #
          # @param json_object [String]
          # @return [CandidApiClient::PatientRefunds::V1::Types::PatientRefund]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            patient_refund_id = struct["patient_refund_id"]
            organization_id = struct["organization_id"]
            source_internal_id = struct["source_internal_id"]
            refund_source = struct["refund_source"]
            amount_cents = struct["amount_cents"]
            patient_external_id = struct["patient_external_id"]
            refund_timestamp = unless parsed_json["refund_timestamp"].nil?
                                 DateTime.parse(parsed_json["refund_timestamp"])
                               end
            refund_note = struct["refund_note"]
            allocations = parsed_json["allocations"]&.map do |item|
              item = item.to_json
              CandidApiClient::Financials::Types::Allocation.from_json(json_object: item)
            end
            invoice = struct["invoice"]
            refund_reason = struct["refund_reason"]
            new(
              patient_refund_id: patient_refund_id,
              organization_id: organization_id,
              source_internal_id: source_internal_id,
              refund_source: refund_source,
              amount_cents: amount_cents,
              patient_external_id: patient_external_id,
              refund_timestamp: refund_timestamp,
              refund_note: refund_note,
              allocations: allocations,
              invoice: invoice,
              refund_reason: refund_reason,
              additional_properties: struct
            )
          end

          # Serialize an instance of PatientRefund to a JSON object
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
            obj.patient_refund_id.is_a?(String) != false || raise("Passed value for field obj.patient_refund_id is not the expected type, validation failed.")
            obj.organization_id.is_a?(String) != false || raise("Passed value for field obj.organization_id is not the expected type, validation failed.")
            obj.source_internal_id&.is_a?(String) != false || raise("Passed value for field obj.source_internal_id is not the expected type, validation failed.")
            obj.refund_source.is_a?(CandidApiClient::Financials::Types::PatientTransactionSource) != false || raise("Passed value for field obj.refund_source is not the expected type, validation failed.")
            obj.amount_cents.is_a?(Integer) != false || raise("Passed value for field obj.amount_cents is not the expected type, validation failed.")
            obj.patient_external_id.is_a?(String) != false || raise("Passed value for field obj.patient_external_id is not the expected type, validation failed.")
            obj.refund_timestamp&.is_a?(DateTime) != false || raise("Passed value for field obj.refund_timestamp is not the expected type, validation failed.")
            obj.refund_note&.is_a?(String) != false || raise("Passed value for field obj.refund_note is not the expected type, validation failed.")
            obj.allocations.is_a?(Array) != false || raise("Passed value for field obj.allocations is not the expected type, validation failed.")
            obj.invoice&.is_a?(String) != false || raise("Passed value for field obj.invoice is not the expected type, validation failed.")
            obj.refund_reason&.is_a?(CandidApiClient::Financials::Types::RefundReason) != false || raise("Passed value for field obj.refund_reason is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
