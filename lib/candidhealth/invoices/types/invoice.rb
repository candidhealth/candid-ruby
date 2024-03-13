# frozen_string_literal: true

require_relative "../../commons/types/invoice_id"
require "date"
require_relative "../../commons/types/organization_id"
require_relative "../../commons/types/patient_external_id"
require_relative "../../commons/types/date"
require_relative "invoice_status"
require_relative "invoice_item"
require "json"

module CandidApiClient
  class Invoices
    class Invoice
      attr_reader :id, :created_at, :updated_at, :organzation_id, :source_id, :source_customer_id,
                  :patient_external_id, :note, :due_date, :status, :url, :customer_invoice_url, :items, :additional_properties

      # @param id [Commons::INVOICE_ID]
      # @param created_at [DateTime]
      # @param updated_at [DateTime]
      # @param organzation_id [Commons::ORGANIZATION_ID]
      # @param source_id [String]
      # @param source_customer_id [String]
      # @param patient_external_id [Commons::PATIENT_EXTERNAL_ID]
      # @param note [String]
      # @param due_date [Commons::DATE]
      # @param status [Invoices::InvoiceStatus]
      # @param url [String]
      # @param customer_invoice_url [String]
      # @param items [Array<Invoices::InvoiceItem>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Invoices::Invoice]
      def initialize(id:, created_at:, updated_at:, organzation_id:, source_id:, source_customer_id:,
                     patient_external_id:, due_date:, status:, items:, note: nil, url: nil, customer_invoice_url: nil, additional_properties: nil)
        # @type [Commons::INVOICE_ID]
        @id = id
        # @type [DateTime]
        @created_at = created_at
        # @type [DateTime]
        @updated_at = updated_at
        # @type [Commons::ORGANIZATION_ID]
        @organzation_id = organzation_id
        # @type [String]
        @source_id = source_id
        # @type [String]
        @source_customer_id = source_customer_id
        # @type [Commons::PATIENT_EXTERNAL_ID]
        @patient_external_id = patient_external_id
        # @type [String]
        @note = note
        # @type [Commons::DATE]
        @due_date = due_date
        # @type [Invoices::InvoiceStatus]
        @status = status
        # @type [String]
        @url = url
        # @type [String]
        @customer_invoice_url = customer_invoice_url
        # @type [Array<Invoices::InvoiceItem>]
        @items = items
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of Invoice
      #
      # @param json_object [JSON]
      # @return [Invoices::Invoice]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct.id
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        updated_at = (DateTime.parse(parsed_json["updated_at"]) unless parsed_json["updated_at"].nil?)
        organzation_id = struct.organzation_id
        source_id = struct.source_id
        source_customer_id = struct.source_customer_id
        patient_external_id = struct.patient_external_id
        note = struct.note
        due_date = struct.due_date
        status = struct.status
        url = struct.url
        customer_invoice_url = struct.customer_invoice_url
        items = parsed_json["items"]&.map do |v|
          v = v.to_json
          Invoices::InvoiceItem.from_json(json_object: v)
        end
        new(id: id, created_at: created_at, updated_at: updated_at, organzation_id: organzation_id,
            source_id: source_id, source_customer_id: source_customer_id, patient_external_id: patient_external_id, note: note, due_date: due_date, status: status, url: url, customer_invoice_url: customer_invoice_url, items: items, additional_properties: struct)
      end

      # Serialize an instance of Invoice to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "id": @id,
          "created_at": @created_at,
          "updated_at": @updated_at,
          "organzation_id": @organzation_id,
          "source_id": @source_id,
          "source_customer_id": @source_customer_id,
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
        obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
        obj.organzation_id.is_a?(String) != false || raise("Passed value for field obj.organzation_id is not the expected type, validation failed.")
        obj.source_id.is_a?(String) != false || raise("Passed value for field obj.source_id is not the expected type, validation failed.")
        obj.source_customer_id.is_a?(String) != false || raise("Passed value for field obj.source_customer_id is not the expected type, validation failed.")
        obj.patient_external_id.is_a?(String) != false || raise("Passed value for field obj.patient_external_id is not the expected type, validation failed.")
        obj.note&.is_a?(String) != false || raise("Passed value for field obj.note is not the expected type, validation failed.")
        obj.due_date.is_a?(String) != false || raise("Passed value for field obj.due_date is not the expected type, validation failed.")
        obj.status.is_a?(Invoices::InvoiceStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.url&.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
        obj.customer_invoice_url&.is_a?(String) != false || raise("Passed value for field obj.customer_invoice_url is not the expected type, validation failed.")
        obj.items.is_a?(Array) != false || raise("Passed value for field obj.items is not the expected type, validation failed.")
      end
    end
  end
end
