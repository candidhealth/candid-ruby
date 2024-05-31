# frozen_string_literal: true

require_relative "unattributed_invoice_item"
require "json"

module CandidApiClient
  module Invoices
    module V2
      class InvoiceItemInfo
        attr_reader :claim_invoice_items, :unattributed_items, :additional_properties

        # @param claim_invoice_items [Hash{Commons::CLAIM_ID => Invoices::V2::ClaimInvoiceItemInfo}]
        # @param unattributed_items [Array<Invoices::V2::UnattributedInvoiceItem>]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Invoices::V2::InvoiceItemInfo]
        def initialize(claim_invoice_items:, unattributed_items:, additional_properties: nil)
          # @type [Hash{Commons::CLAIM_ID => Invoices::V2::ClaimInvoiceItemInfo}]
          @claim_invoice_items = claim_invoice_items
          # @type [Array<Invoices::V2::UnattributedInvoiceItem>]
          @unattributed_items = unattributed_items
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of InvoiceItemInfo
        #
        # @param json_object [JSON]
        # @return [Invoices::V2::InvoiceItemInfo]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          claim_invoice_items = parsed_json["claim_invoice_items"]&.transform_values do |_k, v|
            v = v.to_json
            Invoices::V2::ClaimInvoiceItemInfo.from_json(json_object: v)
          end
          unattributed_items = parsed_json["unattributed_items"]&.map do |v|
            v = v.to_json
            Invoices::V2::UnattributedInvoiceItem.from_json(json_object: v)
          end
          new(claim_invoice_items: claim_invoice_items, unattributed_items: unattributed_items,
              additional_properties: struct)
        end

        # Serialize an instance of InvoiceItemInfo to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "claim_invoice_items": @claim_invoice_items, "unattributed_items": @unattributed_items }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
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
