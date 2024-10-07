# frozen_string_literal: true

require_relative "test_result_type"
require "ostruct"
require "json"

module CandidApiClient
  module ServiceLines
    module V2
      module Types
        class TestResult
          # @return [Float]
          attr_reader :value
          # @return [CandidApiClient::ServiceLines::V2::Types::TestResultType]
          attr_reader :result_type
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param value [Float]
          # @param result_type [CandidApiClient::ServiceLines::V2::Types::TestResultType]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::ServiceLines::V2::Types::TestResult]
          def initialize(value:, result_type:, additional_properties: nil)
            @value = value
            @result_type = result_type
            @additional_properties = additional_properties
            @_field_set = { "value": value, "result_type": result_type }
          end

          # Deserialize a JSON object to an instance of TestResult
          #
          # @param json_object [String]
          # @return [CandidApiClient::ServiceLines::V2::Types::TestResult]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            value = struct["value"]
            result_type = struct["result_type"]
            new(
              value: value,
              result_type: result_type,
              additional_properties: struct
            )
          end

          # Serialize an instance of TestResult to a JSON object
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
            obj.value.is_a?(Float) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
            obj.result_type.is_a?(CandidApiClient::ServiceLines::V2::Types::TestResultType) != false || raise("Passed value for field obj.result_type is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
