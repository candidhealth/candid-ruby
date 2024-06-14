# frozen_string_literal: true

require_relative "invoice_item_update_type"
require_relative "../../../invoices/v_2/types/invoice_item_create"
require "json"

module CandidApiClient
  module ImportInvoice
    module V1
      class InvoiceItemInfoUpdate
        attr_reader :update_type, :items, :additional_properties

        # @param update_type [ImportInvoice::V1::InvoiceItemUpdateType] The only supported update operations for invoice items is to either overwrite the entire list of invoice items
        #   or to append new invoice items
        # @param items [Array<Invoices::V2::InvoiceItemCreate>]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [ImportInvoice::V1::InvoiceItemInfoUpdate]
        def initialize(update_type:, items:, additional_properties: nil)
          # @type [ImportInvoice::V1::InvoiceItemUpdateType] The only supported update operations for invoice items is to either overwrite the entire list of invoice items
          #   or to append new invoice items
          @update_type = update_type
          # @type [Array<Invoices::V2::InvoiceItemCreate>]
          @items = items
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of InvoiceItemInfoUpdate
        #
        # @param json_object [JSON]
        # @return [ImportInvoice::V1::InvoiceItemInfoUpdate]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          update_type = struct.update_type
          items = parsed_json["items"]&.map do |v|
            v = v.to_json
            Invoices::V2::InvoiceItemCreate.from_json(json_object: v)
          end
          new(update_type: update_type, items: items, additional_properties: struct)
        end

        # Serialize an instance of InvoiceItemInfoUpdate to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "update_type": @update_type, "items": @items }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.update_type.is_a?(ImportInvoice::V1::InvoiceItemUpdateType) != false || raise("Passed value for field obj.update_type is not the expected type, validation failed.")
          obj.items.is_a?(Array) != false || raise("Passed value for field obj.items is not the expected type, validation failed.")
        end
      end
    end
  end
end
