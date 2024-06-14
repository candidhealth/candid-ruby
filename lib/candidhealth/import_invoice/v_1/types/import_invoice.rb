# frozen_string_literal: true

require_relative "../../../commons/types/invoice_id"
require "date"
require_relative "../../../invoices/v_2/types/invoice_item_info"
require_relative "../../../commons/types/patient_external_id"
require_relative "../../../invoices/v_2/types/invoice_status"
require "json"

module CandidApiClient
  module ImportInvoice
    module V1
      class ImportInvoice
        attr_reader :id, :created_at, :updated_at, :items, :patient_external_id, :external_customer_identifier,
                    :status, :external_identifier, :note, :customer_invoice_url, :due_date, :amount_cents, :additional_properties

        # @param id [Commons::INVOICE_ID]
        # @param created_at [DateTime]
        # @param updated_at [DateTime]
        # @param items [Invoices::V2::InvoiceItemInfo] The InvoiceItem rollup which contains all claim and service line invoice items
        # @param patient_external_id [Commons::PATIENT_EXTERNAL_ID]
        # @param external_customer_identifier [String] Id of the customer in the source system
        # @param status [Invoices::V2::InvoiceStatus]
        # @param external_identifier [String] Id of the invoice being imported in the source system
        # @param note [String]
        # @param customer_invoice_url [String] Link to the patient view of the invoice in the third-party service
        # @param due_date [Date]
        # @param amount_cents [Integer] Total monetary amount (in cents) of all Invoice Items
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [ImportInvoice::V1::ImportInvoice]
        def initialize(id:, created_at:, updated_at:, items:, patient_external_id:, external_customer_identifier:,
                       status:, external_identifier:, due_date:, amount_cents:, note: nil, customer_invoice_url: nil, additional_properties: nil)
          # @type [Commons::INVOICE_ID]
          @id = id
          # @type [DateTime]
          @created_at = created_at
          # @type [DateTime]
          @updated_at = updated_at
          # @type [Invoices::V2::InvoiceItemInfo] The InvoiceItem rollup which contains all claim and service line invoice items
          @items = items
          # @type [Commons::PATIENT_EXTERNAL_ID]
          @patient_external_id = patient_external_id
          # @type [String] Id of the customer in the source system
          @external_customer_identifier = external_customer_identifier
          # @type [Invoices::V2::InvoiceStatus]
          @status = status
          # @type [String] Id of the invoice being imported in the source system
          @external_identifier = external_identifier
          # @type [String]
          @note = note
          # @type [String] Link to the patient view of the invoice in the third-party service
          @customer_invoice_url = customer_invoice_url
          # @type [Date]
          @due_date = due_date
          # @type [Integer] Total monetary amount (in cents) of all Invoice Items
          @amount_cents = amount_cents
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of ImportInvoice
        #
        # @param json_object [JSON]
        # @return [ImportInvoice::V1::ImportInvoice]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          id = struct.id
          created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
          updated_at = (DateTime.parse(parsed_json["updated_at"]) unless parsed_json["updated_at"].nil?)
          if parsed_json["items"].nil?
            items = nil
          else
            items = parsed_json["items"].to_json
            items = Invoices::V2::InvoiceItemInfo.from_json(json_object: items)
          end
          patient_external_id = struct.patient_external_id
          external_customer_identifier = struct.external_customer_identifier
          status = struct.status
          external_identifier = struct.external_identifier
          note = struct.note
          customer_invoice_url = struct.customer_invoice_url
          due_date = (Date.parse(parsed_json["due_date"]) unless parsed_json["due_date"].nil?)
          amount_cents = struct.amount_cents
          new(id: id, created_at: created_at, updated_at: updated_at, items: items,
              patient_external_id: patient_external_id, external_customer_identifier: external_customer_identifier, status: status, external_identifier: external_identifier, note: note, customer_invoice_url: customer_invoice_url, due_date: due_date, amount_cents: amount_cents, additional_properties: struct)
        end

        # Serialize an instance of ImportInvoice to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "id": @id,
            "created_at": @created_at,
            "updated_at": @updated_at,
            "items": @items,
            "patient_external_id": @patient_external_id,
            "external_customer_identifier": @external_customer_identifier,
            "status": @status,
            "external_identifier": @external_identifier,
            "note": @note,
            "customer_invoice_url": @customer_invoice_url,
            "due_date": @due_date,
            "amount_cents": @amount_cents
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.id.is_a?(UUID) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
          obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
          obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
          Invoices::V2::InvoiceItemInfo.validate_raw(obj: obj.items)
          obj.patient_external_id.is_a?(String) != false || raise("Passed value for field obj.patient_external_id is not the expected type, validation failed.")
          obj.external_customer_identifier.is_a?(String) != false || raise("Passed value for field obj.external_customer_identifier is not the expected type, validation failed.")
          obj.status.is_a?(Invoices::V2::InvoiceStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
          obj.external_identifier.is_a?(String) != false || raise("Passed value for field obj.external_identifier is not the expected type, validation failed.")
          obj.note&.is_a?(String) != false || raise("Passed value for field obj.note is not the expected type, validation failed.")
          obj.customer_invoice_url&.is_a?(String) != false || raise("Passed value for field obj.customer_invoice_url is not the expected type, validation failed.")
          obj.due_date.is_a?(Date) != false || raise("Passed value for field obj.due_date is not the expected type, validation failed.")
          obj.amount_cents.is_a?(Integer) != false || raise("Passed value for field obj.amount_cents is not the expected type, validation failed.")
        end
      end
    end
  end
end
