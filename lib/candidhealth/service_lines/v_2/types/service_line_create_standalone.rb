# frozen_string_literal: true

require_relative "../../../commons/types/procedure_modifier"
require_relative "service_line_adjustment"
require_relative "service_line_denial_reason"
require_relative "../../../commons/types/facility_type_code"
require_relative "../../../commons/types/service_line_units"
require "date"
require "ostruct"
require "json"

module CandidApiClient
  module ServiceLines
    module V2
      module Types
        class ServiceLineCreateStandalone
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
          # @return [Array<CandidApiClient::ServiceLines::V2::Types::ServiceLineAdjustment>]
          attr_reader :service_line_manual_adjustments
          # @return [CandidApiClient::ServiceLines::V2::Types::ServiceLineDenialReason]
          attr_reader :denial_reason
          # @return [CandidApiClient::Commons::Types::FacilityTypeCode]
          attr_reader :place_of_service_code
          # @return [CandidApiClient::Commons::Types::FacilityTypeCode]
          attr_reader :place_of_service_code_as_submitted
          # @return [String]
          attr_reader :procedure_code
          # @return [String] String representation of a Decimal that can be parsed by most libraries.
          #  A ServiceLine quantity cannot contain more than one digit of precision.
          #  Example: 1.1 is valid, 1.11 is not.
          attr_reader :quantity
          # @return [CandidApiClient::Commons::Types::ServiceLineUnits]
          attr_reader :units
          # @return [String]
          attr_reader :claim_id
          # @return [String] A free-form description to clarify the related data elements and their content.
          #  Maps to SV1-01, C003-07 on the 837-P.
          attr_reader :description
          # @return [Date]
          attr_reader :date_of_service
          # @return [Date]
          attr_reader :end_date_of_service
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
          # @param primary_paid_amount_cents [Integer]
          # @param secondary_paid_amount_cents [Integer]
          # @param tertiary_paid_amount_cents [Integer]
          # @param patient_responsibility_cents [Integer]
          # @param diagnosis_id_zero [String]
          # @param diagnosis_id_one [String]
          # @param diagnosis_id_two [String]
          # @param diagnosis_id_three [String]
          # @param service_line_manual_adjustments [Array<CandidApiClient::ServiceLines::V2::Types::ServiceLineAdjustment>]
          # @param denial_reason [CandidApiClient::ServiceLines::V2::Types::ServiceLineDenialReason]
          # @param place_of_service_code [CandidApiClient::Commons::Types::FacilityTypeCode]
          # @param place_of_service_code_as_submitted [CandidApiClient::Commons::Types::FacilityTypeCode]
          # @param procedure_code [String]
          # @param quantity [String] String representation of a Decimal that can be parsed by most libraries.
          #  A ServiceLine quantity cannot contain more than one digit of precision.
          #  Example: 1.1 is valid, 1.11 is not.
          # @param units [CandidApiClient::Commons::Types::ServiceLineUnits]
          # @param claim_id [String]
          # @param description [String] A free-form description to clarify the related data elements and their content.
          #  Maps to SV1-01, C003-07 on the 837-P.
          # @param date_of_service [Date]
          # @param end_date_of_service [Date]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::ServiceLines::V2::Types::ServiceLineCreateStandalone]
          def initialize(procedure_code:, quantity:, units:, claim_id:, modifiers: OMIT, charge_amount_cents: OMIT, allowed_amount_cents: OMIT,
                         insurance_balance_cents: OMIT, patient_balance_cents: OMIT, primary_paid_amount_cents: OMIT, secondary_paid_amount_cents: OMIT, tertiary_paid_amount_cents: OMIT, patient_responsibility_cents: OMIT, diagnosis_id_zero: OMIT, diagnosis_id_one: OMIT, diagnosis_id_two: OMIT, diagnosis_id_three: OMIT, service_line_manual_adjustments: OMIT, denial_reason: OMIT, place_of_service_code: OMIT, place_of_service_code_as_submitted: OMIT, description: OMIT, date_of_service: OMIT, end_date_of_service: OMIT, additional_properties: nil)
            @modifiers = modifiers if modifiers != OMIT
            @charge_amount_cents = charge_amount_cents if charge_amount_cents != OMIT
            @allowed_amount_cents = allowed_amount_cents if allowed_amount_cents != OMIT
            @insurance_balance_cents = insurance_balance_cents if insurance_balance_cents != OMIT
            @patient_balance_cents = patient_balance_cents if patient_balance_cents != OMIT
            @primary_paid_amount_cents = primary_paid_amount_cents if primary_paid_amount_cents != OMIT
            @secondary_paid_amount_cents = secondary_paid_amount_cents if secondary_paid_amount_cents != OMIT
            @tertiary_paid_amount_cents = tertiary_paid_amount_cents if tertiary_paid_amount_cents != OMIT
            @patient_responsibility_cents = patient_responsibility_cents if patient_responsibility_cents != OMIT
            @diagnosis_id_zero = diagnosis_id_zero if diagnosis_id_zero != OMIT
            @diagnosis_id_one = diagnosis_id_one if diagnosis_id_one != OMIT
            @diagnosis_id_two = diagnosis_id_two if diagnosis_id_two != OMIT
            @diagnosis_id_three = diagnosis_id_three if diagnosis_id_three != OMIT
            if service_line_manual_adjustments != OMIT
              @service_line_manual_adjustments = service_line_manual_adjustments
            end
            @denial_reason = denial_reason if denial_reason != OMIT
            @place_of_service_code = place_of_service_code if place_of_service_code != OMIT
            if place_of_service_code_as_submitted != OMIT
              @place_of_service_code_as_submitted = place_of_service_code_as_submitted
            end
            @procedure_code = procedure_code
            @quantity = quantity
            @units = units
            @claim_id = claim_id
            @description = description if description != OMIT
            @date_of_service = date_of_service if date_of_service != OMIT
            @end_date_of_service = end_date_of_service if end_date_of_service != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "modifiers": modifiers,
              "charge_amount_cents": charge_amount_cents,
              "allowed_amount_cents": allowed_amount_cents,
              "insurance_balance_cents": insurance_balance_cents,
              "patient_balance_cents": patient_balance_cents,
              "primary_paid_amount_cents": primary_paid_amount_cents,
              "secondary_paid_amount_cents": secondary_paid_amount_cents,
              "tertiary_paid_amount_cents": tertiary_paid_amount_cents,
              "patient_responsibility_cents": patient_responsibility_cents,
              "diagnosis_id_zero": diagnosis_id_zero,
              "diagnosis_id_one": diagnosis_id_one,
              "diagnosis_id_two": diagnosis_id_two,
              "diagnosis_id_three": diagnosis_id_three,
              "service_line_manual_adjustments": service_line_manual_adjustments,
              "denial_reason": denial_reason,
              "place_of_service_code": place_of_service_code,
              "place_of_service_code_as_submitted": place_of_service_code_as_submitted,
              "procedure_code": procedure_code,
              "quantity": quantity,
              "units": units,
              "claim_id": claim_id,
              "description": description,
              "date_of_service": date_of_service,
              "end_date_of_service": end_date_of_service
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of ServiceLineCreateStandalone
          #
          # @param json_object [String]
          # @return [CandidApiClient::ServiceLines::V2::Types::ServiceLineCreateStandalone]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            modifiers = struct["modifiers"]
            charge_amount_cents = struct["charge_amount_cents"]
            allowed_amount_cents = struct["allowed_amount_cents"]
            insurance_balance_cents = struct["insurance_balance_cents"]
            patient_balance_cents = struct["patient_balance_cents"]
            primary_paid_amount_cents = struct["primary_paid_amount_cents"]
            secondary_paid_amount_cents = struct["secondary_paid_amount_cents"]
            tertiary_paid_amount_cents = struct["tertiary_paid_amount_cents"]
            patient_responsibility_cents = struct["patient_responsibility_cents"]
            diagnosis_id_zero = struct["diagnosis_id_zero"]
            diagnosis_id_one = struct["diagnosis_id_one"]
            diagnosis_id_two = struct["diagnosis_id_two"]
            diagnosis_id_three = struct["diagnosis_id_three"]
            service_line_manual_adjustments = parsed_json["service_line_manual_adjustments"]&.map do |item|
              item = item.to_json
              CandidApiClient::ServiceLines::V2::Types::ServiceLineAdjustment.from_json(json_object: item)
            end
            if parsed_json["denial_reason"].nil?
              denial_reason = nil
            else
              denial_reason = parsed_json["denial_reason"].to_json
              denial_reason = CandidApiClient::ServiceLines::V2::Types::ServiceLineDenialReason.from_json(json_object: denial_reason)
            end
            place_of_service_code = struct["place_of_service_code"]
            place_of_service_code_as_submitted = struct["place_of_service_code_as_submitted"]
            procedure_code = struct["procedure_code"]
            quantity = struct["quantity"]
            units = struct["units"]
            claim_id = struct["claim_id"]
            description = struct["description"]
            date_of_service = (Date.parse(parsed_json["date_of_service"]) unless parsed_json["date_of_service"].nil?)
            end_date_of_service = unless parsed_json["end_date_of_service"].nil?
                                    Date.parse(parsed_json["end_date_of_service"])
                                  end
            new(
              modifiers: modifiers,
              charge_amount_cents: charge_amount_cents,
              allowed_amount_cents: allowed_amount_cents,
              insurance_balance_cents: insurance_balance_cents,
              patient_balance_cents: patient_balance_cents,
              primary_paid_amount_cents: primary_paid_amount_cents,
              secondary_paid_amount_cents: secondary_paid_amount_cents,
              tertiary_paid_amount_cents: tertiary_paid_amount_cents,
              patient_responsibility_cents: patient_responsibility_cents,
              diagnosis_id_zero: diagnosis_id_zero,
              diagnosis_id_one: diagnosis_id_one,
              diagnosis_id_two: diagnosis_id_two,
              diagnosis_id_three: diagnosis_id_three,
              service_line_manual_adjustments: service_line_manual_adjustments,
              denial_reason: denial_reason,
              place_of_service_code: place_of_service_code,
              place_of_service_code_as_submitted: place_of_service_code_as_submitted,
              procedure_code: procedure_code,
              quantity: quantity,
              units: units,
              claim_id: claim_id,
              description: description,
              date_of_service: date_of_service,
              end_date_of_service: end_date_of_service,
              additional_properties: struct
            )
          end

          # Serialize an instance of ServiceLineCreateStandalone to a JSON object
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
            obj.primary_paid_amount_cents&.is_a?(Integer) != false || raise("Passed value for field obj.primary_paid_amount_cents is not the expected type, validation failed.")
            obj.secondary_paid_amount_cents&.is_a?(Integer) != false || raise("Passed value for field obj.secondary_paid_amount_cents is not the expected type, validation failed.")
            obj.tertiary_paid_amount_cents&.is_a?(Integer) != false || raise("Passed value for field obj.tertiary_paid_amount_cents is not the expected type, validation failed.")
            obj.patient_responsibility_cents&.is_a?(Integer) != false || raise("Passed value for field obj.patient_responsibility_cents is not the expected type, validation failed.")
            obj.diagnosis_id_zero&.is_a?(String) != false || raise("Passed value for field obj.diagnosis_id_zero is not the expected type, validation failed.")
            obj.diagnosis_id_one&.is_a?(String) != false || raise("Passed value for field obj.diagnosis_id_one is not the expected type, validation failed.")
            obj.diagnosis_id_two&.is_a?(String) != false || raise("Passed value for field obj.diagnosis_id_two is not the expected type, validation failed.")
            obj.diagnosis_id_three&.is_a?(String) != false || raise("Passed value for field obj.diagnosis_id_three is not the expected type, validation failed.")
            obj.service_line_manual_adjustments&.is_a?(Array) != false || raise("Passed value for field obj.service_line_manual_adjustments is not the expected type, validation failed.")
            obj.denial_reason.nil? || CandidApiClient::ServiceLines::V2::Types::ServiceLineDenialReason.validate_raw(obj: obj.denial_reason)
            obj.place_of_service_code&.is_a?(CandidApiClient::Commons::Types::FacilityTypeCode) != false || raise("Passed value for field obj.place_of_service_code is not the expected type, validation failed.")
            obj.place_of_service_code_as_submitted&.is_a?(CandidApiClient::Commons::Types::FacilityTypeCode) != false || raise("Passed value for field obj.place_of_service_code_as_submitted is not the expected type, validation failed.")
            obj.procedure_code.is_a?(String) != false || raise("Passed value for field obj.procedure_code is not the expected type, validation failed.")
            obj.quantity.is_a?(String) != false || raise("Passed value for field obj.quantity is not the expected type, validation failed.")
            obj.units.is_a?(CandidApiClient::Commons::Types::ServiceLineUnits) != false || raise("Passed value for field obj.units is not the expected type, validation failed.")
            obj.claim_id.is_a?(String) != false || raise("Passed value for field obj.claim_id is not the expected type, validation failed.")
            obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
            obj.date_of_service&.is_a?(Date) != false || raise("Passed value for field obj.date_of_service is not the expected type, validation failed.")
            obj.end_date_of_service&.is_a?(Date) != false || raise("Passed value for field obj.end_date_of_service is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
