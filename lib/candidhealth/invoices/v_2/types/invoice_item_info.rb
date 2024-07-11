# frozen_string_literal: true

require_relative "unattributed_invoice_item"
require "ostruct"
require "json"

module CandidApiClient
  module Invoices
    module V2
      module Types
        class InvoiceItemInfo
          # @return [Hash{String => CandidApiClient::Invoices::V2::Types::ClaimInvoiceItemInfo}]
          attr_reader :claim_invoice_items
          # @return [Array<CandidApiClient::Invoices::V2::Types::UnattributedInvoiceItem>]
          attr_reader :unattributed_items
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param claim_invoice_items [Hash{String => CandidApiClient::Invoices::V2::Types::ClaimInvoiceItemInfo}]
          # @param unattributed_items [Array<CandidApiClient::Invoices::V2::Types::UnattributedInvoiceItem>]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Invoices::V2::Types::InvoiceItemInfo]
          def initialize(claim_invoice_items:, unattributed_items:, additional_properties: nil)
            @claim_invoice_items = claim_invoice_items
            @unattributed_items = unattributed_items
            @additional_properties = additional_properties
            @_field_set = { "claim_invoice_items": claim_invoice_items, "unattributed_items": unattributed_items }
          end

          # Deserialize a JSON object to an instance of InvoiceItemInfo
          #
          # @param json_object [String]
          # @return [CandidApiClient::Invoices::V2::Types::InvoiceItemInfo]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            claim_invoice_items = parsed_json["claim_invoice_items"]&.transform_values do |value|
              value = value.to_json
              CandidApiClient::Invoices::V2::Types::ClaimInvoiceItemInfo.from_json(json_object: value)
            end
            unattributed_items = parsed_json["unattributed_items"]&.map do |item|
              item = item.to_json
              CandidApiClient::Invoices::V2::Types::UnattributedInvoiceItem.from_json(json_object: item)
            end
            new(
              claim_invoice_items: claim_invoice_items,
              unattributed_items: unattributed_items,
              additional_properties: struct
            )
          end

          # Serialize an instance of InvoiceItemInfo to a JSON object
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
            obj.claim_invoice_items.is_a?(Hash) != false || raise("Passed value for field obj.claim_invoice_items is not the expected type, validation failed.")
            obj.unattributed_items.is_a?(Array) != false || raise("Passed value for field obj.unattributed_items is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
