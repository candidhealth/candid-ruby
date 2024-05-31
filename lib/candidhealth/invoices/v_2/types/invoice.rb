# frozen_string_literal: true

require "date"
require_relative "../../../commons/types/organization_id"
require_relative "invoice_destination_metadata"
require_relative "../../../commons/types/patient_external_id"
require_relative "invoice_status"
require_relative "invoice_item_info"
require "json"

module CandidApiClient
  module Invoices
    module V2
      class Invoice
        attr_reader :amount_cents, :created_at, :updated_at, :organization_id, :invoice_destination_metadata,
                    :patient_external_id, :note, :due_date, :status, :url, :customer_invoice_url, :items, :additional_properties

        # @param amount_cents [Integer] Total monetary amount (in cents) of all Invoice Items
        # @param created_at [DateTime]
        # @param updated_at [DateTime]
        # @param organization_id [Commons::ORGANIZATION_ID]
        # @param invoice_destination_metadata [Invoices::V2::InvoiceDestinationMetadata] Contains all relevant information from the third-party service this invoice was created in
        # @param patient_external_id [Commons::PATIENT_EXTERNAL_ID]
        # @param note [String]
        # @param due_date [Date]
        # @param status [Invoices::V2::InvoiceStatus]
        # @param url [String] Link to the admin view of the invoice in the third-party service
        # @param customer_invoice_url [String] Link to the patient view of the invoice in the third-party service
        # @param items [Invoices::V2::InvoiceItemInfo] The InvoiceItem rollup which contains all claim and service line invoice items
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Invoices::V2::Invoice]
        def initialize(amount_cents:, created_at:, updated_at:, organization_id:, invoice_destination_metadata:,
                       patient_external_id:, due_date:, status:, items:, note: nil, url: nil, customer_invoice_url: nil, additional_properties: nil)
          # @type [Integer] Total monetary amount (in cents) of all Invoice Items
          @amount_cents = amount_cents
          # @type [DateTime]
          @created_at = created_at
          # @type [DateTime]
          @updated_at = updated_at
          # @type [Commons::ORGANIZATION_ID]
          @organization_id = organization_id
          # @type [Invoices::V2::InvoiceDestinationMetadata] Contains all relevant information from the third-party service this invoice was created in
          @invoice_destination_metadata = invoice_destination_metadata
          # @type [Commons::PATIENT_EXTERNAL_ID]
          @patient_external_id = patient_external_id
          # @type [String]
          @note = note
          # @type [Date]
          @due_date = due_date
          # @type [Invoices::V2::InvoiceStatus]
          @status = status
          # @type [String] Link to the admin view of the invoice in the third-party service
          @url = url
          # @type [String] Link to the patient view of the invoice in the third-party service
          @customer_invoice_url = customer_invoice_url
          # @type [Invoices::V2::InvoiceItemInfo] The InvoiceItem rollup which contains all claim and service line invoice items
          @items = items
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of Invoice
        #
        # @param json_object [JSON]
        # @return [Invoices::V2::Invoice]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          amount_cents = struct.amount_cents
          created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
          updated_at = (DateTime.parse(parsed_json["updated_at"]) unless parsed_json["updated_at"].nil?)
          organization_id = struct.organization_id
          if parsed_json["invoice_destination_metadata"].nil?
            invoice_destination_metadata = nil
          else
            invoice_destination_metadata = parsed_json["invoice_destination_metadata"].to_json
            invoice_destination_metadata = Invoices::V2::InvoiceDestinationMetadata.from_json(json_object: invoice_destination_metadata)
          end
          patient_external_id = struct.patient_external_id
          note = struct.note
          due_date = (Date.parse(parsed_json["due_date"]) unless parsed_json["due_date"].nil?)
          status = struct.status
          url = struct.url
          customer_invoice_url = struct.customer_invoice_url
          if parsed_json["items"].nil?
            items = nil
          else
            items = parsed_json["items"].to_json
            items = Invoices::V2::InvoiceItemInfo.from_json(json_object: items)
          end
          new(amount_cents: amount_cents, created_at: created_at, updated_at: updated_at,
              organization_id: organization_id, invoice_destination_metadata: invoice_destination_metadata, patient_external_id: patient_external_id, note: note, due_date: due_date, status: status, url: url, customer_invoice_url: customer_invoice_url, items: items, additional_properties: struct)
        end

        # Serialize an instance of Invoice to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "amount_cents": @amount_cents,
            "created_at": @created_at,
            "updated_at": @updated_at,
            "organization_id": @organization_id,
            "invoice_destination_metadata": @invoice_destination_metadata,
            "patient_external_id": @patient_external_id,
            "note": @note,
            "due_date": @due_date,
            "status": @status,
            "url": @url,
            "customer_invoice_url": @customer_invoice_url,
            "items": @items
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.amount_cents.is_a?(Integer) != false || raise("Passed value for field obj.amount_cents is not the expected type, validation failed.")
          obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
          obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
          obj.organization_id.is_a?(UUID) != false || raise("Passed value for field obj.organization_id is not the expected type, validation failed.")
          Invoices::V2::InvoiceDestinationMetadata.validate_raw(obj: obj.invoice_destination_metadata)
          obj.patient_external_id.is_a?(String) != false || raise("Passed value for field obj.patient_external_id is not the expected type, validation failed.")
          obj.note&.is_a?(String) != false || raise("Passed value for field obj.note is not the expected type, validation failed.")
          obj.due_date.is_a?(Date) != false || raise("Passed value for field obj.due_date is not the expected type, validation failed.")
          obj.status.is_a?(Invoices::V2::InvoiceStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
          obj.url&.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
          obj.customer_invoice_url&.is_a?(String) != false || raise("Passed value for field obj.customer_invoice_url is not the expected type, validation failed.")
          Invoices::V2::InvoiceItemInfo.validate_raw(obj: obj.items)
        end
      end
    end
  end
end
