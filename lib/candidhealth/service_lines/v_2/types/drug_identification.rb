# frozen_string_literal: true

require_relative "service_id_qualifier"
require_relative "measurement_unit_code"
require "json"

module CandidApiClient
  module ServiceLines
    module V2
      class DrugIdentification
        attr_reader :service_id_qualifier, :national_drug_code, :national_drug_unit_count, :measurement_unit_code,
                    :link_sequence_number, :pharmacy_prescription_number, :additional_properties

        # @param service_id_qualifier [ServiceLines::V2::ServiceIdQualifier]
        # @param national_drug_code [String]
        # @param national_drug_unit_count [String]
        # @param measurement_unit_code [ServiceLines::V2::MeasurementUnitCode]
        # @param link_sequence_number [String]
        # @param pharmacy_prescription_number [String]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [ServiceLines::V2::DrugIdentification]
        def initialize(service_id_qualifier:, national_drug_code:, national_drug_unit_count:, measurement_unit_code:,
                       link_sequence_number: nil, pharmacy_prescription_number: nil, additional_properties: nil)
          # @type [ServiceLines::V2::ServiceIdQualifier]
          @service_id_qualifier = service_id_qualifier
          # @type [String]
          @national_drug_code = national_drug_code
          # @type [String]
          @national_drug_unit_count = national_drug_unit_count
          # @type [ServiceLines::V2::MeasurementUnitCode]
          @measurement_unit_code = measurement_unit_code
          # @type [String]
          @link_sequence_number = link_sequence_number
          # @type [String]
          @pharmacy_prescription_number = pharmacy_prescription_number
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of DrugIdentification
        #
        # @param json_object [JSON]
        # @return [ServiceLines::V2::DrugIdentification]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          JSON.parse(json_object)
          service_id_qualifier = struct.service_id_qualifier
          national_drug_code = struct.national_drug_code
          national_drug_unit_count = struct.national_drug_unit_count
          measurement_unit_code = struct.measurement_unit_code
          link_sequence_number = struct.link_sequence_number
          pharmacy_prescription_number = struct.pharmacy_prescription_number
          new(service_id_qualifier: service_id_qualifier, national_drug_code: national_drug_code,
              national_drug_unit_count: national_drug_unit_count, measurement_unit_code: measurement_unit_code, link_sequence_number: link_sequence_number, pharmacy_prescription_number: pharmacy_prescription_number, additional_properties: struct)
        end

        # Serialize an instance of DrugIdentification to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "service_id_qualifier": @service_id_qualifier,
            "national_drug_code": @national_drug_code,
            "national_drug_unit_count": @national_drug_unit_count,
            "measurement_unit_code": @measurement_unit_code,
            "link_sequence_number": @link_sequence_number,
            "pharmacy_prescription_number": @pharmacy_prescription_number
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.service_id_qualifier.is_a?(ServiceLines::V2::ServiceIdQualifier) != false || raise("Passed value for field obj.service_id_qualifier is not the expected type, validation failed.")
          obj.national_drug_code.is_a?(String) != false || raise("Passed value for field obj.national_drug_code is not the expected type, validation failed.")
          obj.national_drug_unit_count.is_a?(String) != false || raise("Passed value for field obj.national_drug_unit_count is not the expected type, validation failed.")
          obj.measurement_unit_code.is_a?(ServiceLines::V2::MeasurementUnitCode) != false || raise("Passed value for field obj.measurement_unit_code is not the expected type, validation failed.")
          obj.link_sequence_number&.is_a?(String) != false || raise("Passed value for field obj.link_sequence_number is not the expected type, validation failed.")
          obj.pharmacy_prescription_number&.is_a?(String) != false || raise("Passed value for field obj.pharmacy_prescription_number is not the expected type, validation failed.")
        end
      end
    end
  end
end
