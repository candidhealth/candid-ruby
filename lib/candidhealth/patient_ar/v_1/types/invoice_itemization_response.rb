# frozen_string_literal: true

require_relative "patient_payment_info"
require_relative "service_line_itemization"
require "ostruct"
require "json"

module CandidApiClient
  module PatientAr
    module V1
      module Types
        class InvoiceItemizationResponse
          # @return [String] The ID of the claim associated with the invoice itemization.
          attr_reader :claim_id
          # @return [Integer] The total patient balance in cents for the claim. Negative values indicate a
          #  credit balance.
          attr_reader :patient_balance_cents
          # @return [CandidApiClient::PatientAr::V1::Types::PatientPaymentInfo]
          attr_reader :claim_level_patient_payments
          # @return [Array<CandidApiClient::PatientAr::V1::Types::ServiceLineItemization>] A list of service line itemizations for the claim.
          attr_reader :service_line_itemization
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param claim_id [String] The ID of the claim associated with the invoice itemization.
          # @param patient_balance_cents [Integer] The total patient balance in cents for the claim. Negative values indicate a
          #  credit balance.
          # @param claim_level_patient_payments [CandidApiClient::PatientAr::V1::Types::PatientPaymentInfo]
          # @param service_line_itemization [Array<CandidApiClient::PatientAr::V1::Types::ServiceLineItemization>] A list of service line itemizations for the claim.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::PatientAr::V1::Types::InvoiceItemizationResponse]
          def initialize(claim_id:, patient_balance_cents:, claim_level_patient_payments:, service_line_itemization:,
                         additional_properties: nil)
            @claim_id = claim_id
            @patient_balance_cents = patient_balance_cents
            @claim_level_patient_payments = claim_level_patient_payments
            @service_line_itemization = service_line_itemization
            @additional_properties = additional_properties
            @_field_set = {
              "claim_id": claim_id,
              "patient_balance_cents": patient_balance_cents,
              "claim_level_patient_payments": claim_level_patient_payments,
              "service_line_itemization": service_line_itemization
            }
          end

          # Deserialize a JSON object to an instance of InvoiceItemizationResponse
          #
          # @param json_object [String]
          # @return [CandidApiClient::PatientAr::V1::Types::InvoiceItemizationResponse]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            claim_id = struct["claim_id"]
            patient_balance_cents = struct["patient_balance_cents"]
            if parsed_json["claim_level_patient_payments"].nil?
              claim_level_patient_payments = nil
            else
              claim_level_patient_payments = parsed_json["claim_level_patient_payments"].to_json
              claim_level_patient_payments = CandidApiClient::PatientAr::V1::Types::PatientPaymentInfo.from_json(json_object: claim_level_patient_payments)
            end
            service_line_itemization = parsed_json["service_line_itemization"]&.map do |item|
              item = item.to_json
              CandidApiClient::PatientAr::V1::Types::ServiceLineItemization.from_json(json_object: item)
            end
            new(
              claim_id: claim_id,
              patient_balance_cents: patient_balance_cents,
              claim_level_patient_payments: claim_level_patient_payments,
              service_line_itemization: service_line_itemization,
              additional_properties: struct
            )
          end

          # Serialize an instance of InvoiceItemizationResponse to a JSON object
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
            obj.claim_id.is_a?(String) != false || raise("Passed value for field obj.claim_id is not the expected type, validation failed.")
            obj.patient_balance_cents.is_a?(Integer) != false || raise("Passed value for field obj.patient_balance_cents is not the expected type, validation failed.")
            CandidApiClient::PatientAr::V1::Types::PatientPaymentInfo.validate_raw(obj: obj.claim_level_patient_payments)
            obj.service_line_itemization.is_a?(Array) != false || raise("Passed value for field obj.service_line_itemization is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
