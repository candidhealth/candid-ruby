# frozen_string_literal: true

require_relative "../../../commons/types/page_token"
require "json"

module CandidApiClient
  module FeeSchedules
    module V3
      class PayerThresholdsPage
        attr_reader :payer_thresholds, :prev_page_token, :next_page_token, :additional_properties

        # @param payer_thresholds [Hash{Payers::V3::PAYER_UUID => FeeSchedules::V3::PayerThreshold}]
        # @param prev_page_token [Commons::PAGE_TOKEN]
        # @param next_page_token [Commons::PAGE_TOKEN]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [FeeSchedules::V3::PayerThresholdsPage]
        def initialize(payer_thresholds:, prev_page_token: nil, next_page_token: nil, additional_properties: nil)
          # @type [Hash{Payers::V3::PAYER_UUID => FeeSchedules::V3::PayerThreshold}]
          @payer_thresholds = payer_thresholds
          # @type [Commons::PAGE_TOKEN]
          @prev_page_token = prev_page_token
          # @type [Commons::PAGE_TOKEN]
          @next_page_token = next_page_token
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of PayerThresholdsPage
        #
        # @param json_object [JSON]
        # @return [FeeSchedules::V3::PayerThresholdsPage]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          payer_thresholds = parsed_json["payer_thresholds"]&.transform_values do |_k, v|
            v = v.to_json
            FeeSchedules::V3::PayerThreshold.from_json(json_object: v)
          end
          prev_page_token = struct.prev_page_token
          next_page_token = struct.next_page_token
          new(payer_thresholds: payer_thresholds, prev_page_token: prev_page_token, next_page_token: next_page_token,
              additional_properties: struct)
        end

        # Serialize an instance of PayerThresholdsPage to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "payer_thresholds": @payer_thresholds,
            "prev_page_token": @prev_page_token,
            "next_page_token": @next_page_token
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.payer_thresholds.is_a?(Hash) != false || raise("Passed value for field obj.payer_thresholds is not the expected type, validation failed.")
          obj.prev_page_token&.is_a?(String) != false || raise("Passed value for field obj.prev_page_token is not the expected type, validation failed.")
          obj.next_page_token&.is_a?(String) != false || raise("Passed value for field obj.next_page_token is not the expected type, validation failed.")
        end
      end
    end
  end
end
