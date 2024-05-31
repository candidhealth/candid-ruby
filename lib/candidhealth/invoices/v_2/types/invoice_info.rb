# frozen_string_literal: true

require_relative "../../../commons/types/invoice_id"
require_relative "invoice"
require_relative "invoice_destination"
require "json"

module CandidApiClient
  module Invoices
    module V2
      class InvoiceInfo
        attr_reader :id, :invoice, :invoice_type, :additional_properties

        # @param id [Commons::INVOICE_ID]
        # @param invoice [Invoices::V2::Invoice]
        # @param invoice_type [Invoices::V2::InvoiceDestination]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Invoices::V2::InvoiceInfo]
        def initialize(id:, invoice:, invoice_type:, additional_properties: nil)
          # @type [Commons::INVOICE_ID]
          @id = id
          # @type [Invoices::V2::Invoice]
          @invoice = invoice
          # @type [Invoices::V2::InvoiceDestination]
          @invoice_type = invoice_type
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of InvoiceInfo
        #
        # @param json_object [JSON]
        # @return [Invoices::V2::InvoiceInfo]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          id = struct.id
          if parsed_json["invoice"].nil?
            invoice = nil
          else
            invoice = parsed_json["invoice"].to_json
            invoice = Invoices::V2::Invoice.from_json(json_object: invoice)
          end
          invoice_type = struct.invoice_type
          new(id: id, invoice: invoice, invoice_type: invoice_type, additional_properties: struct)
        end

        # Serialize an instance of InvoiceInfo to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "id": @id, "invoice": @invoice, "invoice_type": @invoice_type }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.id.is_a?(UUID) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
          Invoices::V2::Invoice.validate_raw(obj: obj.invoice)
          obj.invoice_type.is_a?(Invoices::V2::InvoiceDestination) != false || raise("Passed value for field obj.invoice_type is not the expected type, validation failed.")
        end
      end
    end
  end
end
