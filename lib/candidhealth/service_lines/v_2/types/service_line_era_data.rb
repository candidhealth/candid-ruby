# frozen_string_literal: true

require_relative "service_line_adjustment"
require "ostruct"
require "json"

module CandidApiClient
  module ServiceLines
    module V2
      module Types
        class ServiceLineEraData
          # @return [Array<CandidApiClient::ServiceLines::V2::Types::ServiceLineAdjustment>]
          attr_reader :service_line_adjustments
          # @return [Array<String>]
          attr_reader :remittance_advice_remark_codes
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param service_line_adjustments [Array<CandidApiClient::ServiceLines::V2::Types::ServiceLineAdjustment>]
          # @param remittance_advice_remark_codes [Array<String>]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::ServiceLines::V2::Types::ServiceLineEraData]
          def initialize(service_line_adjustments:, remittance_advice_remark_codes:, additional_properties: nil)
            @service_line_adjustments = service_line_adjustments
            @remittance_advice_remark_codes = remittance_advice_remark_codes
            @additional_properties = additional_properties
            @_field_set = {
              "service_line_adjustments": service_line_adjustments,
              "remittance_advice_remark_codes": remittance_advice_remark_codes
            }
          end

          # Deserialize a JSON object to an instance of ServiceLineEraData
          #
          # @param json_object [String]
          # @return [CandidApiClient::ServiceLines::V2::Types::ServiceLineEraData]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            service_line_adjustments = parsed_json["service_line_adjustments"]&.map do |item|
              item = item.to_json
              CandidApiClient::ServiceLines::V2::Types::ServiceLineAdjustment.from_json(json_object: item)
            end
            remittance_advice_remark_codes = struct["remittance_advice_remark_codes"]
            new(
              service_line_adjustments: service_line_adjustments,
              remittance_advice_remark_codes: remittance_advice_remark_codes,
              additional_properties: struct
            )
          end

          # Serialize an instance of ServiceLineEraData to a JSON object
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
            obj.service_line_adjustments.is_a?(Array) != false || raise("Passed value for field obj.service_line_adjustments is not the expected type, validation failed.")
            obj.remittance_advice_remark_codes.is_a?(Array) != false || raise("Passed value for field obj.remittance_advice_remark_codes is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
