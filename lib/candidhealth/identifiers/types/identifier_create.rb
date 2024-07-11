# frozen_string_literal: true

require_relative "../../commons/types/date_range_optional_end"
require_relative "identifier_code"
require_relative "identifier_value"
require "ostruct"
require "json"

module CandidApiClient
  module Identifiers
    module Types
      class IdentifierCreate
        # @return [CandidApiClient::Commons::Types::DateRangeOptionalEnd]
        attr_reader :period
        # @return [CandidApiClient::Identifiers::Types::IdentifierCode]
        attr_reader :identifier_code
        # @return [CandidApiClient::Identifiers::Types::IdentifierValue]
        attr_reader :identifier_value
        # @return [OpenStruct] Additional properties unmapped to the current class definition
        attr_reader :additional_properties
        # @return [Object]
        attr_reader :_field_set
        protected :_field_set

        OMIT = Object.new

        # @param period [CandidApiClient::Commons::Types::DateRangeOptionalEnd]
        # @param identifier_code [CandidApiClient::Identifiers::Types::IdentifierCode]
        # @param identifier_value [CandidApiClient::Identifiers::Types::IdentifierValue]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [CandidApiClient::Identifiers::Types::IdentifierCreate]
        def initialize(identifier_code:, identifier_value:, period: OMIT, additional_properties: nil)
          @period = period if period != OMIT
          @identifier_code = identifier_code
          @identifier_value = identifier_value
          @additional_properties = additional_properties
          @_field_set = {
            "period": period,
            "identifier_code": identifier_code,
            "identifier_value": identifier_value
          }.reject do |_k, v|
            v == OMIT
          end
        end

        # Deserialize a JSON object to an instance of IdentifierCreate
        #
        # @param json_object [String]
        # @return [CandidApiClient::Identifiers::Types::IdentifierCreate]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          if parsed_json["period"].nil?
            period = nil
          else
            period = parsed_json["period"].to_json
            period = CandidApiClient::Commons::Types::DateRangeOptionalEnd.from_json(json_object: period)
          end
          identifier_code = struct["identifier_code"]
          if parsed_json["identifier_value"].nil?
            identifier_value = nil
          else
            identifier_value = parsed_json["identifier_value"].to_json
            identifier_value = CandidApiClient::Identifiers::Types::IdentifierValue.from_json(json_object: identifier_value)
          end
          new(
            period: period,
            identifier_code: identifier_code,
            identifier_value: identifier_value,
            additional_properties: struct
          )
        end

        # Serialize an instance of IdentifierCreate to a JSON object
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
          obj.period.nil? || CandidApiClient::Commons::Types::DateRangeOptionalEnd.validate_raw(obj: obj.period)
          obj.identifier_code.is_a?(CandidApiClient::Identifiers::Types::IdentifierCode) != false || raise("Passed value for field obj.identifier_code is not the expected type, validation failed.")
          CandidApiClient::Identifiers::Types::IdentifierValue.validate_raw(obj: obj.identifier_value)
        end
      end
    end
  end
end
