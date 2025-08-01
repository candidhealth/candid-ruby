# frozen_string_literal: true

require_relative "../../../commons/types/procedure_modifier"
require_relative "drug_identification"
require_relative "service_line_denial_reason"
require_relative "../../../commons/types/facility_type_code"
require_relative "../../../commons/types/service_line_units"
require "date"
require_relative "test_result"
require "ostruct"
require "json"

module CandidApiClient
  module ServiceLines
    module V2
      module Types
        class ServiceLineUpdate
          # @return [String]
          attr_reader :edit_reason
          # @return [Array<CandidApiClient::Commons::Types::ProcedureModifier>]
          attr_reader :modifiers
          # @return [Integer] The total amount charged for this service line, factoring in quantity. If
          #  `procedure_code` is updated and this is not, the system will attempt
          #  to set it based on chargemasters entries and the service line's quantity. For
          #  example, if a single unit has an entry of 100 cents and 2
          #  units were rendered, the `charge_amount_cents` will be set to 200, if this field
          #  is unfilled.
          attr_reader :charge_amount_cents
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
          # @return [CandidApiClient::ServiceLines::V2::Types::ServiceLineDenialReason]
          attr_reader :denial_reason
          # @return [CandidApiClient::Commons::Types::FacilityTypeCode] 837p Loop2300, SV105. If your organization does not intend to submit claims with
          #  a different place of service at the service line level, this field should not be
          #  populated. 02 for telemedicine, 11 for in-person. Full list
          #  //www.cms.gov/Medicare/Coding/place-of-service-codes/Place_of_Service_Code_Set).
          attr_reader :place_of_service_code
          # @return [CandidApiClient::Commons::Types::ServiceLineUnits]
          attr_reader :units
          # @return [String] If `procedure_code` is updated, and `charge_amount_cents` is not, then
          #  `charge_amount_cents` will be set by the system.
          attr_reader :procedure_code
          # @return [String] String representation of a Decimal that can be parsed by most libraries.
          #  A ServiceLine quantity cannot contain more than one digit of precision.
          #  Example: 1.1 is valid, 1.11 is not.
          attr_reader :quantity
          # @return [String] A free-form description to clarify the related data elements and their content.
          #  Maps to SV1-01, C003-07 on the 837-P.
          attr_reader :description
          # @return [Date] date_of_service must be defined on either the encounter or the service lines but
          #  not both.
          attr_reader :date_of_service
          # @return [Date]
          attr_reader :end_date_of_service
          # @return [Array<CandidApiClient::ServiceLines::V2::Types::TestResult>] Contains a list of test results. Test result types may map to MEA-02 on the
          #  837-P (ex: Hemoglobin, Hematocrit).
          #  No more than 5 MEA-02 test results may be submitted per service line.
          #  Updating test results utilizes PUT semantics, so the test results on the service
          #  line will be set to whatever inputs are provided.
          attr_reader :test_results
          # @return [Boolean] Maps to SV1-11 on the 837-P and Box 24H on the CMS-1500.
          #  If the value is true, the box will be populated with "Y". Otherwise, the box
          #  will not be populated.
          attr_reader :has_epsdt_indicator
          # @return [Boolean] Maps to SV1-12 on the 837-P and Box 24I on the CMS-1500.
          #  If the value is true, the box will be populated with "Y". Otherwise, the box
          #  will not be populated.
          attr_reader :has_family_planning_indicator
          # @return [String] Maps to NTE02 loop 2400 on the EDI 837.
          attr_reader :note
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param edit_reason [String]
          # @param modifiers [Array<CandidApiClient::Commons::Types::ProcedureModifier>]
          # @param charge_amount_cents [Integer] The total amount charged for this service line, factoring in quantity. If
          #  `procedure_code` is updated and this is not, the system will attempt
          #  to set it based on chargemasters entries and the service line's quantity. For
          #  example, if a single unit has an entry of 100 cents and 2
          #  units were rendered, the `charge_amount_cents` will be set to 200, if this field
          #  is unfilled.
          # @param diagnosis_id_zero [String]
          # @param diagnosis_id_one [String]
          # @param diagnosis_id_two [String]
          # @param diagnosis_id_three [String]
          # @param drug_identification [CandidApiClient::ServiceLines::V2::Types::DrugIdentification]
          # @param denial_reason [CandidApiClient::ServiceLines::V2::Types::ServiceLineDenialReason]
          # @param place_of_service_code [CandidApiClient::Commons::Types::FacilityTypeCode] 837p Loop2300, SV105. If your organization does not intend to submit claims with
          #  a different place of service at the service line level, this field should not be
          #  populated. 02 for telemedicine, 11 for in-person. Full list
          #  //www.cms.gov/Medicare/Coding/place-of-service-codes/Place_of_Service_Code_Set).
          # @param units [CandidApiClient::Commons::Types::ServiceLineUnits]
          # @param procedure_code [String] If `procedure_code` is updated, and `charge_amount_cents` is not, then
          #  `charge_amount_cents` will be set by the system.
          # @param quantity [String] String representation of a Decimal that can be parsed by most libraries.
          #  A ServiceLine quantity cannot contain more than one digit of precision.
          #  Example: 1.1 is valid, 1.11 is not.
          # @param description [String] A free-form description to clarify the related data elements and their content.
          #  Maps to SV1-01, C003-07 on the 837-P.
          # @param date_of_service [Date] date_of_service must be defined on either the encounter or the service lines but
          #  not both.
          # @param end_date_of_service [Date]
          # @param test_results [Array<CandidApiClient::ServiceLines::V2::Types::TestResult>] Contains a list of test results. Test result types may map to MEA-02 on the
          #  837-P (ex: Hemoglobin, Hematocrit).
          #  No more than 5 MEA-02 test results may be submitted per service line.
          #  Updating test results utilizes PUT semantics, so the test results on the service
          #  line will be set to whatever inputs are provided.
          # @param has_epsdt_indicator [Boolean] Maps to SV1-11 on the 837-P and Box 24H on the CMS-1500.
          #  If the value is true, the box will be populated with "Y". Otherwise, the box
          #  will not be populated.
          # @param has_family_planning_indicator [Boolean] Maps to SV1-12 on the 837-P and Box 24I on the CMS-1500.
          #  If the value is true, the box will be populated with "Y". Otherwise, the box
          #  will not be populated.
          # @param note [String] Maps to NTE02 loop 2400 on the EDI 837.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::ServiceLines::V2::Types::ServiceLineUpdate]
          def initialize(edit_reason: OMIT, modifiers: OMIT, charge_amount_cents: OMIT, diagnosis_id_zero: OMIT,
                         diagnosis_id_one: OMIT, diagnosis_id_two: OMIT, diagnosis_id_three: OMIT, drug_identification: OMIT, denial_reason: OMIT, place_of_service_code: OMIT, units: OMIT, procedure_code: OMIT, quantity: OMIT, description: OMIT, date_of_service: OMIT, end_date_of_service: OMIT, test_results: OMIT, has_epsdt_indicator: OMIT, has_family_planning_indicator: OMIT, note: OMIT, additional_properties: nil)
            @edit_reason = edit_reason if edit_reason != OMIT
            @modifiers = modifiers if modifiers != OMIT
            @charge_amount_cents = charge_amount_cents if charge_amount_cents != OMIT
            @diagnosis_id_zero = diagnosis_id_zero if diagnosis_id_zero != OMIT
            @diagnosis_id_one = diagnosis_id_one if diagnosis_id_one != OMIT
            @diagnosis_id_two = diagnosis_id_two if diagnosis_id_two != OMIT
            @diagnosis_id_three = diagnosis_id_three if diagnosis_id_three != OMIT
            @drug_identification = drug_identification if drug_identification != OMIT
            @denial_reason = denial_reason if denial_reason != OMIT
            @place_of_service_code = place_of_service_code if place_of_service_code != OMIT
            @units = units if units != OMIT
            @procedure_code = procedure_code if procedure_code != OMIT
            @quantity = quantity if quantity != OMIT
            @description = description if description != OMIT
            @date_of_service = date_of_service if date_of_service != OMIT
            @end_date_of_service = end_date_of_service if end_date_of_service != OMIT
            @test_results = test_results if test_results != OMIT
            @has_epsdt_indicator = has_epsdt_indicator if has_epsdt_indicator != OMIT
            @has_family_planning_indicator = has_family_planning_indicator if has_family_planning_indicator != OMIT
            @note = note if note != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "edit_reason": edit_reason,
              "modifiers": modifiers,
              "charge_amount_cents": charge_amount_cents,
              "diagnosis_id_zero": diagnosis_id_zero,
              "diagnosis_id_one": diagnosis_id_one,
              "diagnosis_id_two": diagnosis_id_two,
              "diagnosis_id_three": diagnosis_id_three,
              "drug_identification": drug_identification,
              "denial_reason": denial_reason,
              "place_of_service_code": place_of_service_code,
              "units": units,
              "procedure_code": procedure_code,
              "quantity": quantity,
              "description": description,
              "date_of_service": date_of_service,
              "end_date_of_service": end_date_of_service,
              "test_results": test_results,
              "has_epsdt_indicator": has_epsdt_indicator,
              "has_family_planning_indicator": has_family_planning_indicator,
              "note": note
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of ServiceLineUpdate
          #
          # @param json_object [String]
          # @return [CandidApiClient::ServiceLines::V2::Types::ServiceLineUpdate]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            edit_reason = struct["edit_reason"]
            modifiers = struct["modifiers"]
            charge_amount_cents = struct["charge_amount_cents"]
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
            if parsed_json["denial_reason"].nil?
              denial_reason = nil
            else
              denial_reason = parsed_json["denial_reason"].to_json
              denial_reason = CandidApiClient::ServiceLines::V2::Types::ServiceLineDenialReason.from_json(json_object: denial_reason)
            end
            place_of_service_code = struct["place_of_service_code"]
            units = struct["units"]
            procedure_code = struct["procedure_code"]
            quantity = struct["quantity"]
            description = struct["description"]
            date_of_service = (Date.parse(parsed_json["date_of_service"]) unless parsed_json["date_of_service"].nil?)
            end_date_of_service = unless parsed_json["end_date_of_service"].nil?
                                    Date.parse(parsed_json["end_date_of_service"])
                                  end
            test_results = parsed_json["test_results"]&.map do |item|
              item = item.to_json
              CandidApiClient::ServiceLines::V2::Types::TestResult.from_json(json_object: item)
            end
            has_epsdt_indicator = struct["has_epsdt_indicator"]
            has_family_planning_indicator = struct["has_family_planning_indicator"]
            note = struct["note"]
            new(
              edit_reason: edit_reason,
              modifiers: modifiers,
              charge_amount_cents: charge_amount_cents,
              diagnosis_id_zero: diagnosis_id_zero,
              diagnosis_id_one: diagnosis_id_one,
              diagnosis_id_two: diagnosis_id_two,
              diagnosis_id_three: diagnosis_id_three,
              drug_identification: drug_identification,
              denial_reason: denial_reason,
              place_of_service_code: place_of_service_code,
              units: units,
              procedure_code: procedure_code,
              quantity: quantity,
              description: description,
              date_of_service: date_of_service,
              end_date_of_service: end_date_of_service,
              test_results: test_results,
              has_epsdt_indicator: has_epsdt_indicator,
              has_family_planning_indicator: has_family_planning_indicator,
              note: note,
              additional_properties: struct
            )
          end

          # Serialize an instance of ServiceLineUpdate to a JSON object
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
            obj.edit_reason&.is_a?(String) != false || raise("Passed value for field obj.edit_reason is not the expected type, validation failed.")
            obj.modifiers&.is_a?(Array) != false || raise("Passed value for field obj.modifiers is not the expected type, validation failed.")
            obj.charge_amount_cents&.is_a?(Integer) != false || raise("Passed value for field obj.charge_amount_cents is not the expected type, validation failed.")
            obj.diagnosis_id_zero&.is_a?(String) != false || raise("Passed value for field obj.diagnosis_id_zero is not the expected type, validation failed.")
            obj.diagnosis_id_one&.is_a?(String) != false || raise("Passed value for field obj.diagnosis_id_one is not the expected type, validation failed.")
            obj.diagnosis_id_two&.is_a?(String) != false || raise("Passed value for field obj.diagnosis_id_two is not the expected type, validation failed.")
            obj.diagnosis_id_three&.is_a?(String) != false || raise("Passed value for field obj.diagnosis_id_three is not the expected type, validation failed.")
            obj.drug_identification.nil? || CandidApiClient::ServiceLines::V2::Types::DrugIdentification.validate_raw(obj: obj.drug_identification)
            obj.denial_reason.nil? || CandidApiClient::ServiceLines::V2::Types::ServiceLineDenialReason.validate_raw(obj: obj.denial_reason)
            obj.place_of_service_code&.is_a?(CandidApiClient::Commons::Types::FacilityTypeCode) != false || raise("Passed value for field obj.place_of_service_code is not the expected type, validation failed.")
            obj.units&.is_a?(CandidApiClient::Commons::Types::ServiceLineUnits) != false || raise("Passed value for field obj.units is not the expected type, validation failed.")
            obj.procedure_code&.is_a?(String) != false || raise("Passed value for field obj.procedure_code is not the expected type, validation failed.")
            obj.quantity&.is_a?(String) != false || raise("Passed value for field obj.quantity is not the expected type, validation failed.")
            obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
            obj.date_of_service&.is_a?(Date) != false || raise("Passed value for field obj.date_of_service is not the expected type, validation failed.")
            obj.end_date_of_service&.is_a?(Date) != false || raise("Passed value for field obj.end_date_of_service is not the expected type, validation failed.")
            obj.test_results&.is_a?(Array) != false || raise("Passed value for field obj.test_results is not the expected type, validation failed.")
            obj.has_epsdt_indicator&.is_a?(Boolean) != false || raise("Passed value for field obj.has_epsdt_indicator is not the expected type, validation failed.")
            obj.has_family_planning_indicator&.is_a?(Boolean) != false || raise("Passed value for field obj.has_family_planning_indicator is not the expected type, validation failed.")
            obj.note&.is_a?(String) != false || raise("Passed value for field obj.note is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
