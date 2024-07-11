# frozen_string_literal: true

require_relative "claim_invoice_item"
require "ostruct"
require "json"

module CandidApiClient
  module Invoices
    module V2
      module Types
        class ClaimInvoiceItemInfo
          # @return [CandidApiClient::Invoices::V2::Types::ClaimInvoiceItem]
          attr_reader :claim_invoice_item
          # @return [Hash{String => CandidApiClient::Invoices::V2::Types::ServiceLineInvoiceItem}]
          attr_reader :service_line_invoice_items
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param claim_invoice_item [CandidApiClient::Invoices::V2::Types::ClaimInvoiceItem]
          # @param service_line_invoice_items [Hash{String => CandidApiClient::Invoices::V2::Types::ServiceLineInvoiceItem}]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Invoices::V2::Types::ClaimInvoiceItemInfo]
          def initialize(service_line_invoice_items:, claim_invoice_item: OMIT, additional_properties: nil)
            @claim_invoice_item = claim_invoice_item if claim_invoice_item != OMIT
            @service_line_invoice_items = service_line_invoice_items
            @additional_properties = additional_properties
            @_field_set = {
              "claim_invoice_item": claim_invoice_item,
              "service_line_invoice_items": service_line_invoice_items
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of ClaimInvoiceItemInfo
          #
          # @param json_object [String]
          # @return [CandidApiClient::Invoices::V2::Types::ClaimInvoiceItemInfo]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            if parsed_json["claim_invoice_item"].nil?
              claim_invoice_item = nil
            else
              claim_invoice_item = parsed_json["claim_invoice_item"].to_json
              claim_invoice_item = CandidApiClient::Invoices::V2::Types::ClaimInvoiceItem.from_json(json_object: claim_invoice_item)
            end
            service_line_invoice_items = parsed_json["service_line_invoice_items"]&.transform_values do |value|
              value = value.to_json
              CandidApiClient::Invoices::V2::Types::ServiceLineInvoiceItem.from_json(json_object: value)
            end
            new(
              claim_invoice_item: claim_invoice_item,
              service_line_invoice_items: service_line_invoice_items,
              additional_properties: struct
            )
          end

          # Serialize an instance of ClaimInvoiceItemInfo to a JSON object
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
            obj.claim_invoice_item.nil? || CandidApiClient::Invoices::V2::Types::ClaimInvoiceItem.validate_raw(obj: obj.claim_invoice_item)
            obj.service_line_invoice_items.is_a?(Hash) != false || raise("Passed value for field obj.service_line_invoice_items is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
