# frozen_string_literal: true

require_relative "rarc"
require "ostruct"
require "json"

module CandidApiClient
  module X12
    module V1
      module Types
        class RemittanceAdviceRemarkCode
          # @return [CandidApiClient::X12::V1::Types::Rarc]
          attr_reader :reason_code
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param reason_code [CandidApiClient::X12::V1::Types::Rarc]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::X12::V1::Types::RemittanceAdviceRemarkCode]
          def initialize(reason_code:, additional_properties: nil)
            @reason_code = reason_code
            @additional_properties = additional_properties
            @_field_set = { "reason_code": reason_code }
          end

          # Deserialize a JSON object to an instance of RemittanceAdviceRemarkCode
          #
          # @param json_object [String]
          # @return [CandidApiClient::X12::V1::Types::RemittanceAdviceRemarkCode]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            reason_code = struct["reason_code"]
            new(reason_code: reason_code, additional_properties: struct)
          end

          # Serialize an instance of RemittanceAdviceRemarkCode to a JSON object
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
            obj.reason_code.is_a?(CandidApiClient::X12::V1::Types::Rarc) != false || raise("Passed value for field obj.reason_code is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
