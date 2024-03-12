# frozen_string_literal: true

require_relative "line_of_business"
require_relative "insurance_type_codes"
require "json"

module CandidApiClient
  module ExpectedNetworkStatus
    module V2
      class InsuranceType
        attr_reader :line_of_business, :insurance_type_codes, :additional_properties

        # @param line_of_business [ExpectedNetworkStatus::V2::LineOfBusiness] The line of business associated with the patient’s insurance
        # @param insurance_type_codes [ExpectedNetworkStatus::V2::InsuranceTypeCodes]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [ExpectedNetworkStatus::V2::InsuranceType]
        def initialize(line_of_business:, insurance_type_codes:, additional_properties: nil)
          # @type [ExpectedNetworkStatus::V2::LineOfBusiness] The line of business associated with the patient’s insurance
          @line_of_business = line_of_business
          # @type [ExpectedNetworkStatus::V2::InsuranceTypeCodes]
          @insurance_type_codes = insurance_type_codes
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of InsuranceType
        #
        # @param json_object [JSON]
        # @return [ExpectedNetworkStatus::V2::InsuranceType]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          line_of_business = struct.line_of_business
          if parsed_json["insurance_type_codes"].nil?
            insurance_type_codes = nil
          else
            insurance_type_codes = parsed_json["insurance_type_codes"].to_json
            insurance_type_codes = ExpectedNetworkStatus::V2::InsuranceTypeCodes.from_json(json_object: insurance_type_codes)
          end
          new(line_of_business: line_of_business, insurance_type_codes: insurance_type_codes,
              additional_properties: struct)
        end

        # Serialize an instance of InsuranceType to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "line_of_business": @line_of_business, "insurance_type_codes": @insurance_type_codes }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.line_of_business.is_a?(ExpectedNetworkStatus::V2::LineOfBusiness) != false || raise("Passed value for field obj.line_of_business is not the expected type, validation failed.")
          ExpectedNetworkStatus::V2::InsuranceTypeCodes.validate_raw(obj: obj.insurance_type_codes)
        end
      end
    end
  end
end
