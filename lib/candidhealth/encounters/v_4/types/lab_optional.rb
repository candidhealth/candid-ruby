# frozen_string_literal: true

require_relative "lab_code_type"
require "ostruct"
require "json"

module CandidApiClient
  module Encounters
    module V4
      module Types
        class LabOptional
          # @return [String]
          attr_reader :name
          # @return [String]
          attr_reader :code
          # @return [CandidApiClient::Encounters::V4::Types::LabCodeType]
          attr_reader :code_type
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param name [String]
          # @param code [String]
          # @param code_type [CandidApiClient::Encounters::V4::Types::LabCodeType]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Encounters::V4::Types::LabOptional]
          def initialize(name: OMIT, code: OMIT, code_type: OMIT, additional_properties: nil)
            @name = name if name != OMIT
            @code = code if code != OMIT
            @code_type = code_type if code_type != OMIT
            @additional_properties = additional_properties
            @_field_set = { "name": name, "code": code, "code_type": code_type }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of LabOptional
          #
          # @param json_object [String]
          # @return [CandidApiClient::Encounters::V4::Types::LabOptional]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            name = struct["name"]
            code = struct["code"]
            code_type = struct["code_type"]
            new(
              name: name,
              code: code,
              code_type: code_type,
              additional_properties: struct
            )
          end

          # Serialize an instance of LabOptional to a JSON object
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
            obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
            obj.code&.is_a?(String) != false || raise("Passed value for field obj.code is not the expected type, validation failed.")
            obj.code_type&.is_a?(CandidApiClient::Encounters::V4::Types::LabCodeType) != false || raise("Passed value for field obj.code_type is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
