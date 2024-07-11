# frozen_string_literal: true

require_relative "write_off"
require "ostruct"
require "json"

module CandidApiClient
  module WriteOffs
    module V1
      module Types
        class CreateWriteOffsResponse
          # @return [Array<CandidApiClient::WriteOffs::V1::Types::WriteOff>]
          attr_reader :write_offs
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param write_offs [Array<CandidApiClient::WriteOffs::V1::Types::WriteOff>]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::WriteOffs::V1::Types::CreateWriteOffsResponse]
          def initialize(write_offs:, additional_properties: nil)
            @write_offs = write_offs
            @additional_properties = additional_properties
            @_field_set = { "write_offs": write_offs }
          end

          # Deserialize a JSON object to an instance of CreateWriteOffsResponse
          #
          # @param json_object [String]
          # @return [CandidApiClient::WriteOffs::V1::Types::CreateWriteOffsResponse]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            write_offs = parsed_json["write_offs"]&.map do |item|
              item = item.to_json
              CandidApiClient::WriteOffs::V1::Types::WriteOff.from_json(json_object: item)
            end
            new(write_offs: write_offs, additional_properties: struct)
          end

          # Serialize an instance of CreateWriteOffsResponse to a JSON object
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
            obj.write_offs.is_a?(Array) != false || raise("Passed value for field obj.write_offs is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
