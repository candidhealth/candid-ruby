# frozen_string_literal: true

require_relative "rarc"
require "json"

module CandidApiClient
  module X12
    module V1
      class RemittanceAdviceRemarkCode
        attr_reader :reason_code, :additional_properties

        # @param reason_code [X12::V1::Rarc]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [X12::V1::RemittanceAdviceRemarkCode]
        def initialize(reason_code:, additional_properties: nil)
          # @type [X12::V1::Rarc]
          @reason_code = reason_code
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of RemittanceAdviceRemarkCode
        #
        # @param json_object [JSON]
        # @return [X12::V1::RemittanceAdviceRemarkCode]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          JSON.parse(json_object)
          reason_code = struct.reason_code
          new(reason_code: reason_code, additional_properties: struct)
        end

        # Serialize an instance of RemittanceAdviceRemarkCode to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "reason_code": @reason_code }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.reason_code.is_a?(X12::V1::Rarc) != false || raise("Passed value for field obj.reason_code is not the expected type, validation failed.")
        end
      end
    end
  end
end
