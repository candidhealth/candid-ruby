# frozen_string_literal: true

require_relative "../../../commons/types/procedure_modifier"
require_relative "drug_identification"
require_relative "service_line_era_data"
require_relative "service_line_adjustment"
require_relative "../../../invoices/types/invoice"
require_relative "../../../invoices/v_2/types/invoice_info"
require_relative "service_line_denial_reason"
require_relative "../../../commons/types/facility_type_code"
require_relative "../../../encounter_providers/v_2/types/encounter_provider"
require_relative "../../../commons/types/service_line_units"
require_relative "../../../commons/types/date_range_optional_end"
require "date"
require_relative "test_result"
require "ostruct"
require "json"

module CandidApiClient
  module ServiceLines
    module V2
      module Types
        class ServiceLine
          # @return [Array<CandidApiClient::Commons::Types::ProcedureModifier>]
          attr_reader :modifiers
          # @return [Integer]
          attr_reader :charge_amount_cents
          # @return [Integer]
          attr_reader :allowed_amount_cents
          # @return [Integer]
          attr_reader :insurance_balance_cents
          # @return [Integer]
          attr_reader :patient_balance_cents
          # @return [Integer]
          attr_reader :paid_amount_cents
          # @return [Integer]
          attr_reader :primary_paid_amount_cents
          # @return [Integer]
          attr_reader :secondary_paid_amount_cents
          # @return [Integer]
          attr_reader :tertiary_paid_amount_cents
          # @return [Integer]
          attr_reader :patient_responsibility_cents
          # @return [String]
          attr_reader :diagnosis_id_zero
          # @return [String]
          attr_reader :diagnosis_id_one
          # @return [String]
          attr_reader :diagnosis_id_two
          # @return [String]
          attr_reader :diagnosis_id_three
          # @return [CandidApiClient::ServiceLines::V2::Types::DrugIdentification]
          attr_reader :drug_identification
          # @return [CandidApiClient::ServiceLines::V2::Types::ServiceLineEraData]
          attr_reader :service_line_era_data
          # @return [Array<CandidApiClient::ServiceLines::V2::Types::ServiceLineAdjustment>]
          attr_reader :service_line_manual_adjustments
          # @return [Array<CandidApiClient::Invoices::Types::Invoice>]
          attr_reader :related_invoices
          # @return [Array<CandidApiClient::Invoices::V2::Types::InvoiceInfo>]
          attr_reader :related_invoice_info
          # @return [CandidApiClient::ServiceLines::V2::Types::ServiceLineDenialReason]
          attr_reader :denial_reason
          # @return [CandidApiClient::Commons::Types::FacilityTypeCode]
          attr_reader :place_of_service_code
          # @return [CandidApiClient::Commons::Types::FacilityTypeCode]
          attr_reader :place_of_service_code_as_submitted
          # @return [String]
          attr_reader :service_line_id
          # @return [String]
          attr_reader :procedure_code
          # @return [CandidApiClient::EncounterProviders::V2::Types::EncounterProvider]
          attr_reader :ordering_provider
          # @return [String] String representation of a Decimal that can be parsed by most libraries.
          #  A ServiceLine quantity cannot contain more than one digit of precision.
          #  Example: 1.1 is valid, 1.11 is not.
          attr_reader :quantity
          # @return [CandidApiClient::Commons::Types::ServiceLineUnits]
          attr_reader :units
          # @return [String]
          attr_reader :claim_id
          # @return [CandidApiClient::Commons::Types::DateRangeOptionalEnd] A range of dates of service for this service line. If the service line is for a
          #  single date, the end date
          #  will be empty.
          attr_reader :date_of_service_range
          # @return [String] A free-form description to clarify the related data elements and their content.
          #  Maps to SV1-01, C003-07 on the 837-P.
          attr_reader :description
          # @return [Date]
          attr_reader :date_of_service
          # @return [Date]
          attr_reader :end_date_of_service
          # @return [CandidApiClient::ServiceLines::V2::Types::TestResult] Contains a single test result value. Maps to MEA-02 on the 837-P.
          attr_reader :test_result
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param modifiers [Array<CandidApiClient::Commons::Types::ProcedureModifier>]
          # @param charge_amount_cents [Integer]
          # @param allowed_amount_cents [Integer]
          # @param insurance_balance_cents [Integer]
          # @param patient_balance_cents [Integer]
          # @param paid_amount_cents [Integer]
          # @param primary_paid_amount_cents [Integer]
          # @param secondary_paid_amount_cents [Integer]
          # @param tertiary_paid_amount_cents [Integer]
          # @param patient_responsibility_cents [Integer]
          # @param diagnosis_id_zero [String]
          # @param diagnosis_id_one [String]
          # @param diagnosis_id_two [String]
          # @param diagnosis_id_three [String]
          # @param drug_identification [CandidApiClient::ServiceLines::V2::Types::DrugIdentification]
          # @param service_line_era_data [CandidApiClient::ServiceLines::V2::Types::ServiceLineEraData]
          # @param service_line_manual_adjustments [Array<CandidApiClient::ServiceLines::V2::Types::ServiceLineAdjustment>]
          # @param related_invoices [Array<CandidApiClient::Invoices::Types::Invoice>]
          # @param related_invoice_info [Array<CandidApiClient::Invoices::V2::Types::InvoiceInfo>]
          # @param denial_reason [CandidApiClient::ServiceLines::V2::Types::ServiceLineDenialReason]
          # @param place_of_service_code [CandidApiClient::Commons::Types::FacilityTypeCode]
          # @param place_of_service_code_as_submitted [CandidApiClient::Commons::Types::FacilityTypeCode]
          # @param service_line_id [String]
          # @param procedure_code [String]
          # @param ordering_provider [CandidApiClient::EncounterProviders::V2::Types::EncounterProvider]
          # @param quantity [String] String representation of a Decimal that can be parsed by most libraries.
          #  A ServiceLine quantity cannot contain more than one digit of precision.
          #  Example: 1.1 is valid, 1.11 is not.
          # @param units [CandidApiClient::Commons::Types::ServiceLineUnits]
          # @param claim_id [String]
          # @param date_of_service_range [CandidApiClient::Commons::Types::DateRangeOptionalEnd] A range of dates of service for this service line. If the service line is for a
          #  single date, the end date
          #  will be empty.
          # @param description [String] A free-form description to clarify the related data elements and their content.
          #  Maps to SV1-01, C003-07 on the 837-P.
          # @param date_of_service [Date]
          # @param end_date_of_service [Date]
          # @param test_result [CandidApiClient::ServiceLines::V2::Types::TestResult] Contains a single test result value. Maps to MEA-02 on the 837-P.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::ServiceLines::V2::Types::ServiceLine]
          def initialize(service_line_id:, procedure_code:, quantity:, units:, claim_id:, date_of_service_range:, date_of_service:, modifiers: OMIT, charge_amount_cents: OMIT, allowed_amount_cents: OMIT,
                         insurance_balance_cents: OMIT, patient_balance_cents: OMIT, paid_amount_cents: OMIT, primary_paid_amount_cents: OMIT, secondary_paid_amount_cents: OMIT, tertiary_paid_amount_cents: OMIT, patient_responsibility_cents: OMIT, diagnosis_id_zero: OMIT, diagnosis_id_one: OMIT, diagnosis_id_two: OMIT, diagnosis_id_three: OMIT, drug_identification: OMIT, service_line_era_data: OMIT, service_line_manual_adjustments: OMIT, related_invoices: OMIT, related_invoice_info: OMIT, denial_reason: OMIT, place_of_service_code: OMIT, place_of_service_code_as_submitted: OMIT, ordering_provider: OMIT, description: OMIT, end_date_of_service: OMIT, test_result: OMIT, additional_properties: nil)
            @modifiers = modifiers if modifiers != OMIT
            @charge_amount_cents = charge_amount_cents if charge_amount_cents != OMIT
            @allowed_amount_cents = allowed_amount_cents if allowed_amount_cents != OMIT
            @insurance_balance_cents = insurance_balance_cents if insurance_balance_cents != OMIT
            @patient_balance_cents = patient_balance_cents if patient_balance_cents != OMIT
            @paid_amount_cents = paid_amount_cents if paid_amount_cents != OMIT
            @primary_paid_amount_cents = primary_paid_amount_cents if primary_paid_amount_cents != OMIT
            @secondary_paid_amount_cents = secondary_paid_amount_cents if secondary_paid_amount_cents != OMIT
            @tertiary_paid_amount_cents = tertiary_paid_amount_cents if tertiary_paid_amount_cents != OMIT
            @patient_responsibility_cents = patient_responsibility_cents if patient_responsibility_cents != OMIT
            @diagnosis_id_zero = diagnosis_id_zero if diagnosis_id_zero != OMIT
            @diagnosis_id_one = diagnosis_id_one if diagnosis_id_one != OMIT
            @diagnosis_id_two = diagnosis_id_two if diagnosis_id_two != OMIT
            @diagnosis_id_three = diagnosis_id_three if diagnosis_id_three != OMIT
            @drug_identification = drug_identification if drug_identification != OMIT
            @service_line_era_data = service_line_era_data if service_line_era_data != OMIT
            if service_line_manual_adjustments != OMIT
              @service_line_manual_adjustments = service_line_manual_adjustments
            end
            @related_invoices = related_invoices if related_invoices != OMIT
            @related_invoice_info = related_invoice_info if related_invoice_info != OMIT
            @denial_reason = denial_reason if denial_reason != OMIT
            @place_of_service_code = place_of_service_code if place_of_service_code != OMIT
            if place_of_service_code_as_submitted != OMIT
              @place_of_service_code_as_submitted = place_of_service_code_as_submitted
            end
            @service_line_id = service_line_id
            @procedure_code = procedure_code
            @ordering_provider = ordering_provider if ordering_provider != OMIT
            @quantity = quantity
            @units = units
            @claim_id = claim_id
            @date_of_service_range = date_of_service_range
            @description = description if description != OMIT
            @date_of_service = date_of_service
            @end_date_of_service = end_date_of_service if end_date_of_service != OMIT
            @test_result = test_result if test_result != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "modifiers": modifiers,
              "charge_amount_cents": charge_amount_cents,
              "allowed_amount_cents": allowed_amount_cents,
              "insurance_balance_cents": insurance_balance_cents,
              "patient_balance_cents": patient_balance_cents,
              "paid_amount_cents": paid_amount_cents,
              "primary_paid_amount_cents": primary_paid_amount_cents,
              "secondary_paid_amount_cents": secondary_paid_amount_cents,
              "tertiary_paid_amount_cents": tertiary_paid_amount_cents,
              "patient_responsibility_cents": patient_responsibility_cents,
              "diagnosis_id_zero": diagnosis_id_zero,
              "diagnosis_id_one": diagnosis_id_one,
              "diagnosis_id_two": diagnosis_id_two,
              "diagnosis_id_three": diagnosis_id_three,
              "drug_identification": drug_identification,
              "service_line_era_data": service_line_era_data,
              "service_line_manual_adjustments": service_line_manual_adjustments,
              "related_invoices": related_invoices,
              "related_invoice_info": related_invoice_info,
              "denial_reason": denial_reason,
              "place_of_service_code": place_of_service_code,
              "place_of_service_code_as_submitted": place_of_service_code_as_submitted,
              "service_line_id": service_line_id,
              "procedure_code": procedure_code,
              "ordering_provider": ordering_provider,
              "quantity": quantity,
              "units": units,
              "claim_id": claim_id,
              "date_of_service_range": date_of_service_range,
              "description": description,
              "date_of_service": date_of_service,
              "end_date_of_service": end_date_of_service,
              "test_result": test_result
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of ServiceLine
          #
          # @param json_object [String]
          # @return [CandidApiClient::ServiceLines::V2::Types::ServiceLine]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            modifiers = struct["modifiers"]
            charge_amount_cents = struct["charge_amount_cents"]
            allowed_amount_cents = struct["allowed_amount_cents"]
            insurance_balance_cents = struct["insurance_balance_cents"]
            patient_balance_cents = struct["patient_balance_cents"]
            paid_amount_cents = struct["paid_amount_cents"]
            primary_paid_amount_cents = struct["primary_paid_amount_cents"]
            secondary_paid_amount_cents = struct["secondary_paid_amount_cents"]
            tertiary_paid_amount_cents = struct["tertiary_paid_amount_cents"]
            patient_responsibility_cents = struct["patient_responsibility_cents"]
            diagnosis_id_zero = struct["diagnosis_id_zero"]
            diagnosis_id_one = struct["diagnosis_id_one"]
            diagnosis_id_two = struct["diagnosis_id_two"]
            diagnosis_id_three = struct["diagnosis_id_three"]
            if parsed_json["drug_identification"].nil?
              drug_identification = nil
            else
              drug_identification = parsed_json["drug_identification"].to_json
              drug_identification = CandidApiClient::ServiceLines::V2::Types::DrugIdentification.from_json(json_object: drug_identification)
            end
            if parsed_json["service_line_era_data"].nil?
              service_line_era_data = nil
            else
              service_line_era_data = parsed_json["service_line_era_data"].to_json
              service_line_era_data = CandidApiClient::ServiceLines::V2::Types::ServiceLineEraData.from_json(json_object: service_line_era_data)
            end
            service_line_manual_adjustments = parsed_json["service_line_manual_adjustments"]&.map do |item|
              item = item.to_json
              CandidApiClient::ServiceLines::V2::Types::ServiceLineAdjustment.from_json(json_object: item)
            end
            related_invoices = parsed_json["related_invoices"]&.map do |item|
              item = item.to_json
              CandidApiClient::Invoices::Types::Invoice.from_json(json_object: item)
            end
            related_invoice_info = parsed_json["related_invoice_info"]&.map do |item|
              item = item.to_json
              CandidApiClient::Invoices::V2::Types::InvoiceInfo.from_json(json_object: item)
            end
            if parsed_json["denial_reason"].nil?
              denial_reason = nil
            else
              denial_reason = parsed_json["denial_reason"].to_json
              denial_reason = CandidApiClient::ServiceLines::V2::Types::ServiceLineDenialReason.from_json(json_object: denial_reason)
            end
            place_of_service_code = struct["place_of_service_code"]
            place_of_service_code_as_submitted = struct["place_of_service_code_as_submitted"]
            service_line_id = struct["service_line_id"]
            procedure_code = struct["procedure_code"]
            if parsed_json["ordering_provider"].nil?
              ordering_provider = nil
            else
              ordering_provider = parsed_json["ordering_provider"].to_json
              ordering_provider = CandidApiClient::EncounterProviders::V2::Types::EncounterProvider.from_json(json_object: ordering_provider)
            end
            quantity = struct["quantity"]
            units = struct["units"]
            claim_id = struct["claim_id"]
            if parsed_json["date_of_service_range"].nil?
              date_of_service_range = nil
            else
              date_of_service_range = parsed_json["date_of_service_range"].to_json
              date_of_service_range = CandidApiClient::Commons::Types::DateRangeOptionalEnd.from_json(json_object: date_of_service_range)
            end
            description = struct["description"]
            date_of_service = (Date.parse(parsed_json["date_of_service"]) unless parsed_json["date_of_service"].nil?)
            end_date_of_service = unless parsed_json["end_date_of_service"].nil?
                                    Date.parse(parsed_json["end_date_of_service"])
                                  end
            if parsed_json["test_result"].nil?
              test_result = nil
            else
              test_result = parsed_json["test_result"].to_json
              test_result = CandidApiClient::ServiceLines::V2::Types::TestResult.from_json(json_object: test_result)
            end
            new(
              modifiers: modifiers,
              charge_amount_cents: charge_amount_cents,
              allowed_amount_cents: allowed_amount_cents,
              insurance_balance_cents: insurance_balance_cents,
              patient_balance_cents: patient_balance_cents,
              paid_amount_cents: paid_amount_cents,
              primary_paid_amount_cents: primary_paid_amount_cents,
              secondary_paid_amount_cents: secondary_paid_amount_cents,
              tertiary_paid_amount_cents: tertiary_paid_amount_cents,
              patient_responsibility_cents: patient_responsibility_cents,
              diagnosis_id_zero: diagnosis_id_zero,
              diagnosis_id_one: diagnosis_id_one,
              diagnosis_id_two: diagnosis_id_two,
              diagnosis_id_three: diagnosis_id_three,
              drug_identification: drug_identification,
              service_line_era_data: service_line_era_data,
              service_line_manual_adjustments: service_line_manual_adjustments,
              related_invoices: related_invoices,
              related_invoice_info: related_invoice_info,
              denial_reason: denial_reason,
              place_of_service_code: place_of_service_code,
              place_of_service_code_as_submitted: place_of_service_code_as_submitted,
              service_line_id: service_line_id,
              procedure_code: procedure_code,
              ordering_provider: ordering_provider,
              quantity: quantity,
              units: units,
              claim_id: claim_id,
              date_of_service_range: date_of_service_range,
              description: description,
              date_of_service: date_of_service,
              end_date_of_service: end_date_of_service,
              test_result: test_result,
              additional_properties: struct
            )
          end

          # Serialize an instance of ServiceLine to a JSON object
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
            obj.modifiers&.is_a?(Array) != false || raise("Passed value for field obj.modifiers is not the expected type, validation failed.")
            obj.charge_amount_cents&.is_a?(Integer) != false || raise("Passed value for field obj.charge_amount_cents is not the expected type, validation failed.")
            obj.allowed_amount_cents&.is_a?(Integer) != false || raise("Passed value for field obj.allowed_amount_cents is not the expected type, validation failed.")
            obj.insurance_balance_cents&.is_a?(Integer) != false || raise("Passed value for field obj.insurance_balance_cents is not the expected type, validation failed.")
            obj.patient_balance_cents&.is_a?(Integer) != false || raise("Passed value for field obj.patient_balance_cents is not the expected type, validation failed.")
            obj.paid_amount_cents&.is_a?(Integer) != false || raise("Passed value for field obj.paid_amount_cents is not the expected type, validation failed.")
            obj.primary_paid_amount_cents&.is_a?(Integer) != false || raise("Passed value for field obj.primary_paid_amount_cents is not the expected type, validation failed.")
            obj.secondary_paid_amount_cents&.is_a?(Integer) != false || raise("Passed value for field obj.secondary_paid_amount_cents is not the expected type, validation failed.")
            obj.tertiary_paid_amount_cents&.is_a?(Integer) != false || raise("Passed value for field obj.tertiary_paid_amount_cents is not the expected type, validation failed.")
            obj.patient_responsibility_cents&.is_a?(Integer) != false || raise("Passed value for field obj.patient_responsibility_cents is not the expected type, validation failed.")
            obj.diagnosis_id_zero&.is_a?(String) != false || raise("Passed value for field obj.diagnosis_id_zero is not the expected type, validation failed.")
            obj.diagnosis_id_one&.is_a?(String) != false || raise("Passed value for field obj.diagnosis_id_one is not the expected type, validation failed.")
            obj.diagnosis_id_two&.is_a?(String) != false || raise("Passed value for field obj.diagnosis_id_two is not the expected type, validation failed.")
            obj.diagnosis_id_three&.is_a?(String) != false || raise("Passed value for field obj.diagnosis_id_three is not the expected type, validation failed.")
            obj.drug_identification.nil? || CandidApiClient::ServiceLines::V2::Types::DrugIdentification.validate_raw(obj: obj.drug_identification)
            obj.service_line_era_data.nil? || CandidApiClient::ServiceLines::V2::Types::ServiceLineEraData.validate_raw(obj: obj.service_line_era_data)
            obj.service_line_manual_adjustments&.is_a?(Array) != false || raise("Passed value for field obj.service_line_manual_adjustments is not the expected type, validation failed.")
            obj.related_invoices&.is_a?(Array) != false || raise("Passed value for field obj.related_invoices is not the expected type, validation failed.")
            obj.related_invoice_info&.is_a?(Array) != false || raise("Passed value for field obj.related_invoice_info is not the expected type, validation failed.")
            obj.denial_reason.nil? || CandidApiClient::ServiceLines::V2::Types::ServiceLineDenialReason.validate_raw(obj: obj.denial_reason)
            obj.place_of_service_code&.is_a?(CandidApiClient::Commons::Types::FacilityTypeCode) != false || raise("Passed value for field obj.place_of_service_code is not the expected type, validation failed.")
            obj.place_of_service_code_as_submitted&.is_a?(CandidApiClient::Commons::Types::FacilityTypeCode) != false || raise("Passed value for field obj.place_of_service_code_as_submitted is not the expected type, validation failed.")
            obj.service_line_id.is_a?(String) != false || raise("Passed value for field obj.service_line_id is not the expected type, validation failed.")
            obj.procedure_code.is_a?(String) != false || raise("Passed value for field obj.procedure_code is not the expected type, validation failed.")
            obj.ordering_provider.nil? || CandidApiClient::EncounterProviders::V2::Types::EncounterProvider.validate_raw(obj: obj.ordering_provider)
            obj.quantity.is_a?(String) != false || raise("Passed value for field obj.quantity is not the expected type, validation failed.")
            obj.units.is_a?(CandidApiClient::Commons::Types::ServiceLineUnits) != false || raise("Passed value for field obj.units is not the expected type, validation failed.")
            obj.claim_id.is_a?(String) != false || raise("Passed value for field obj.claim_id is not the expected type, validation failed.")
            CandidApiClient::Commons::Types::DateRangeOptionalEnd.validate_raw(obj: obj.date_of_service_range)
            obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
            obj.date_of_service.is_a?(Date) != false || raise("Passed value for field obj.date_of_service is not the expected type, validation failed.")
            obj.end_date_of_service&.is_a?(Date) != false || raise("Passed value for field obj.end_date_of_service is not the expected type, validation failed.")
            obj.test_result.nil? || CandidApiClient::ServiceLines::V2::Types::TestResult.validate_raw(obj: obj.test_result)
          end
        end
      end
    end
  end
end
