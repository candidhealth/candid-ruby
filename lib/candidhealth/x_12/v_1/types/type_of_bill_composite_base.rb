# frozen_string_literal: true

require_relative "type_of_facility_code"
require_relative "type_of_care_code"
require_relative "type_of_bill_frequency_code"
require "ostruct"
require "json"

module CandidApiClient
  module X12
    module V1
      module Types
        class TypeOfBillCompositeBase
          # @return [CandidApiClient::X12::V1::Types::TypeOfFacilityCode] The FL04 Institutional type of facility code for the bill.  The second digit of
          #  the composite code.
          attr_reader :type_of_facility
          # @return [CandidApiClient::X12::V1::Types::TypeOfCareCode] The FL04 Institutional type of care code for the bill.  The third digit of the
          #  composite code.
          attr_reader :type_of_care
          # @return [CandidApiClient::X12::V1::Types::TypeOfBillFrequencyCode] The FL04 Institutional frequency code for the bill.  The fourth digit of the
          #  composite code.
          attr_reader :frequency_code
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param type_of_facility [CandidApiClient::X12::V1::Types::TypeOfFacilityCode] The FL04 Institutional type of facility code for the bill.  The second digit of
          #  the composite code.
          # @param type_of_care [CandidApiClient::X12::V1::Types::TypeOfCareCode] The FL04 Institutional type of care code for the bill.  The third digit of the
          #  composite code.
          # @param frequency_code [CandidApiClient::X12::V1::Types::TypeOfBillFrequencyCode] The FL04 Institutional frequency code for the bill.  The fourth digit of the
          #  composite code.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::X12::V1::Types::TypeOfBillCompositeBase]
          def initialize(type_of_facility:, type_of_care:, frequency_code:, additional_properties: nil)
            @type_of_facility = type_of_facility
            @type_of_care = type_of_care
            @frequency_code = frequency_code
            @additional_properties = additional_properties
            @_field_set = {
              "type_of_facility": type_of_facility,
              "type_of_care": type_of_care,
              "frequency_code": frequency_code
            }
          end

          # Deserialize a JSON object to an instance of TypeOfBillCompositeBase
          #
          # @param json_object [String]
          # @return [CandidApiClient::X12::V1::Types::TypeOfBillCompositeBase]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            type_of_facility = struct["type_of_facility"]
            type_of_care = struct["type_of_care"]
            frequency_code = struct["frequency_code"]
            new(
              type_of_facility: type_of_facility,
              type_of_care: type_of_care,
              frequency_code: frequency_code,
              additional_properties: struct
            )
          end

          # Serialize an instance of TypeOfBillCompositeBase to a JSON object
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
            obj.type_of_facility.is_a?(CandidApiClient::X12::V1::Types::TypeOfFacilityCode) != false || raise("Passed value for field obj.type_of_facility is not the expected type, validation failed.")
            obj.type_of_care.is_a?(CandidApiClient::X12::V1::Types::TypeOfCareCode) != false || raise("Passed value for field obj.type_of_care is not the expected type, validation failed.")
            obj.frequency_code.is_a?(CandidApiClient::X12::V1::Types::TypeOfBillFrequencyCode) != false || raise("Passed value for field obj.frequency_code is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
