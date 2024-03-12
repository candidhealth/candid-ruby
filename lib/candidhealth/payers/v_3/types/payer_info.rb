# frozen_string_literal: true

require_relative "payer_id"
require_relative "payer_name"
require "json"

module CandidApiClient
  module Payers
    module V3
      class PayerInfo
        attr_reader :payer_id, :payer_name, :additional_properties

        # @param payer_id [Payers::V3::PAYER_ID]
        # @param payer_name [Payers::V3::PAYER_NAME]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Payers::V3::PayerInfo]
        def initialize(payer_id:, payer_name:, additional_properties: nil)
          # @type [Payers::V3::PAYER_ID]
          @payer_id = payer_id
          # @type [Payers::V3::PAYER_NAME]
          @payer_name = payer_name
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of PayerInfo
        #
        # @param json_object [JSON]
        # @return [Payers::V3::PayerInfo]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          JSON.parse(json_object)
          payer_id = struct.payer_id
          payer_name = struct.payer_name
          new(payer_id: payer_id, payer_name: payer_name, additional_properties: struct)
        end

        # Serialize an instance of PayerInfo to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "payer_id": @payer_id, "payer_name": @payer_name }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.payer_id.is_a?(String) != false || raise("Passed value for field obj.payer_id is not the expected type, validation failed.")
          obj.payer_name.is_a?(String) != false || raise("Passed value for field obj.payer_name is not the expected type, validation failed.")
        end
      end
    end
  end
end
