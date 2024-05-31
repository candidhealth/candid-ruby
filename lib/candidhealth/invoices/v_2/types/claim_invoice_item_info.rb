# frozen_string_literal: true

require_relative "claim_invoice_item"
require "json"

module CandidApiClient
  module Invoices
    module V2
      class ClaimInvoiceItemInfo
        attr_reader :claim_invoice_item, :service_line_invoice_items, :additional_properties

        # @param claim_invoice_item [Invoices::V2::ClaimInvoiceItem]
        # @param service_line_invoice_items [Hash{Commons::SERVICE_LINE_ID => Invoices::V2::ServiceLineInvoiceItem}]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Invoices::V2::ClaimInvoiceItemInfo]
        def initialize(service_line_invoice_items:, claim_invoice_item: nil, additional_properties: nil)
          # @type [Invoices::V2::ClaimInvoiceItem]
          @claim_invoice_item = claim_invoice_item
          # @type [Hash{Commons::SERVICE_LINE_ID => Invoices::V2::ServiceLineInvoiceItem}]
          @service_line_invoice_items = service_line_invoice_items
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of ClaimInvoiceItemInfo
        #
        # @param json_object [JSON]
        # @return [Invoices::V2::ClaimInvoiceItemInfo]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          if parsed_json["claim_invoice_item"].nil?
            claim_invoice_item = nil
          else
            claim_invoice_item = parsed_json["claim_invoice_item"].to_json
            claim_invoice_item = Invoices::V2::ClaimInvoiceItem.from_json(json_object: claim_invoice_item)
          end
          service_line_invoice_items = parsed_json["service_line_invoice_items"]&.transform_values do |_k, v|
            v = v.to_json
            Invoices::V2::ServiceLineInvoiceItem.from_json(json_object: v)
          end
          new(claim_invoice_item: claim_invoice_item, service_line_invoice_items: service_line_invoice_items,
              additional_properties: struct)
        end

        # Serialize an instance of ClaimInvoiceItemInfo to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "claim_invoice_item": @claim_invoice_item,
            "service_line_invoice_items": @service_line_invoice_items
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.claim_invoice_item.nil? || Invoices::V2::ClaimInvoiceItem.validate_raw(obj: obj.claim_invoice_item)
          obj.service_line_invoice_items.is_a?(Hash) != false || raise("Passed value for field obj.service_line_invoice_items is not the expected type, validation failed.")
        end
      end
    end
  end
end
