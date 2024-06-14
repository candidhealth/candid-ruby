# frozen_string_literal: true

require_relative "../../../invoices/v_2/types/invoice_status"
require "date"
require_relative "invoice_item_info_update"
require "json"

module CandidApiClient
  module ImportInvoice
    module V1
      class ImportInvoiceUpdateRequest
        attr_reader :customer_invoice_url, :status, :note, :due_date, :items, :additional_properties

        # @param customer_invoice_url [String] Link to the patient view of the invoice in the third-party service
        # @param status [Invoices::V2::InvoiceStatus]
        # @param note [String]
        # @param due_date [Date]
        # @param items [ImportInvoice::V1::InvoiceItemInfoUpdate] None here represents there is no update to the invoice items
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [ImportInvoice::V1::ImportInvoiceUpdateRequest]
        def initialize(customer_invoice_url: nil, status: nil, note: nil, due_date: nil, items: nil,
                       additional_properties: nil)
          # @type [String] Link to the patient view of the invoice in the third-party service
          @customer_invoice_url = customer_invoice_url
          # @type [Invoices::V2::InvoiceStatus]
          @status = status
          # @type [String]
          @note = note
          # @type [Date]
          @due_date = due_date
          # @type [ImportInvoice::V1::InvoiceItemInfoUpdate] None here represents there is no update to the invoice items
          @items = items
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of ImportInvoiceUpdateRequest
        #
        # @param json_object [JSON]
        # @return [ImportInvoice::V1::ImportInvoiceUpdateRequest]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          customer_invoice_url = struct.customer_invoice_url
          status = struct.status
          note = struct.note
          due_date = (Date.parse(parsed_json["due_date"]) unless parsed_json["due_date"].nil?)
          if parsed_json["items"].nil?
            items = nil
          else
            items = parsed_json["items"].to_json
            items = ImportInvoice::V1::InvoiceItemInfoUpdate.from_json(json_object: items)
          end
          new(customer_invoice_url: customer_invoice_url, status: status, note: note, due_date: due_date, items: items,
              additional_properties: struct)
        end

        # Serialize an instance of ImportInvoiceUpdateRequest to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "customer_invoice_url": @customer_invoice_url,
            "status": @status,
            "note": @note,
            "due_date": @due_date,
            "items": @items
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.customer_invoice_url&.is_a?(String) != false || raise("Passed value for field obj.customer_invoice_url is not the expected type, validation failed.")
          obj.status&.is_a?(Invoices::V2::InvoiceStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
          obj.note&.is_a?(String) != false || raise("Passed value for field obj.note is not the expected type, validation failed.")
          obj.due_date&.is_a?(Date) != false || raise("Passed value for field obj.due_date is not the expected type, validation failed.")
          obj.items.nil? || ImportInvoice::V1::InvoiceItemInfoUpdate.validate_raw(obj: obj.items)
        end
      end
    end
  end
end
