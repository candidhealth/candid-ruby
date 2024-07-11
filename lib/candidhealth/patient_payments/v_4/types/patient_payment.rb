# frozen_string_literal: true

require_relative "../../../financials/types/patient_transaction_source"
require "date"
require_relative "../../../financials/types/allocation"
require "ostruct"
require "json"

module CandidApiClient
  module PatientPayments
    module V4
      module Types
        class PatientPayment
          # @return [String]
          attr_reader :patient_payment_id
          # @return [String]
          attr_reader :organization_id
          # @return [String]
          attr_reader :source_internal_id
          # @return [CandidApiClient::Financials::Types::PatientTransactionSource]
          attr_reader :payment_source
          # @return [Integer]
          attr_reader :amount_cents
          # @return [String]
          attr_reader :patient_external_id
          # @return [DateTime]
          attr_reader :payment_timestamp
          # @return [String]
          attr_reader :payment_note
          # @return [Array<CandidApiClient::Financials::Types::Allocation>]
          attr_reader :allocations
          # @return [String]
          attr_reader :invoice
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param patient_payment_id [String]
          # @param organization_id [String]
          # @param source_internal_id [String]
          # @param payment_source [CandidApiClient::Financials::Types::PatientTransactionSource]
          # @param amount_cents [Integer]
          # @param patient_external_id [String]
          # @param payment_timestamp [DateTime]
          # @param payment_note [String]
          # @param allocations [Array<CandidApiClient::Financials::Types::Allocation>]
          # @param invoice [String]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::PatientPayments::V4::Types::PatientPayment]
          def initialize(patient_payment_id:, organization_id:, payment_source:, amount_cents:, patient_external_id:,
                         allocations:, source_internal_id: OMIT, payment_timestamp: OMIT, payment_note: OMIT, invoice: OMIT, additional_properties: nil)
            @patient_payment_id = patient_payment_id
            @organization_id = organization_id
            @source_internal_id = source_internal_id if source_internal_id != OMIT
            @payment_source = payment_source
            @amount_cents = amount_cents
            @patient_external_id = patient_external_id
            @payment_timestamp = payment_timestamp if payment_timestamp != OMIT
            @payment_note = payment_note if payment_note != OMIT
            @allocations = allocations
            @invoice = invoice if invoice != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "patient_payment_id": patient_payment_id,
              "organization_id": organization_id,
              "source_internal_id": source_internal_id,
              "payment_source": payment_source,
              "amount_cents": amount_cents,
              "patient_external_id": patient_external_id,
              "payment_timestamp": payment_timestamp,
              "payment_note": payment_note,
              "allocations": allocations,
              "invoice": invoice
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of PatientPayment
          #
          # @param json_object [String]
          # @return [CandidApiClient::PatientPayments::V4::Types::PatientPayment]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            patient_payment_id = struct["patient_payment_id"]
            organization_id = struct["organization_id"]
            source_internal_id = struct["source_internal_id"]
            payment_source = struct["payment_source"]
            amount_cents = struct["amount_cents"]
            patient_external_id = struct["patient_external_id"]
            payment_timestamp = unless parsed_json["payment_timestamp"].nil?
                                  DateTime.parse(parsed_json["payment_timestamp"])
                                end
            payment_note = struct["payment_note"]
            allocations = parsed_json["allocations"]&.map do |item|
              item = item.to_json
              CandidApiClient::Financials::Types::Allocation.from_json(json_object: item)
            end
            invoice = struct["invoice"]
            new(
              patient_payment_id: patient_payment_id,
              organization_id: organization_id,
              source_internal_id: source_internal_id,
              payment_source: payment_source,
              amount_cents: amount_cents,
              patient_external_id: patient_external_id,
              payment_timestamp: payment_timestamp,
              payment_note: payment_note,
              allocations: allocations,
              invoice: invoice,
              additional_properties: struct
            )
          end

          # Serialize an instance of PatientPayment to a JSON object
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
            obj.patient_payment_id.is_a?(String) != false || raise("Passed value for field obj.patient_payment_id is not the expected type, validation failed.")
            obj.organization_id.is_a?(String) != false || raise("Passed value for field obj.organization_id is not the expected type, validation failed.")
            obj.source_internal_id&.is_a?(String) != false || raise("Passed value for field obj.source_internal_id is not the expected type, validation failed.")
            obj.payment_source.is_a?(CandidApiClient::Financials::Types::PatientTransactionSource) != false || raise("Passed value for field obj.payment_source is not the expected type, validation failed.")
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
end
