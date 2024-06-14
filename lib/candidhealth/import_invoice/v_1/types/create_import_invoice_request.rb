# frozen_string_literal: true

require_relative "../../../commons/types/patient_external_id"
require "date"
require_relative "../../../invoices/v_2/types/invoice_item_create"
require_relative "../../../invoices/v_2/types/invoice_status"
require "json"

module CandidApiClient
  module ImportInvoice
    module V1
      class CreateImportInvoiceRequest
        attr_reader :patient_external_id, :external_customer_identifier, :note, :due_date, :items, :status,
                    :external_identifier, :customer_invoice_url, :additional_properties

        # @param patient_external_id [Commons::PATIENT_EXTERNAL_ID]
        # @param external_customer_identifier [String] Id of the customer in the source system
        # @param note [String]
        # @param due_date [Date] If given as None, days_until_due in the payment config will be used to create a default date
        # @param items [Array<Invoices::V2::InvoiceItemCreate>]
        # @param status [Invoices::V2::InvoiceStatus]
        # @param external_identifier [String] Id of the invoice being imported in the source system. Warning - This field CANNOT be updated.
        # @param customer_invoice_url [String] Link to the patient view of the invoice in the third-party service
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [ImportInvoice::V1::CreateImportInvoiceRequest]
        def initialize(patient_external_id:, external_customer_identifier:, items:, status:, external_identifier:,
                       note: nil, due_date: nil, customer_invoice_url: nil, additional_properties: nil)
          # @type [Commons::PATIENT_EXTERNAL_ID]
          @patient_external_id = patient_external_id
          # @type [String] Id of the customer in the source system
          @external_customer_identifier = external_customer_identifier
          # @type [String]
          @note = note
          # @type [Date] If given as None, days_until_due in the payment config will be used to create a default date
          @due_date = due_date
          # @type [Array<Invoices::V2::InvoiceItemCreate>]
          @items = items
          # @type [Invoices::V2::InvoiceStatus]
          @status = status
          # @type [String] Id of the invoice being imported in the source system. Warning - This field CANNOT be updated.
          @external_identifier = external_identifier
          # @type [String] Link to the patient view of the invoice in the third-party service
          @customer_invoice_url = customer_invoice_url
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of CreateImportInvoiceRequest
        #
        # @param json_object [JSON]
        # @return [ImportInvoice::V1::CreateImportInvoiceRequest]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          patient_external_id = struct.patient_external_id
          external_customer_identifier = struct.external_customer_identifier
          note = struct.note
          due_date = (Date.parse(parsed_json["due_date"]) unless parsed_json["due_date"].nil?)
          items = parsed_json["items"]&.map do |v|
            v = v.to_json
            Invoices::V2::InvoiceItemCreate.from_json(json_object: v)
          end
          status = struct.status
          external_identifier = struct.external_identifier
          customer_invoice_url = struct.customer_invoice_url
          new(patient_external_id: patient_external_id, external_customer_identifier: external_customer_identifier,
              note: note, due_date: due_date, items: items, status: status, external_identifier: external_identifier, customer_invoice_url: customer_invoice_url, additional_properties: struct)
        end

        # Serialize an instance of CreateImportInvoiceRequest to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "patient_external_id": @patient_external_id,
            "external_customer_identifier": @external_customer_identifier,
            "note": @note,
            "due_date": @due_date,
            "items": @items,
            "status": @status,
            "external_identifier": @external_identifier,
            "customer_invoice_url": @customer_invoice_url
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.patient_external_id.is_a?(String) != false || raise("Passed value for field obj.patient_external_id is not the expected type, validation failed.")
          obj.external_customer_identifier.is_a?(String) != false || raise("Passed value for field obj.external_customer_identifier is not the expected type, validation failed.")
          obj.note&.is_a?(String) != false || raise("Passed value for field obj.note is not the expected type, validation failed.")
          obj.due_date&.is_a?(Date) != false || raise("Passed value for field obj.due_date is not the expected type, validation failed.")
          obj.items.is_a?(Array) != false || raise("Passed value for field obj.items is not the expected type, validation failed.")
          obj.status.is_a?(Invoices::V2::InvoiceStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
          obj.external_identifier.is_a?(String) != false || raise("Passed value for field obj.external_identifier is not the expected type, validation failed.")
          obj.customer_invoice_url&.is_a?(String) != false || raise("Passed value for field obj.customer_invoice_url is not the expected type, validation failed.")
        end
      end
    end
  end
end
