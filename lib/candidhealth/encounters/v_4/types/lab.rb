# frozen_string_literal: true

require_relative "lab_code_type"
require "json"

module CandidApiClient
  module Encounters
    module V4
      class Lab
        attr_reader :name, :code, :code_type, :additional_properties

        # @param name [String]
        # @param code [String]
        # @param code_type [Encounters::V4::LabCodeType]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Encounters::V4::Lab]
        def initialize(name:, code: nil, code_type: nil, additional_properties: nil)
          # @type [String]
          @name = name
          # @type [String]
          @code = code
          # @type [Encounters::V4::LabCodeType]
          @code_type = code_type
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of Lab
        #
        # @param json_object [JSON]
        # @return [Encounters::V4::Lab]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          JSON.parse(json_object)
          name = struct.name
          code = struct.code
          code_type = struct.code_type
          new(name: name, code: code, code_type: code_type, additional_properties: struct)
        end

        # Serialize an instance of Lab to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "name": @name, "code": @code, "code_type": @code_type }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
          obj.code&.is_a?(String) != false || raise("Passed value for field obj.code is not the expected type, validation failed.")
          obj.code_type&.is_a?(Encounters::V4::LabCodeType) != false || raise("Passed value for field obj.code_type is not the expected type, validation failed.")
        end
      end
    end
  end
end
