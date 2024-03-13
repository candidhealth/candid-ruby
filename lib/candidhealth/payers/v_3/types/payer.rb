# frozen_string_literal: true

require_relative "payer_uuid"
require "json"

module CandidApiClient
  module Payers
    module V3
      class Payer
        attr_reader :payer_uuid, :payer_id, :payer_name, :additional_properties

        # @param payer_uuid [Payers::V3::PAYER_String] Auto-generated ID set on creation.
        # @param payer_id [String] The primary national payer ID of the payer.
        # @param payer_name [String] The primary display name of the payer.
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Payers::V3::Payer]
        def initialize(payer_uuid:, payer_id:, payer_name:, additional_properties: nil)
          # @type [Payers::V3::PAYER_String] Auto-generated ID set on creation.
          @payer_uuid = payer_uuid
          # @type [String] The primary national payer ID of the payer.
          @payer_id = payer_id
          # @type [String] The primary display name of the payer.
          @payer_name = payer_name
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of Payer
        #
        # @param json_object [JSON]
        # @return [Payers::V3::Payer]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          JSON.parse(json_object)
          payer_uuid = struct.payer_uuid
          payer_id = struct.payer_id
          payer_name = struct.payer_name
          new(payer_uuid: payer_uuid, payer_id: payer_id, payer_name: payer_name, additional_properties: struct)
        end

        # Serialize an instance of Payer to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "payer_uuid": @payer_uuid, "payer_id": @payer_id, "payer_name": @payer_name }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.payer_uuid.is_a?(String) != false || raise("Passed value for field obj.payer_uuid is not the expected type, validation failed.")
          obj.payer_id.is_a?(String) != false || raise("Passed value for field obj.payer_id is not the expected type, validation failed.")
          obj.payer_name.is_a?(String) != false || raise("Passed value for field obj.payer_name is not the expected type, validation failed.")
        end
      end
    end
  end
end
