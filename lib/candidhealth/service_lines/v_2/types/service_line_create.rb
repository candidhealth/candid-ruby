# frozen_string_literal: true

require_relative "../../../commons/types/procedure_modifier"
require_relative "../../../commons/types/service_line_units"
require_relative "drug_identification"
require_relative "../../../commons/types/facility_type_code"
require "date"
require_relative "../../../encounter_providers/v_2/types/referring_provider"
require_relative "../../../encounter_providers/v_2/types/initial_referring_provider"
require_relative "../../../encounter_providers/v_2/types/supervising_provider"
require_relative "../../../encounter_providers/v_2/types/ordering_provider"
require "ostruct"
require "json"

module CandidApiClient
  module ServiceLines
    module V2
      module Types
        class ServiceLineCreate
          # @return [Array<CandidApiClient::Commons::Types::ProcedureModifier>]
          attr_reader :modifiers
          # @return [String]
          attr_reader :procedure_code
          # @return [String] String representation of a Decimal that can be parsed by most libraries.
          #  A ServiceLine quantity cannot contain more than one digit of precision.
          #  Example: 1.1 is valid, 1.11 is not.
          attr_reader :quantity
          # @return [CandidApiClient::Commons::Types::ServiceLineUnits]
          attr_reader :units
          # @return [Integer] The total amount charged for this service line taking quantity into account. For
          #  example, if a single unit
          #  costs 100 cents and 2 units were rendered, the charge_amount_cents should be
          #  200. Should be greater than or
          #  equal to 0.
          attr_reader :charge_amount_cents
          # @return [Array<Integer>] Indices (zero-indexed) of all the diagnoses this service line references
          attr_reader :diagnosis_pointers
          # @return [CandidApiClient::ServiceLines::V2::Types::DrugIdentification]
          attr_reader :drug_identification
          # @return [CandidApiClient::Commons::Types::FacilityTypeCode]
          attr_reader :place_of_service_code
          # @return [String] A free-form description to clarify the related data elements and their content.
          #  Maps to SV1-01, C003-07 on the 837-P.
          attr_reader :description
          # @return [Date]
          attr_reader :date_of_service
          # @return [Date]
          attr_reader :end_date_of_service
          # @return [CandidApiClient::EncounterProviders::V2::Types::ReferringProvider] The final provider who referred the services that were rendered.
          #  All physicians who order services or refer Medicare beneficiaries must
          #  report this data.
          attr_reader :referring_provider
          # @return [CandidApiClient::EncounterProviders::V2::Types::InitialReferringProvider] The second iteration of Loop ID-2310. Use code "P3 - Primary Care Provider" in
          #  this loop to
          #  indicate the initial referral from the primary care provider or whatever
          #  provider wrote the initial referral for this patient's episode of care being
          #  billed/reported in this transaction.
          #  Information in Loop ID-2310 applies to the entire claim unless overridden on a
          #  service line by the presence of Loop ID-2420 with the same value in NM101.
          attr_reader :initial_referring_provider
          # @return [CandidApiClient::EncounterProviders::V2::Types::SupervisingProvider] Required when the rendering provider is supervised by a physician. If not
          #  required by this implementation guide, do not send.
          #  Information in Loop ID-2310 applies to the entire claim unless overridden on a
          #  service line by the presence of Loop ID-2420 with the same value in NM101.
          attr_reader :supervising_provider
          # @return [CandidApiClient::EncounterProviders::V2::Types::OrderingProvider] Required when the service or supply was ordered by a provider who is different
          #  than the rendering provider for this service line.
          #  If not required by this implementation guide, do not send.
          attr_reader :ordering_provider
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param modifiers [Array<CandidApiClient::Commons::Types::ProcedureModifier>]
          # @param procedure_code [String]
          # @param quantity [String] String representation of a Decimal that can be parsed by most libraries.
          #  A ServiceLine quantity cannot contain more than one digit of precision.
          #  Example: 1.1 is valid, 1.11 is not.
          # @param units [CandidApiClient::Commons::Types::ServiceLineUnits]
          # @param charge_amount_cents [Integer] The total amount charged for this service line taking quantity into account. For
          #  example, if a single unit
          #  costs 100 cents and 2 units were rendered, the charge_amount_cents should be
          #  200. Should be greater than or
          #  equal to 0.
          # @param diagnosis_pointers [Array<Integer>] Indices (zero-indexed) of all the diagnoses this service line references
          # @param drug_identification [CandidApiClient::ServiceLines::V2::Types::DrugIdentification]
          # @param place_of_service_code [CandidApiClient::Commons::Types::FacilityTypeCode]
          # @param description [String] A free-form description to clarify the related data elements and their content.
          #  Maps to SV1-01, C003-07 on the 837-P.
          # @param date_of_service [Date]
          # @param end_date_of_service [Date]
          # @param referring_provider [CandidApiClient::EncounterProviders::V2::Types::ReferringProvider] The final provider who referred the services that were rendered.
          #  All physicians who order services or refer Medicare beneficiaries must
          #  report this data.
          # @param initial_referring_provider [CandidApiClient::EncounterProviders::V2::Types::InitialReferringProvider] The second iteration of Loop ID-2310. Use code "P3 - Primary Care Provider" in
          #  this loop to
          #  indicate the initial referral from the primary care provider or whatever
          #  provider wrote the initial referral for this patient's episode of care being
          #  billed/reported in this transaction.
          #  Information in Loop ID-2310 applies to the entire claim unless overridden on a
          #  service line by the presence of Loop ID-2420 with the same value in NM101.
          # @param supervising_provider [CandidApiClient::EncounterProviders::V2::Types::SupervisingProvider] Required when the rendering provider is supervised by a physician. If not
          #  required by this implementation guide, do not send.
          #  Information in Loop ID-2310 applies to the entire claim unless overridden on a
          #  service line by the presence of Loop ID-2420 with the same value in NM101.
          # @param ordering_provider [CandidApiClient::EncounterProviders::V2::Types::OrderingProvider] Required when the service or supply was ordered by a provider who is different
          #  than the rendering provider for this service line.
          #  If not required by this implementation guide, do not send.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::ServiceLines::V2::Types::ServiceLineCreate]
          def initialize(procedure_code:, quantity:, units:, diagnosis_pointers:, modifiers: OMIT,
                         charge_amount_cents: OMIT, drug_identification: OMIT, place_of_service_code: OMIT, description: OMIT, date_of_service: OMIT, end_date_of_service: OMIT, referring_provider: OMIT, initial_referring_provider: OMIT, supervising_provider: OMIT, ordering_provider: OMIT, additional_properties: nil)
            @modifiers = modifiers if modifiers != OMIT
            @procedure_code = procedure_code
            @quantity = quantity
            @units = units
            @charge_amount_cents = charge_amount_cents if charge_amount_cents != OMIT
            @diagnosis_pointers = diagnosis_pointers
            @drug_identification = drug_identification if drug_identification != OMIT
            @place_of_service_code = place_of_service_code if place_of_service_code != OMIT
            @description = description if description != OMIT
            @date_of_service = date_of_service if date_of_service != OMIT
            @end_date_of_service = end_date_of_service if end_date_of_service != OMIT
            @referring_provider = referring_provider if referring_provider != OMIT
            @initial_referring_provider = initial_referring_provider if initial_referring_provider != OMIT
            @supervising_provider = supervising_provider if supervising_provider != OMIT
            @ordering_provider = ordering_provider if ordering_provider != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "modifiers": modifiers,
              "procedure_code": procedure_code,
              "quantity": quantity,
              "units": units,
              "charge_amount_cents": charge_amount_cents,
              "diagnosis_pointers": diagnosis_pointers,
              "drug_identification": drug_identification,
              "place_of_service_code": place_of_service_code,
              "description": description,
              "date_of_service": date_of_service,
              "end_date_of_service": end_date_of_service,
              "referring_provider": referring_provider,
              "initial_referring_provider": initial_referring_provider,
              "supervising_provider": supervising_provider,
              "ordering_provider": ordering_provider
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of ServiceLineCreate
          #
          # @param json_object [String]
          # @return [CandidApiClient::ServiceLines::V2::Types::ServiceLineCreate]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            modifiers = struct["modifiers"]
            procedure_code = struct["procedure_code"]
            quantity = struct["quantity"]
            units = struct["units"]
            charge_amount_cents = struct["charge_amount_cents"]
            diagnosis_pointers = struct["diagnosis_pointers"]
            if parsed_json["drug_identification"].nil?
              drug_identification = nil
            else
              drug_identification = parsed_json["drug_identification"].to_json
              drug_identification = CandidApiClient::ServiceLines::V2::Types::DrugIdentification.from_json(json_object: drug_identification)
            end
            place_of_service_code = struct["place_of_service_code"]
            description = struct["description"]
            date_of_service = (Date.parse(parsed_json["date_of_service"]) unless parsed_json["date_of_service"].nil?)
            end_date_of_service = unless parsed_json["end_date_of_service"].nil?
                                    Date.parse(parsed_json["end_date_of_service"])
                                  end
            if parsed_json["referring_provider"].nil?
              referring_provider = nil
            else
              referring_provider = parsed_json["referring_provider"].to_json
              referring_provider = CandidApiClient::EncounterProviders::V2::Types::ReferringProvider.from_json(json_object: referring_provider)
            end
            if parsed_json["initial_referring_provider"].nil?
              initial_referring_provider = nil
            else
              initial_referring_provider = parsed_json["initial_referring_provider"].to_json
              initial_referring_provider = CandidApiClient::EncounterProviders::V2::Types::InitialReferringProvider.from_json(json_object: initial_referring_provider)
            end
            if parsed_json["supervising_provider"].nil?
              supervising_provider = nil
            else
              supervising_provider = parsed_json["supervising_provider"].to_json
              supervising_provider = CandidApiClient::EncounterProviders::V2::Types::SupervisingProvider.from_json(json_object: supervising_provider)
            end
            if parsed_json["ordering_provider"].nil?
              ordering_provider = nil
            else
              ordering_provider = parsed_json["ordering_provider"].to_json
              ordering_provider = CandidApiClient::EncounterProviders::V2::Types::OrderingProvider.from_json(json_object: ordering_provider)
            end
            new(
              modifiers: modifiers,
              procedure_code: procedure_code,
              quantity: quantity,
              units: units,
              charge_amount_cents: charge_amount_cents,
              diagnosis_pointers: diagnosis_pointers,
              drug_identification: drug_identification,
              place_of_service_code: place_of_service_code,
              description: description,
              date_of_service: date_of_service,
              end_date_of_service: end_date_of_service,
              referring_provider: referring_provider,
              initial_referring_provider: initial_referring_provider,
              supervising_provider: supervising_provider,
              ordering_provider: ordering_provider,
              additional_properties: struct
            )
          end

          # Serialize an instance of ServiceLineCreate to a JSON object
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
            obj.procedure_code.is_a?(String) != false || raise("Passed value for field obj.procedure_code is not the expected type, validation failed.")
            obj.quantity.is_a?(String) != false || raise("Passed value for field obj.quantity is not the expected type, validation failed.")
            obj.units.is_a?(CandidApiClient::Commons::Types::ServiceLineUnits) != false || raise("Passed value for field obj.units is not the expected type, validation failed.")
            obj.charge_amount_cents&.is_a?(Integer) != false || raise("Passed value for field obj.charge_amount_cents is not the expected type, validation failed.")
            obj.diagnosis_pointers.is_a?(Array) != false || raise("Passed value for field obj.diagnosis_pointers is not the expected type, validation failed.")
            obj.drug_identification.nil? || CandidApiClient::ServiceLines::V2::Types::DrugIdentification.validate_raw(obj: obj.drug_identification)
            obj.place_of_service_code&.is_a?(CandidApiClient::Commons::Types::FacilityTypeCode) != false || raise("Passed value for field obj.place_of_service_code is not the expected type, validation failed.")
            obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
            obj.date_of_service&.is_a?(Date) != false || raise("Passed value for field obj.date_of_service is not the expected type, validation failed.")
            obj.end_date_of_service&.is_a?(Date) != false || raise("Passed value for field obj.end_date_of_service is not the expected type, validation failed.")
            obj.referring_provider.nil? || CandidApiClient::EncounterProviders::V2::Types::ReferringProvider.validate_raw(obj: obj.referring_provider)
            obj.initial_referring_provider.nil? || CandidApiClient::EncounterProviders::V2::Types::InitialReferringProvider.validate_raw(obj: obj.initial_referring_provider)
            obj.supervising_provider.nil? || CandidApiClient::EncounterProviders::V2::Types::SupervisingProvider.validate_raw(obj: obj.supervising_provider)
            obj.ordering_provider.nil? || CandidApiClient::EncounterProviders::V2::Types::OrderingProvider.validate_raw(obj: obj.ordering_provider)
          end
        end
      end
    end
  end
end
