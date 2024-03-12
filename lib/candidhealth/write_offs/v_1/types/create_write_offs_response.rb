# frozen_string_literal: true

require_relative "write_off"
require "json"

module CandidApiClient
  module WriteOffs
    module V1
      class CreateWriteOffsResponse
        attr_reader :write_offs, :additional_properties

        # @param write_offs [Array<WriteOffs::V1::WriteOff>]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [WriteOffs::V1::CreateWriteOffsResponse]
        def initialize(write_offs:, additional_properties: nil)
          # @type [Array<WriteOffs::V1::WriteOff>]
          @write_offs = write_offs
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of CreateWriteOffsResponse
        #
        # @param json_object [JSON]
        # @return [WriteOffs::V1::CreateWriteOffsResponse]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          write_offs = parsed_json["write_offs"]&.map do |v|
            v = v.to_json
            WriteOffs::V1::WriteOff.from_json(json_object: v)
          end
          new(write_offs: write_offs, additional_properties: struct)
        end

        # Serialize an instance of CreateWriteOffsResponse to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "write_offs": @write_offs }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
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
