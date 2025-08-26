# frozen_string_literal: true

require "date"
require_relative "insurance_adjustment_info"
require_relative "insurance_payment_info"
require_relative "non_insurance_adjustment_info"
require_relative "non_insurance_payment_info"
require_relative "patient_adjustment_info"
require_relative "patient_payment_info"
require "ostruct"
require "json"

module CandidApiClient
  module PatientAr
    module V1
      module Types
        class ServiceLineItemization
          # @return [String] The ID of the service line.
          attr_reader :service_line_id
          # @return [String] The procedure code (CPT/HCPCS) associated with the service line.
          attr_reader :procedure_code
          # @return [Date] The date of service for the service line.
          attr_reader :date_of_service
          # @return [Integer] The total patient balance in cents for the service line. Negative values
          #  indicate a credit balance.
          attr_reader :patient_balance_cents
          # @return [Integer] The total charge amount in cents for the service line.
          attr_reader :charge_amount_cents
          # @return [CandidApiClient::PatientAr::V1::Types::InsuranceAdjustmentInfo]
          attr_reader :insurance_adjustments
          # @return [CandidApiClient::PatientAr::V1::Types::InsurancePaymentInfo]
          attr_reader :insurance_payments
          # @return [CandidApiClient::PatientAr::V1::Types::NonInsuranceAdjustmentInfo]
          attr_reader :non_insurance_adjustments
          # @return [CandidApiClient::PatientAr::V1::Types::NonInsurancePaymentInfo]
          attr_reader :non_insurance_payments
          # @return [CandidApiClient::PatientAr::V1::Types::PatientAdjustmentInfo]
          attr_reader :patient_adjustments
          # @return [CandidApiClient::PatientAr::V1::Types::PatientPaymentInfo]
          attr_reader :patient_payments
          # @return [Integer] The copay amount in cents for the service line.
          attr_reader :copay_cents
          # @return [Integer] The coinsurance amount in cents for the service line.
          attr_reader :coinsurance_cents
          # @return [Integer] The deductible amount in cents for the service line.
          attr_reader :deductible_cents
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param service_line_id [String] The ID of the service line.
          # @param procedure_code [String] The procedure code (CPT/HCPCS) associated with the service line.
          # @param date_of_service [Date] The date of service for the service line.
          # @param patient_balance_cents [Integer] The total patient balance in cents for the service line. Negative values
          #  indicate a credit balance.
          # @param charge_amount_cents [Integer] The total charge amount in cents for the service line.
          # @param insurance_adjustments [CandidApiClient::PatientAr::V1::Types::InsuranceAdjustmentInfo]
          # @param insurance_payments [CandidApiClient::PatientAr::V1::Types::InsurancePaymentInfo]
          # @param non_insurance_adjustments [CandidApiClient::PatientAr::V1::Types::NonInsuranceAdjustmentInfo]
          # @param non_insurance_payments [CandidApiClient::PatientAr::V1::Types::NonInsurancePaymentInfo]
          # @param patient_adjustments [CandidApiClient::PatientAr::V1::Types::PatientAdjustmentInfo]
          # @param patient_payments [CandidApiClient::PatientAr::V1::Types::PatientPaymentInfo]
          # @param copay_cents [Integer] The copay amount in cents for the service line.
          # @param coinsurance_cents [Integer] The coinsurance amount in cents for the service line.
          # @param deductible_cents [Integer] The deductible amount in cents for the service line.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::PatientAr::V1::Types::ServiceLineItemization]
          def initialize(service_line_id:, procedure_code:, date_of_service:, patient_balance_cents:,
                         charge_amount_cents:, insurance_adjustments:, insurance_payments:, non_insurance_adjustments:, non_insurance_payments:, patient_adjustments:, patient_payments:, copay_cents:, coinsurance_cents:, deductible_cents:, additional_properties: nil)
            @service_line_id = service_line_id
            @procedure_code = procedure_code
            @date_of_service = date_of_service
            @patient_balance_cents = patient_balance_cents
            @charge_amount_cents = charge_amount_cents
            @insurance_adjustments = insurance_adjustments
            @insurance_payments = insurance_payments
            @non_insurance_adjustments = non_insurance_adjustments
            @non_insurance_payments = non_insurance_payments
            @patient_adjustments = patient_adjustments
            @patient_payments = patient_payments
            @copay_cents = copay_cents
            @coinsurance_cents = coinsurance_cents
            @deductible_cents = deductible_cents
            @additional_properties = additional_properties
            @_field_set = {
              "service_line_id": service_line_id,
              "procedure_code": procedure_code,
              "date_of_service": date_of_service,
              "patient_balance_cents": patient_balance_cents,
              "charge_amount_cents": charge_amount_cents,
              "insurance_adjustments": insurance_adjustments,
              "insurance_payments": insurance_payments,
              "non_insurance_adjustments": non_insurance_adjustments,
              "non_insurance_payments": non_insurance_payments,
              "patient_adjustments": patient_adjustments,
              "patient_payments": patient_payments,
              "copay_cents": copay_cents,
              "coinsurance_cents": coinsurance_cents,
              "deductible_cents": deductible_cents
            }
          end

          # Deserialize a JSON object to an instance of ServiceLineItemization
          #
          # @param json_object [String]
          # @return [CandidApiClient::PatientAr::V1::Types::ServiceLineItemization]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            service_line_id = struct["service_line_id"]
            procedure_code = struct["procedure_code"]
            date_of_service = (Date.parse(parsed_json["date_of_service"]) unless parsed_json["date_of_service"].nil?)
            patient_balance_cents = struct["patient_balance_cents"]
            charge_amount_cents = struct["charge_amount_cents"]
            if parsed_json["insurance_adjustments"].nil?
              insurance_adjustments = nil
            else
              insurance_adjustments = parsed_json["insurance_adjustments"].to_json
              insurance_adjustments = CandidApiClient::PatientAr::V1::Types::InsuranceAdjustmentInfo.from_json(json_object: insurance_adjustments)
            end
            if parsed_json["insurance_payments"].nil?
              insurance_payments = nil
            else
              insurance_payments = parsed_json["insurance_payments"].to_json
              insurance_payments = CandidApiClient::PatientAr::V1::Types::InsurancePaymentInfo.from_json(json_object: insurance_payments)
            end
            if parsed_json["non_insurance_adjustments"].nil?
              non_insurance_adjustments = nil
            else
              non_insurance_adjustments = parsed_json["non_insurance_adjustments"].to_json
              non_insurance_adjustments = CandidApiClient::PatientAr::V1::Types::NonInsuranceAdjustmentInfo.from_json(json_object: non_insurance_adjustments)
            end
            if parsed_json["non_insurance_payments"].nil?
              non_insurance_payments = nil
            else
              non_insurance_payments = parsed_json["non_insurance_payments"].to_json
              non_insurance_payments = CandidApiClient::PatientAr::V1::Types::NonInsurancePaymentInfo.from_json(json_object: non_insurance_payments)
            end
            if parsed_json["patient_adjustments"].nil?
              patient_adjustments = nil
            else
              patient_adjustments = parsed_json["patient_adjustments"].to_json
              patient_adjustments = CandidApiClient::PatientAr::V1::Types::PatientAdjustmentInfo.from_json(json_object: patient_adjustments)
            end
            if parsed_json["patient_payments"].nil?
              patient_payments = nil
            else
              patient_payments = parsed_json["patient_payments"].to_json
              patient_payments = CandidApiClient::PatientAr::V1::Types::PatientPaymentInfo.from_json(json_object: patient_payments)
            end
            copay_cents = struct["copay_cents"]
            coinsurance_cents = struct["coinsurance_cents"]
            deductible_cents = struct["deductible_cents"]
            new(
              service_line_id: service_line_id,
              procedure_code: procedure_code,
              date_of_service: date_of_service,
              patient_balance_cents: patient_balance_cents,
              charge_amount_cents: charge_amount_cents,
              insurance_adjustments: insurance_adjustments,
              insurance_payments: insurance_payments,
              non_insurance_adjustments: non_insurance_adjustments,
              non_insurance_payments: non_insurance_payments,
              patient_adjustments: patient_adjustments,
              patient_payments: patient_payments,
              copay_cents: copay_cents,
              coinsurance_cents: coinsurance_cents,
              deductible_cents: deductible_cents,
              additional_properties: struct
            )
          end

          # Serialize an instance of ServiceLineItemization to a JSON object
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
            obj.service_line_id.is_a?(String) != false || raise("Passed value for field obj.service_line_id is not the expected type, validation failed.")
            obj.procedure_code.is_a?(String) != false || raise("Passed value for field obj.procedure_code is not the expected type, validation failed.")
            obj.date_of_service.is_a?(Date) != false || raise("Passed value for field obj.date_of_service is not the expected type, validation failed.")
            obj.patient_balance_cents.is_a?(Integer) != false || raise("Passed value for field obj.patient_balance_cents is not the expected type, validation failed.")
            obj.charge_amount_cents.is_a?(Integer) != false || raise("Passed value for field obj.charge_amount_cents is not the expected type, validation failed.")
            CandidApiClient::PatientAr::V1::Types::InsuranceAdjustmentInfo.validate_raw(obj: obj.insurance_adjustments)
            CandidApiClient::PatientAr::V1::Types::InsurancePaymentInfo.validate_raw(obj: obj.insurance_payments)
            CandidApiClient::PatientAr::V1::Types::NonInsuranceAdjustmentInfo.validate_raw(obj: obj.non_insurance_adjustments)
            CandidApiClient::PatientAr::V1::Types::NonInsurancePaymentInfo.validate_raw(obj: obj.non_insurance_payments)
            CandidApiClient::PatientAr::V1::Types::PatientAdjustmentInfo.validate_raw(obj: obj.patient_adjustments)
            CandidApiClient::PatientAr::V1::Types::PatientPaymentInfo.validate_raw(obj: obj.patient_payments)
            obj.copay_cents.is_a?(Integer) != false || raise("Passed value for field obj.copay_cents is not the expected type, validation failed.")
            obj.coinsurance_cents.is_a?(Integer) != false || raise("Passed value for field obj.coinsurance_cents is not the expected type, validation failed.")
            obj.deductible_cents.is_a?(Integer) != false || raise("Passed value for field obj.deductible_cents is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
