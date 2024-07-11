# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module Payers
    module V3
      module Types
        class Payer
          # @return [String] Auto-generated ID set on creation.
          attr_reader :payer_uuid
          # @return [String] The primary national payer ID of the payer.
          attr_reader :payer_id
          # @return [String] The primary display name of the payer.
          attr_reader :payer_name
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param payer_uuid [String] Auto-generated ID set on creation.
          # @param payer_id [String] The primary national payer ID of the payer.
          # @param payer_name [String] The primary display name of the payer.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Payers::V3::Types::Payer]
          def initialize(payer_uuid:, payer_id:, payer_name:, additional_properties: nil)
            @payer_uuid = payer_uuid
            @payer_id = payer_id
            @payer_name = payer_name
            @additional_properties = additional_properties
            @_field_set = { "payer_uuid": payer_uuid, "payer_id": payer_id, "payer_name": payer_name }
          end

          # Deserialize a JSON object to an instance of Payer
          #
          # @param json_object [String]
          # @return [CandidApiClient::Payers::V3::Types::Payer]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            payer_uuid = struct["payer_uuid"]
            payer_id = struct["payer_id"]
            payer_name = struct["payer_name"]
            new(
              payer_uuid: payer_uuid,
              payer_id: payer_id,
              payer_name: payer_name,
              additional_properties: struct
            )
          end

          # Serialize an instance of Payer to a JSON object
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
            obj.payer_uuid.is_a?(String) != false || raise("Passed value for field obj.payer_uuid is not the expected type, validation failed.")
            obj.payer_id.is_a?(String) != false || raise("Passed value for field obj.payer_id is not the expected type, validation failed.")
            obj.payer_name.is_a?(String) != false || raise("Passed value for field obj.payer_name is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
