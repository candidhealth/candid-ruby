# frozen_string_literal: true

require_relative "../../../commons/types/procedure_modifier"
require_relative "../../../commons/types/decimal"
require_relative "../../../commons/types/service_line_units"
require_relative "drug_identification"
require_relative "../../../commons/types/facility_type_code"
require "date"
require "json"

module CandidApiClient
  module ServiceLines
    module V2
      class ServiceLineCreate
        attr_reader :modifiers, :procedure_code, :quantity, :units, :charge_amount_cents, :diagnosis_pointers,
                    :drug_identification, :place_of_service_code, :description, :date_of_service, :end_date_of_service, :additional_properties

        # @param modifiers [Array<Commons::ProcedureModifier>]
        # @param procedure_code [String]
        # @param quantity [Commons::DECIMAL] String representation of a Decimal that can be parsed by most libraries.
        #   A ServiceLine quantity cannot contain more than one digit of precision.
        #   Example: 1.1 is valid, 1.11 is not.
        # @param units [Commons::ServiceLineUnits]
        # @param charge_amount_cents [Integer] The total amount charged for this service line taking quantity into account. For example, if a single unit
        #   costs 100 cents and 2 units were rendered, the charge_amount_cents should be 200. Should be greater than or
        #   equal to 0.
        # @param diagnosis_pointers [Array<Integer>] Indices (zero-indexed) of all the diagnoses this service line references
        # @param drug_identification [ServiceLines::V2::DrugIdentification]
        # @param place_of_service_code [Commons::FacilityTypeCode]
        # @param description [String] A free-form description to clarify the related data elements and their content. Maps to SV1-01, C003-07 on the 837-P.
        # @param date_of_service [Date]
        # @param end_date_of_service [Date]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [ServiceLines::V2::ServiceLineCreate]
        def initialize(procedure_code:, quantity:, units:, diagnosis_pointers:, modifiers: nil,
                       charge_amount_cents: nil, drug_identification: nil, place_of_service_code: nil, description: nil, date_of_service: nil, end_date_of_service: nil, additional_properties: nil)
          # @type [Array<Commons::ProcedureModifier>]
          @modifiers = modifiers
          # @type [String]
          @procedure_code = procedure_code
          # @type [Commons::DECIMAL] String representation of a Decimal that can be parsed by most libraries.
          #   A ServiceLine quantity cannot contain more than one digit of precision.
          #   Example: 1.1 is valid, 1.11 is not.
          @quantity = quantity
          # @type [Commons::ServiceLineUnits]
          @units = units
          # @type [Integer] The total amount charged for this service line taking quantity into account. For example, if a single unit
          #   costs 100 cents and 2 units were rendered, the charge_amount_cents should be 200. Should be greater than or
          #   equal to 0.
          @charge_amount_cents = charge_amount_cents
          # @type [Array<Integer>] Indices (zero-indexed) of all the diagnoses this service line references
          @diagnosis_pointers = diagnosis_pointers
          # @type [ServiceLines::V2::DrugIdentification]
          @drug_identification = drug_identification
          # @type [Commons::FacilityTypeCode]
          @place_of_service_code = place_of_service_code
          # @type [String] A free-form description to clarify the related data elements and their content. Maps to SV1-01, C003-07 on the 837-P.
          @description = description
          # @type [Date]
          @date_of_service = date_of_service
          # @type [Date]
          @end_date_of_service = end_date_of_service
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of ServiceLineCreate
        #
        # @param json_object [JSON]
        # @return [ServiceLines::V2::ServiceLineCreate]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          modifiers = struct.modifiers
          procedure_code = struct.procedure_code
          quantity = struct.quantity
          units = struct.units
          charge_amount_cents = struct.charge_amount_cents
          diagnosis_pointers = struct.diagnosis_pointers
          if parsed_json["drug_identification"].nil?
            drug_identification = nil
          else
            drug_identification = parsed_json["drug_identification"].to_json
            drug_identification = ServiceLines::V2::DrugIdentification.from_json(json_object: drug_identification)
          end
          place_of_service_code = struct.place_of_service_code
          description = struct.description
          date_of_service = (Date.parse(parsed_json["date_of_service"]) unless parsed_json["date_of_service"].nil?)
          end_date_of_service = unless parsed_json["end_date_of_service"].nil?
                                  Date.parse(parsed_json["end_date_of_service"])
                                end
          new(modifiers: modifiers, procedure_code: procedure_code, quantity: quantity, units: units,
              charge_amount_cents: charge_amount_cents, diagnosis_pointers: diagnosis_pointers, drug_identification: drug_identification, place_of_service_code: place_of_service_code, description: description, date_of_service: date_of_service, end_date_of_service: end_date_of_service, additional_properties: struct)
        end

        # Serialize an instance of ServiceLineCreate to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "modifiers": @modifiers,
            "procedure_code": @procedure_code,
            "quantity": @quantity,
            "units": @units,
            "charge_amount_cents": @charge_amount_cents,
            "diagnosis_pointers": @diagnosis_pointers,
            "drug_identification": @drug_identification,
            "place_of_service_code": @place_of_service_code,
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
          obj.procedure_code.is_a?(String) != false || raise("Passed value for field obj.procedure_code is not the expected type, validation failed.")
          obj.quantity.is_a?(String) != false || raise("Passed value for field obj.quantity is not the expected type, validation failed.")
          obj.units.is_a?(Commons::ServiceLineUnits) != false || raise("Passed value for field obj.units is not the expected type, validation failed.")
          obj.charge_amount_cents&.is_a?(Integer) != false || raise("Passed value for field obj.charge_amount_cents is not the expected type, validation failed.")
          obj.diagnosis_pointers.is_a?(Array) != false || raise("Passed value for field obj.diagnosis_pointers is not the expected type, validation failed.")
          obj.drug_identification.nil? || ServiceLines::V2::DrugIdentification.validate_raw(obj: obj.drug_identification)
          obj.place_of_service_code&.is_a?(Commons::FacilityTypeCode) != false || raise("Passed value for field obj.place_of_service_code is not the expected type, validation failed.")
          obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
          obj.date_of_service&.is_a?(Date) != false || raise("Passed value for field obj.date_of_service is not the expected type, validation failed.")
          obj.end_date_of_service&.is_a?(Date) != false || raise("Passed value for field obj.end_date_of_service is not the expected type, validation failed.")
        end
      end
    end
  end
end
