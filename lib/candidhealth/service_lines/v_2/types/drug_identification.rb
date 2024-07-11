# frozen_string_literal: true

require_relative "service_id_qualifier"
require_relative "measurement_unit_code"
require "ostruct"
require "json"

module CandidApiClient
  module ServiceLines
    module V2
      module Types
        class DrugIdentification
          # @return [CandidApiClient::ServiceLines::V2::Types::ServiceIdQualifier]
          attr_reader :service_id_qualifier
          # @return [String]
          attr_reader :national_drug_code
          # @return [String]
          attr_reader :national_drug_unit_count
          # @return [CandidApiClient::ServiceLines::V2::Types::MeasurementUnitCode]
          attr_reader :measurement_unit_code
          # @return [String]
          attr_reader :link_sequence_number
          # @return [String]
          attr_reader :pharmacy_prescription_number
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param service_id_qualifier [CandidApiClient::ServiceLines::V2::Types::ServiceIdQualifier]
          # @param national_drug_code [String]
          # @param national_drug_unit_count [String]
          # @param measurement_unit_code [CandidApiClient::ServiceLines::V2::Types::MeasurementUnitCode]
          # @param link_sequence_number [String]
          # @param pharmacy_prescription_number [String]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::ServiceLines::V2::Types::DrugIdentification]
          def initialize(service_id_qualifier:, national_drug_code:, national_drug_unit_count:, measurement_unit_code:,
                         link_sequence_number: OMIT, pharmacy_prescription_number: OMIT, additional_properties: nil)
            @service_id_qualifier = service_id_qualifier
            @national_drug_code = national_drug_code
            @national_drug_unit_count = national_drug_unit_count
            @measurement_unit_code = measurement_unit_code
            @link_sequence_number = link_sequence_number if link_sequence_number != OMIT
            @pharmacy_prescription_number = pharmacy_prescription_number if pharmacy_prescription_number != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "service_id_qualifier": service_id_qualifier,
              "national_drug_code": national_drug_code,
              "national_drug_unit_count": national_drug_unit_count,
              "measurement_unit_code": measurement_unit_code,
              "link_sequence_number": link_sequence_number,
              "pharmacy_prescription_number": pharmacy_prescription_number
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of DrugIdentification
          #
          # @param json_object [String]
          # @return [CandidApiClient::ServiceLines::V2::Types::DrugIdentification]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            service_id_qualifier = struct["service_id_qualifier"]
            national_drug_code = struct["national_drug_code"]
            national_drug_unit_count = struct["national_drug_unit_count"]
            measurement_unit_code = struct["measurement_unit_code"]
            link_sequence_number = struct["link_sequence_number"]
            pharmacy_prescription_number = struct["pharmacy_prescription_number"]
            new(
              service_id_qualifier: service_id_qualifier,
              national_drug_code: national_drug_code,
              national_drug_unit_count: national_drug_unit_count,
              measurement_unit_code: measurement_unit_code,
              link_sequence_number: link_sequence_number,
              pharmacy_prescription_number: pharmacy_prescription_number,
              additional_properties: struct
            )
          end

          # Serialize an instance of DrugIdentification to a JSON object
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
            obj.service_id_qualifier.is_a?(CandidApiClient::ServiceLines::V2::Types::ServiceIdQualifier) != false || raise("Passed value for field obj.service_id_qualifier is not the expected type, validation failed.")
            obj.national_drug_code.is_a?(String) != false || raise("Passed value for field obj.national_drug_code is not the expected type, validation failed.")
            obj.national_drug_unit_count.is_a?(String) != false || raise("Passed value for field obj.national_drug_unit_count is not the expected type, validation failed.")
            obj.measurement_unit_code.is_a?(CandidApiClient::ServiceLines::V2::Types::MeasurementUnitCode) != false || raise("Passed value for field obj.measurement_unit_code is not the expected type, validation failed.")
            obj.link_sequence_number&.is_a?(String) != false || raise("Passed value for field obj.link_sequence_number is not the expected type, validation failed.")
            obj.pharmacy_prescription_number&.is_a?(String) != false || raise("Passed value for field obj.pharmacy_prescription_number is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
