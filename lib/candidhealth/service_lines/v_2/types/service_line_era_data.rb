# frozen_string_literal: true

require_relative "service_line_adjustment"
require "json"

module CandidApiClient
  module ServiceLines
    module V2
      class ServiceLineEraData
        attr_reader :service_line_adjustments, :remittance_advice_remark_codes, :additional_properties

        # @param service_line_adjustments [Array<ServiceLines::V2::ServiceLineAdjustment>]
        # @param remittance_advice_remark_codes [Array<String>]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [ServiceLines::V2::ServiceLineEraData]
        def initialize(service_line_adjustments:, remittance_advice_remark_codes:, additional_properties: nil)
          # @type [Array<ServiceLines::V2::ServiceLineAdjustment>]
          @service_line_adjustments = service_line_adjustments
          # @type [Array<String>]
          @remittance_advice_remark_codes = remittance_advice_remark_codes
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of ServiceLineEraData
        #
        # @param json_object [JSON]
        # @return [ServiceLines::V2::ServiceLineEraData]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          service_line_adjustments = parsed_json["service_line_adjustments"]&.map do |v|
            v = v.to_json
            ServiceLines::V2::ServiceLineAdjustment.from_json(json_object: v)
          end
          remittance_advice_remark_codes = struct.remittance_advice_remark_codes
          new(service_line_adjustments: service_line_adjustments,
              remittance_advice_remark_codes: remittance_advice_remark_codes, additional_properties: struct)
        end

        # Serialize an instance of ServiceLineEraData to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "service_line_adjustments": @service_line_adjustments,
            "remittance_advice_remark_codes": @remittance_advice_remark_codes
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.service_line_adjustments.is_a?(Array) != false || raise("Passed value for field obj.service_line_adjustments is not the expected type, validation failed.")
          obj.remittance_advice_remark_codes.is_a?(Array) != false || raise("Passed value for field obj.remittance_advice_remark_codes is not the expected type, validation failed.")
        end
      end
    end
  end
end
