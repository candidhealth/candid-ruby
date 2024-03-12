# frozen_string_literal: true

require_relative "patient_payment"
require_relative "../../../commons/types/page_token"
require "json"

module CandidApiClient
  module PatientPayments
    module V4
      class PatientPaymentsPage
        attr_reader :items, :prev_page_token, :next_page_token, :additional_properties

        # @param items [Array<PatientPayments::V4::PatientPayment>]
        # @param prev_page_token [Commons::PAGE_TOKEN]
        # @param next_page_token [Commons::PAGE_TOKEN]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [PatientPayments::V4::PatientPaymentsPage]
        def initialize(items:, prev_page_token: nil, next_page_token: nil, additional_properties: nil)
          # @type [Array<PatientPayments::V4::PatientPayment>]
          @items = items
          # @type [Commons::PAGE_TOKEN]
          @prev_page_token = prev_page_token
          # @type [Commons::PAGE_TOKEN]
          @next_page_token = next_page_token
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of PatientPaymentsPage
        #
        # @param json_object [JSON]
        # @return [PatientPayments::V4::PatientPaymentsPage]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          items = parsed_json["items"]&.map do |v|
            v = v.to_json
            PatientPayments::V4::PatientPayment.from_json(json_object: v)
          end
          prev_page_token = struct.prev_page_token
          next_page_token = struct.next_page_token
          new(items: items, prev_page_token: prev_page_token, next_page_token: next_page_token,
              additional_properties: struct)
        end

        # Serialize an instance of PatientPaymentsPage to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "items": @items, "prev_page_token": @prev_page_token, "next_page_token": @next_page_token }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.items.is_a?(Array) != false || raise("Passed value for field obj.items is not the expected type, validation failed.")
          obj.prev_page_token&.is_a?(String) != false || raise("Passed value for field obj.prev_page_token is not the expected type, validation failed.")
          obj.next_page_token&.is_a?(String) != false || raise("Passed value for field obj.next_page_token is not the expected type, validation failed.")
        end
      end
    end
  end
end
