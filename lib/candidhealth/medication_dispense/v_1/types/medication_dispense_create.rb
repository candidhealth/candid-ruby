# frozen_string_literal: true

require_relative "../../../commons/types/service_line_units"
require "date"
require_relative "../../../service_lines/v_2/types/drug_identification"
require_relative "../../../commons/types/procedure_modifier"
require "ostruct"
require "json"

module CandidApiClient
  module MedicationDispense
    module V1
      module Types
        class MedicationDispenseCreate
          # @return [String]
          attr_reader :medication_dispense_external_id
          # @return [String]
          attr_reader :patient_external_id
          # @return [String]
          attr_reader :procedure_code
          # @return [String]
          attr_reader :quantity
          # @return [CandidApiClient::Commons::Types::ServiceLineUnits]
          attr_reader :units
          # @return [Date]
          attr_reader :date_of_service
          # @return [CandidApiClient::ServiceLines::V2::Types::DrugIdentification]
          attr_reader :drug_identification
          # @return [String]
          attr_reader :description
          # @return [Array<CandidApiClient::Commons::Types::ProcedureModifier>]
          attr_reader :modifiers
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param medication_dispense_external_id [String]
          # @param patient_external_id [String]
          # @param procedure_code [String]
          # @param quantity [String]
          # @param units [CandidApiClient::Commons::Types::ServiceLineUnits]
          # @param date_of_service [Date]
          # @param drug_identification [CandidApiClient::ServiceLines::V2::Types::DrugIdentification]
          # @param description [String]
          # @param modifiers [Array<CandidApiClient::Commons::Types::ProcedureModifier>]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::MedicationDispense::V1::Types::MedicationDispenseCreate]
          def initialize(medication_dispense_external_id:, patient_external_id:, procedure_code:, quantity:, units:,
                         date_of_service:, drug_identification: OMIT, description: OMIT, modifiers: OMIT, additional_properties: nil)
            @medication_dispense_external_id = medication_dispense_external_id
            @patient_external_id = patient_external_id
            @procedure_code = procedure_code
            @quantity = quantity
            @units = units
            @date_of_service = date_of_service
            @drug_identification = drug_identification if drug_identification != OMIT
            @description = description if description != OMIT
            @modifiers = modifiers if modifiers != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "medication_dispense_external_id": medication_dispense_external_id,
              "patient_external_id": patient_external_id,
              "procedure_code": procedure_code,
              "quantity": quantity,
              "units": units,
              "date_of_service": date_of_service,
              "drug_identification": drug_identification,
              "description": description,
              "modifiers": modifiers
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of MedicationDispenseCreate
          #
          # @param json_object [String]
          # @return [CandidApiClient::MedicationDispense::V1::Types::MedicationDispenseCreate]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            medication_dispense_external_id = struct["medication_dispense_external_id"]
            patient_external_id = struct["patient_external_id"]
            procedure_code = struct["procedure_code"]
            quantity = struct["quantity"]
            units = struct["units"]
            date_of_service = (Date.parse(parsed_json["date_of_service"]) unless parsed_json["date_of_service"].nil?)
            if parsed_json["drug_identification"].nil?
              drug_identification = nil
            else
              drug_identification = parsed_json["drug_identification"].to_json
              drug_identification = CandidApiClient::ServiceLines::V2::Types::DrugIdentification.from_json(json_object: drug_identification)
            end
            description = struct["description"]
            modifiers = struct["modifiers"]
            new(
              medication_dispense_external_id: medication_dispense_external_id,
              patient_external_id: patient_external_id,
              procedure_code: procedure_code,
              quantity: quantity,
              units: units,
              date_of_service: date_of_service,
              drug_identification: drug_identification,
              description: description,
              modifiers: modifiers,
              additional_properties: struct
            )
          end

          # Serialize an instance of MedicationDispenseCreate to a JSON object
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
            obj.medication_dispense_external_id.is_a?(String) != false || raise("Passed value for field obj.medication_dispense_external_id is not the expected type, validation failed.")
            obj.patient_external_id.is_a?(String) != false || raise("Passed value for field obj.patient_external_id is not the expected type, validation failed.")
            obj.procedure_code.is_a?(String) != false || raise("Passed value for field obj.procedure_code is not the expected type, validation failed.")
            obj.quantity.is_a?(String) != false || raise("Passed value for field obj.quantity is not the expected type, validation failed.")
            obj.units.is_a?(CandidApiClient::Commons::Types::ServiceLineUnits) != false || raise("Passed value for field obj.units is not the expected type, validation failed.")
            obj.date_of_service.is_a?(Date) != false || raise("Passed value for field obj.date_of_service is not the expected type, validation failed.")
            obj.drug_identification.nil? || CandidApiClient::ServiceLines::V2::Types::DrugIdentification.validate_raw(obj: obj.drug_identification)
            obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
            obj.modifiers&.is_a?(Array) != false || raise("Passed value for field obj.modifiers is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
