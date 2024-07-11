# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module FeeSchedules
    module V3
      module Types
        class PayerThresholdsPage
          # @return [Hash{String => CandidApiClient::FeeSchedules::V3::Types::PayerThreshold}]
          attr_reader :payer_thresholds
          # @return [String]
          attr_reader :prev_page_token
          # @return [String]
          attr_reader :next_page_token
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param payer_thresholds [Hash{String => CandidApiClient::FeeSchedules::V3::Types::PayerThreshold}]
          # @param prev_page_token [String]
          # @param next_page_token [String]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::FeeSchedules::V3::Types::PayerThresholdsPage]
          def initialize(payer_thresholds:, prev_page_token: OMIT, next_page_token: OMIT, additional_properties: nil)
            @payer_thresholds = payer_thresholds
            @prev_page_token = prev_page_token if prev_page_token != OMIT
            @next_page_token = next_page_token if next_page_token != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "payer_thresholds": payer_thresholds,
              "prev_page_token": prev_page_token,
              "next_page_token": next_page_token
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of PayerThresholdsPage
          #
          # @param json_object [String]
          # @return [CandidApiClient::FeeSchedules::V3::Types::PayerThresholdsPage]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            payer_thresholds = parsed_json["payer_thresholds"]&.transform_values do |value|
              value = value.to_json
              CandidApiClient::FeeSchedules::V3::Types::PayerThreshold.from_json(json_object: value)
            end
            prev_page_token = struct["prev_page_token"]
            next_page_token = struct["next_page_token"]
            new(
              payer_thresholds: payer_thresholds,
              prev_page_token: prev_page_token,
              next_page_token: next_page_token,
              additional_properties: struct
            )
          end

          # Serialize an instance of PayerThresholdsPage to a JSON object
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
            obj.payer_thresholds.is_a?(Hash) != false || raise("Passed value for field obj.payer_thresholds is not the expected type, validation failed.")
            obj.prev_page_token&.is_a?(String) != false || raise("Passed value for field obj.prev_page_token is not the expected type, validation failed.")
            obj.next_page_token&.is_a?(String) != false || raise("Passed value for field obj.next_page_token is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
