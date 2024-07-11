# frozen_string_literal: true

require "date"
require_relative "../../../invoices/v_2/types/invoice_item_create"
require_relative "../../../invoices/v_2/types/invoice_status"
require "ostruct"
require "json"

module CandidApiClient
  module ImportInvoice
    module V1
      module Types
        class CreateImportInvoiceRequest
          # @return [String]
          attr_reader :external_payment_account_config_id
          # @return [String]
          attr_reader :patient_external_id
          # @return [String] Id of the customer in the source system
          attr_reader :external_customer_identifier
          # @return [String]
          attr_reader :note
          # @return [Date] If given as None, days_until_due in the payment config will be used to create a
          #  default date
          attr_reader :due_date
          # @return [Array<CandidApiClient::Invoices::V2::Types::InvoiceItemCreate>]
          attr_reader :items
          # @return [CandidApiClient::Invoices::V2::Types::InvoiceStatus]
          attr_reader :status
          # @return [String] Id of the invoice being imported in the source system. Warning - This field
          #  CANNOT be updated.
          attr_reader :external_identifier
          # @return [String] Link to the patient view of the invoice in the third-party service
          attr_reader :customer_invoice_url
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param external_payment_account_config_id [String]
          # @param patient_external_id [String]
          # @param external_customer_identifier [String] Id of the customer in the source system
          # @param note [String]
          # @param due_date [Date] If given as None, days_until_due in the payment config will be used to create a
          #  default date
          # @param items [Array<CandidApiClient::Invoices::V2::Types::InvoiceItemCreate>]
          # @param status [CandidApiClient::Invoices::V2::Types::InvoiceStatus]
          # @param external_identifier [String] Id of the invoice being imported in the source system. Warning - This field
          #  CANNOT be updated.
          # @param customer_invoice_url [String] Link to the patient view of the invoice in the third-party service
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::ImportInvoice::V1::Types::CreateImportInvoiceRequest]
          def initialize(external_payment_account_config_id:, patient_external_id:, external_customer_identifier:, items:, status:, external_identifier:,
                         note: OMIT, due_date: OMIT, customer_invoice_url: OMIT, additional_properties: nil)
            @external_payment_account_config_id = external_payment_account_config_id
            @patient_external_id = patient_external_id
            @external_customer_identifier = external_customer_identifier
            @note = note if note != OMIT
            @due_date = due_date if due_date != OMIT
            @items = items
            @status = status
            @external_identifier = external_identifier
            @customer_invoice_url = customer_invoice_url if customer_invoice_url != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "external_payment_account_config_id": external_payment_account_config_id,
              "patient_external_id": patient_external_id,
              "external_customer_identifier": external_customer_identifier,
              "note": note,
              "due_date": due_date,
              "items": items,
              "status": status,
              "external_identifier": external_identifier,
              "customer_invoice_url": customer_invoice_url
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of CreateImportInvoiceRequest
          #
          # @param json_object [String]
          # @return [CandidApiClient::ImportInvoice::V1::Types::CreateImportInvoiceRequest]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            external_payment_account_config_id = struct["external_payment_account_config_id"]
            patient_external_id = struct["patient_external_id"]
            external_customer_identifier = struct["external_customer_identifier"]
            note = struct["note"]
            due_date = (Date.parse(parsed_json["due_date"]) unless parsed_json["due_date"].nil?)
            items = parsed_json["items"]&.map do |item|
              item = item.to_json
              CandidApiClient::Invoices::V2::Types::InvoiceItemCreate.from_json(json_object: item)
            end
            status = struct["status"]
            external_identifier = struct["external_identifier"]
            customer_invoice_url = struct["customer_invoice_url"]
            new(
              external_payment_account_config_id: external_payment_account_config_id,
              patient_external_id: patient_external_id,
              external_customer_identifier: external_customer_identifier,
              note: note,
              due_date: due_date,
              items: items,
              status: status,
              external_identifier: external_identifier,
              customer_invoice_url: customer_invoice_url,
              additional_properties: struct
            )
          end

          # Serialize an instance of CreateImportInvoiceRequest to a JSON object
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
            obj.external_payment_account_config_id.is_a?(String) != false || raise("Passed value for field obj.external_payment_account_config_id is not the expected type, validation failed.")
            obj.patient_external_id.is_a?(String) != false || raise("Passed value for field obj.patient_external_id is not the expected type, validation failed.")
            obj.external_customer_identifier.is_a?(String) != false || raise("Passed value for field obj.external_customer_identifier is not the expected type, validation failed.")
            obj.note&.is_a?(String) != false || raise("Passed value for field obj.note is not the expected type, validation failed.")
            obj.due_date&.is_a?(Date) != false || raise("Passed value for field obj.due_date is not the expected type, validation failed.")
            obj.items.is_a?(Array) != false || raise("Passed value for field obj.items is not the expected type, validation failed.")
            obj.status.is_a?(CandidApiClient::Invoices::V2::Types::InvoiceStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
            obj.external_identifier.is_a?(String) != false || raise("Passed value for field obj.external_identifier is not the expected type, validation failed.")
            obj.customer_invoice_url&.is_a?(String) != false || raise("Passed value for field obj.customer_invoice_url is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
