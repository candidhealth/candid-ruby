# frozen_string_literal: true

require_relative "rate"
require_relative "../../../commons/types/page_token"
require "json"

module CandidApiClient
  module FeeSchedules
    module V3
      class RatesPage
        attr_reader :rates, :prev_page_token, :next_page_token, :additional_properties

        # @param rates [Array<FeeSchedules::V3::Rate>]
        # @param prev_page_token [Commons::PAGE_TOKEN]
        # @param next_page_token [Commons::PAGE_TOKEN]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [FeeSchedules::V3::RatesPage]
        def initialize(rates:, prev_page_token: nil, next_page_token: nil, additional_properties: nil)
          # @type [Array<FeeSchedules::V3::Rate>]
          @rates = rates
          # @type [Commons::PAGE_TOKEN]
          @prev_page_token = prev_page_token
          # @type [Commons::PAGE_TOKEN]
          @next_page_token = next_page_token
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of RatesPage
        #
        # @param json_object [JSON]
        # @return [FeeSchedules::V3::RatesPage]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          rates = parsed_json["rates"]&.map do |v|
            v = v.to_json
            FeeSchedules::V3::Rate.from_json(json_object: v)
          end
          prev_page_token = struct.prev_page_token
          next_page_token = struct.next_page_token
          new(rates: rates, prev_page_token: prev_page_token, next_page_token: next_page_token,
              additional_properties: struct)
        end

        # Serialize an instance of RatesPage to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "rates": @rates, "prev_page_token": @prev_page_token, "next_page_token": @next_page_token }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.rates.is_a?(Array) != false || raise("Passed value for field obj.rates is not the expected type, validation failed.")
          obj.prev_page_token&.is_a?(String) != false || raise("Passed value for field obj.prev_page_token is not the expected type, validation failed.")
          obj.next_page_token&.is_a?(String) != false || raise("Passed value for field obj.next_page_token is not the expected type, validation failed.")
        end
      end
    end
  end
end
