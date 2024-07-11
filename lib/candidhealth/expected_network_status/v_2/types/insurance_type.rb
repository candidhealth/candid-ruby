# frozen_string_literal: true

require_relative "line_of_business"
require_relative "insurance_type_codes"
require "ostruct"
require "json"

module CandidApiClient
  module ExpectedNetworkStatus
    module V2
      module Types
        class InsuranceType
          # @return [CandidApiClient::ExpectedNetworkStatus::V2::Types::LineOfBusiness] The line of business associated with the patient’s insurance
          attr_reader :line_of_business
          # @return [CandidApiClient::ExpectedNetworkStatus::V2::Types::InsuranceTypeCodes]
          attr_reader :insurance_type_codes
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param line_of_business [CandidApiClient::ExpectedNetworkStatus::V2::Types::LineOfBusiness] The line of business associated with the patient’s insurance
          # @param insurance_type_codes [CandidApiClient::ExpectedNetworkStatus::V2::Types::InsuranceTypeCodes]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::ExpectedNetworkStatus::V2::Types::InsuranceType]
          def initialize(line_of_business:, insurance_type_codes:, additional_properties: nil)
            @line_of_business = line_of_business
            @insurance_type_codes = insurance_type_codes
            @additional_properties = additional_properties
            @_field_set = { "line_of_business": line_of_business, "insurance_type_codes": insurance_type_codes }
          end

          # Deserialize a JSON object to an instance of InsuranceType
          #
          # @param json_object [String]
          # @return [CandidApiClient::ExpectedNetworkStatus::V2::Types::InsuranceType]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            line_of_business = struct["line_of_business"]
            if parsed_json["insurance_type_codes"].nil?
              insurance_type_codes = nil
            else
              insurance_type_codes = parsed_json["insurance_type_codes"].to_json
              insurance_type_codes = CandidApiClient::ExpectedNetworkStatus::V2::Types::InsuranceTypeCodes.from_json(json_object: insurance_type_codes)
            end
            new(
              line_of_business: line_of_business,
              insurance_type_codes: insurance_type_codes,
              additional_properties: struct
            )
          end

          # Serialize an instance of InsuranceType to a JSON object
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
            obj.line_of_business.is_a?(CandidApiClient::ExpectedNetworkStatus::V2::Types::LineOfBusiness) != false || raise("Passed value for field obj.line_of_business is not the expected type, validation failed.")
            CandidApiClient::ExpectedNetworkStatus::V2::Types::InsuranceTypeCodes.validate_raw(obj: obj.insurance_type_codes)
          end
        end
      end
    end
  end
end
