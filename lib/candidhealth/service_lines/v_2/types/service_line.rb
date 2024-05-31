# frozen_string_literal: true

require_relative "../../../commons/types/procedure_modifier"
require_relative "../../../diagnoses/types/diagnosis_id"
require_relative "service_line_era_data"
require_relative "service_line_adjustment"
require_relative "../../../invoices/types/invoice"
require_relative "../../../invoices/v_2/types/invoice_info"
require_relative "service_line_denial_reason"
require_relative "../../../commons/types/facility_type_code"
require_relative "../../../commons/types/service_line_id"
require_relative "../../../commons/types/decimal"
require_relative "../../../commons/types/service_line_units"
require_relative "../../../commons/types/claim_id"
require_relative "../../../commons/types/date_range_optional_end"
require "date"
require "json"

module CandidApiClient
  module ServiceLines
    module V2
      class ServiceLine
        attr_reader :modifiers, :charge_amount_cents, :allowed_amount_cents, :insurance_balance_cents,
                    :patient_balance_cents, :paid_amount_cents, :patient_responsibility_cents, :diagnosis_id_zero, :diagnosis_id_one, :diagnosis_id_two, :diagnosis_id_three, :service_line_era_data, :service_line_manual_adjustments, :related_invoices, :related_invoice_info, :denial_reason, :place_of_service_code, :service_line_id, :procedure_code, :quantity, :units, :claim_id, :date_of_service_range, :description, :date_of_service, :end_date_of_service, :additional_properties

        # @param modifiers [Array<Commons::ProcedureModifier>]
        # @param charge_amount_cents [Integer]
        # @param allowed_amount_cents [Integer]
        # @param insurance_balance_cents [Integer]
        # @param patient_balance_cents [Integer]
        # @param paid_amount_cents [Integer]
        # @param patient_responsibility_cents [Integer]
        # @param diagnosis_id_zero [Diagnoses::DIAGNOSIS_ID]
        # @param diagnosis_id_one [Diagnoses::DIAGNOSIS_ID]
        # @param diagnosis_id_two [Diagnoses::DIAGNOSIS_ID]
        # @param diagnosis_id_three [Diagnoses::DIAGNOSIS_ID]
        # @param service_line_era_data [ServiceLines::V2::ServiceLineEraData]
        # @param service_line_manual_adjustments [Array<ServiceLines::V2::ServiceLineAdjustment>]
        # @param related_invoices [Array<Invoices::Invoice>]
        # @param related_invoice_info [Array<Invoices::V2::InvoiceInfo>]
        # @param denial_reason [ServiceLines::V2::ServiceLineDenialReason]
        # @param place_of_service_code [Commons::FacilityTypeCode]
        # @param service_line_id [Commons::SERVICE_LINE_ID]
        # @param procedure_code [String]
        # @param quantity [Commons::DECIMAL] String representation of a Decimal that can be parsed by most libraries.
        #   A ServiceLine quantity cannot contain more than one digit of precision.
        #   Example: 1.1 is valid, 1.11 is not.
        # @param units [Commons::ServiceLineUnits]
        # @param claim_id [Commons::CLAIM_ID]
        # @param date_of_service_range [Commons::DateRangeOptionalEnd] A range of dates of service for this service line. If the service line is for a single date, the end date
        #   will be empty.
        # @param description [String] A free-form description to clarify the related data elements and their content. Maps to SV1-01, C003-07 on the 837-P.
        # @param date_of_service [Date]
        # @param end_date_of_service [Date]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [ServiceLines::V2::ServiceLine]
        def initialize(service_line_id:, procedure_code:, quantity:, units:, claim_id:, date_of_service_range:, date_of_service:, modifiers: nil, charge_amount_cents: nil, allowed_amount_cents: nil,
                       insurance_balance_cents: nil, patient_balance_cents: nil, paid_amount_cents: nil, patient_responsibility_cents: nil, diagnosis_id_zero: nil, diagnosis_id_one: nil, diagnosis_id_two: nil, diagnosis_id_three: nil, service_line_era_data: nil, service_line_manual_adjustments: nil, related_invoices: nil, related_invoice_info: nil, denial_reason: nil, place_of_service_code: nil, description: nil, end_date_of_service: nil, additional_properties: nil)
          # @type [Array<Commons::ProcedureModifier>]
          @modifiers = modifiers
          # @type [Integer]
          @charge_amount_cents = charge_amount_cents
          # @type [Integer]
          @allowed_amount_cents = allowed_amount_cents
          # @type [Integer]
          @insurance_balance_cents = insurance_balance_cents
          # @type [Integer]
          @patient_balance_cents = patient_balance_cents
          # @type [Integer]
          @paid_amount_cents = paid_amount_cents
          # @type [Integer]
          @patient_responsibility_cents = patient_responsibility_cents
          # @type [Diagnoses::DIAGNOSIS_ID]
          @diagnosis_id_zero = diagnosis_id_zero
          # @type [Diagnoses::DIAGNOSIS_ID]
          @diagnosis_id_one = diagnosis_id_one
          # @type [Diagnoses::DIAGNOSIS_ID]
          @diagnosis_id_two = diagnosis_id_two
          # @type [Diagnoses::DIAGNOSIS_ID]
          @diagnosis_id_three = diagnosis_id_three
          # @type [ServiceLines::V2::ServiceLineEraData]
          @service_line_era_data = service_line_era_data
          # @type [Array<ServiceLines::V2::ServiceLineAdjustment>]
          @service_line_manual_adjustments = service_line_manual_adjustments
          # @type [Array<Invoices::Invoice>]
          @related_invoices = related_invoices
          # @type [Array<Invoices::V2::InvoiceInfo>]
          @related_invoice_info = related_invoice_info
          # @type [ServiceLines::V2::ServiceLineDenialReason]
          @denial_reason = denial_reason
          # @type [Commons::FacilityTypeCode]
          @place_of_service_code = place_of_service_code
          # @type [Commons::SERVICE_LINE_ID]
          @service_line_id = service_line_id
          # @type [String]
          @procedure_code = procedure_code
          # @type [Commons::DECIMAL] String representation of a Decimal that can be parsed by most libraries.
          #   A ServiceLine quantity cannot contain more than one digit of precision.
          #   Example: 1.1 is valid, 1.11 is not.
          @quantity = quantity
          # @type [Commons::ServiceLineUnits]
          @units = units
          # @type [Commons::CLAIM_ID]
          @claim_id = claim_id
          # @type [Commons::DateRangeOptionalEnd] A range of dates of service for this service line. If the service line is for a single date, the end date
          #   will be empty.
          @date_of_service_range = date_of_service_range
          # @type [String] A free-form description to clarify the related data elements and their content. Maps to SV1-01, C003-07 on the 837-P.
          @description = description
          # @type [Date]
          @date_of_service = date_of_service
          # @type [Date]
          @end_date_of_service = end_date_of_service
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of ServiceLine
        #
        # @param json_object [JSON]
        # @return [ServiceLines::V2::ServiceLine]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          modifiers = struct.modifiers
          charge_amount_cents = struct.charge_amount_cents
          allowed_amount_cents = struct.allowed_amount_cents
          insurance_balance_cents = struct.insurance_balance_cents
          patient_balance_cents = struct.patient_balance_cents
          paid_amount_cents = struct.paid_amount_cents
          patient_responsibility_cents = struct.patient_responsibility_cents
          diagnosis_id_zero = struct.diagnosis_id_zero
          diagnosis_id_one = struct.diagnosis_id_one
          diagnosis_id_two = struct.diagnosis_id_two
          diagnosis_id_three = struct.diagnosis_id_three
          if parsed_json["service_line_era_data"].nil?
            service_line_era_data = nil
          else
            service_line_era_data = parsed_json["service_line_era_data"].to_json
            service_line_era_data = ServiceLines::V2::ServiceLineEraData.from_json(json_object: service_line_era_data)
          end
          service_line_manual_adjustments = parsed_json["service_line_manual_adjustments"]&.map do |v|
            v = v.to_json
            ServiceLines::V2::ServiceLineAdjustment.from_json(json_object: v)
          end
          related_invoices = parsed_json["related_invoices"]&.map do |v|
            v = v.to_json
            Invoices::Invoice.from_json(json_object: v)
          end
          related_invoice_info = parsed_json["related_invoice_info"]&.map do |v|
            v = v.to_json
            Invoices::V2::InvoiceInfo.from_json(json_object: v)
          end
          if parsed_json["denial_reason"].nil?
            denial_reason = nil
          else
            denial_reason = parsed_json["denial_reason"].to_json
            denial_reason = ServiceLines::V2::ServiceLineDenialReason.from_json(json_object: denial_reason)
          end
          place_of_service_code = struct.place_of_service_code
          service_line_id = struct.service_line_id
          procedure_code = struct.procedure_code
          quantity = struct.quantity
          units = struct.units
          claim_id = struct.claim_id
          if parsed_json["date_of_service_range"].nil?
            date_of_service_range = nil
          else
            date_of_service_range = parsed_json["date_of_service_range"].to_json
            date_of_service_range = Commons::DateRangeOptionalEnd.from_json(json_object: date_of_service_range)
          end
          description = struct.description
          date_of_service = (Date.parse(parsed_json["date_of_service"]) unless parsed_json["date_of_service"].nil?)
          end_date_of_service = unless parsed_json["end_date_of_service"].nil?
                                  Date.parse(parsed_json["end_date_of_service"])
                                end
          new(modifiers: modifiers, charge_amount_cents: charge_amount_cents,
              allowed_amount_cents: allowed_amount_cents, insurance_balance_cents: insurance_balance_cents, patient_balance_cents: patient_balance_cents, paid_amount_cents: paid_amount_cents, patient_responsibility_cents: patient_responsibility_cents, diagnosis_id_zero: diagnosis_id_zero, diagnosis_id_one: diagnosis_id_one, diagnosis_id_two: diagnosis_id_two, diagnosis_id_three: diagnosis_id_three, service_line_era_data: service_line_era_data, service_line_manual_adjustments: service_line_manual_adjustments, related_invoices: related_invoices, related_invoice_info: related_invoice_info, denial_reason: denial_reason, place_of_service_code: place_of_service_code, service_line_id: service_line_id, procedure_code: procedure_code, quantity: quantity, units: units, claim_id: claim_id, date_of_service_range: date_of_service_range, description: description, date_of_service: date_of_service, end_date_of_service: end_date_of_service, additional_properties: struct)
        end

        # Serialize an instance of ServiceLine to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "modifiers": @modifiers,
            "charge_amount_cents": @charge_amount_cents,
            "allowed_amount_cents": @allowed_amount_cents,
            "insurance_balance_cents": @insurance_balance_cents,
            "patient_balance_cents": @patient_balance_cents,
            "paid_amount_cents": @paid_amount_cents,
            "patient_responsibility_cents": @patient_responsibility_cents,
            "diagnosis_id_zero": @diagnosis_id_zero,
            "diagnosis_id_one": @diagnosis_id_one,
            "diagnosis_id_two": @diagnosis_id_two,
            "diagnosis_id_three": @diagnosis_id_three,
            "service_line_era_data": @service_line_era_data,
            "service_line_manual_adjustments": @service_line_manual_adjustments,
            "related_invoices": @related_invoices,
            "related_invoice_info": @related_invoice_info,
            "denial_reason": @denial_reason,
            "place_of_service_code": @place_of_service_code,
            "service_line_id": @service_line_id,
            "procedure_code": @procedure_code,
            "quantity": @quantity,
            "units": @units,
            "claim_id": @claim_id,
            "date_of_service_range": @date_of_service_range,
            "description": @description,
            "date_of_service": @date_of_service,
            "end_date_of_service": @end_date_of_service
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.modifiers&.is_a?(Array) != false || raise("Passed value for field obj.modifiers is not the expected type, validation failed.")
          obj.charge_amount_cents&.is_a?(Integer) != false || raise("Passed value for field obj.charge_amount_cents is not the expected type, validation failed.")
          obj.allowed_amount_cents&.is_a?(Integer) != false || raise("Passed value for field obj.allowed_amount_cents is not the expected type, validation failed.")
          obj.insurance_balance_cents&.is_a?(Integer) != false || raise("Passed value for field obj.insurance_balance_cents is not the expected type, validation failed.")
          obj.patient_balance_cents&.is_a?(Integer) != false || raise("Passed value for field obj.patient_balance_cents is not the expected type, validation failed.")
          obj.paid_amount_cents&.is_a?(Integer) != false || raise("Passed value for field obj.paid_amount_cents is not the expected type, validation failed.")
          obj.patient_responsibility_cents&.is_a?(Integer) != false || raise("Passed value for field obj.patient_responsibility_cents is not the expected type, validation failed.")
          obj.diagnosis_id_zero&.is_a?(UUID) != false || raise("Passed value for field obj.diagnosis_id_zero is not the expected type, validation failed.")
          obj.diagnosis_id_one&.is_a?(UUID) != false || raise("Passed value for field obj.diagnosis_id_one is not the expected type, validation failed.")
          obj.diagnosis_id_two&.is_a?(UUID) != false || raise("Passed value for field obj.diagnosis_id_two is not the expected type, validation failed.")
          obj.diagnosis_id_three&.is_a?(UUID) != false || raise("Passed value for field obj.diagnosis_id_three is not the expected type, validation failed.")
          obj.service_line_era_data.nil? || ServiceLines::V2::ServiceLineEraData.validate_raw(obj: obj.service_line_era_data)
          obj.service_line_manual_adjustments&.is_a?(Array) != false || raise("Passed value for field obj.service_line_manual_adjustments is not the expected type, validation failed.")
          obj.related_invoices&.is_a?(Array) != false || raise("Passed value for field obj.related_invoices is not the expected type, validation failed.")
          obj.related_invoice_info&.is_a?(Array) != false || raise("Passed value for field obj.related_invoice_info is not the expected type, validation failed.")
          obj.denial_reason.nil? || ServiceLines::V2::ServiceLineDenialReason.validate_raw(obj: obj.denial_reason)
          obj.place_of_service_code&.is_a?(Commons::FacilityTypeCode) != false || raise("Passed value for field obj.place_of_service_code is not the expected type, validation failed.")
          obj.service_line_id.is_a?(UUID) != false || raise("Passed value for field obj.service_line_id is not the expected type, validation failed.")
          obj.procedure_code.is_a?(String) != false || raise("Passed value for field obj.procedure_code is not the expected type, validation failed.")
          obj.quantity.is_a?(String) != false || raise("Passed value for field obj.quantity is not the expected type, validation failed.")
          obj.units.is_a?(Commons::ServiceLineUnits) != false || raise("Passed value for field obj.units is not the expected type, validation failed.")
          obj.claim_id.is_a?(UUID) != false || raise("Passed value for field obj.claim_id is not the expected type, validation failed.")
          Commons::DateRangeOptionalEnd.validate_raw(obj: obj.date_of_service_range)
          obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
          obj.date_of_service.is_a?(Date) != false || raise("Passed value for field obj.date_of_service is not the expected type, validation failed.")
          obj.end_date_of_service&.is_a?(Date) != false || raise("Passed value for field obj.end_date_of_service is not the expected type, validation failed.")
        end
      end
    end
  end
end
