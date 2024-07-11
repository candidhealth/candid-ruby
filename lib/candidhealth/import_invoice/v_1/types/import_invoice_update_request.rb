# frozen_string_literal: true

require_relative "../../../invoices/v_2/types/invoice_status"
require "date"
require_relative "invoice_item_info_update"
require "ostruct"
require "json"

module CandidApiClient
  module ImportInvoice
    module V1
      module Types
        class ImportInvoiceUpdateRequest
          # @return [String] Link to the patient view of the invoice in the third-party service
          attr_reader :customer_invoice_url
          # @return [CandidApiClient::Invoices::V2::Types::InvoiceStatus]
          attr_reader :status
          # @return [String]
          attr_reader :note
          # @return [Date]
          attr_reader :due_date
          # @return [CandidApiClient::ImportInvoice::V1::Types::InvoiceItemInfoUpdate] None here represents there is no update to the invoice items
          attr_reader :items
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param customer_invoice_url [String] Link to the patient view of the invoice in the third-party service
          # @param status [CandidApiClient::Invoices::V2::Types::InvoiceStatus]
          # @param note [String]
          # @param due_date [Date]
          # @param items [CandidApiClient::ImportInvoice::V1::Types::InvoiceItemInfoUpdate] None here represents there is no update to the invoice items
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::ImportInvoice::V1::Types::ImportInvoiceUpdateRequest]
          def initialize(customer_invoice_url: OMIT, status: OMIT, note: OMIT, due_date: OMIT, items: OMIT,
                         additional_properties: nil)
            @customer_invoice_url = customer_invoice_url if customer_invoice_url != OMIT
            @status = status if status != OMIT
            @note = note if note != OMIT
            @due_date = due_date if due_date != OMIT
            @items = items if items != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "customer_invoice_url": customer_invoice_url,
              "status": status,
              "note": note,
              "due_date": due_date,
              "items": items
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of ImportInvoiceUpdateRequest
          #
          # @param json_object [String]
          # @return [CandidApiClient::ImportInvoice::V1::Types::ImportInvoiceUpdateRequest]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            customer_invoice_url = struct["customer_invoice_url"]
            status = struct["status"]
            note = struct["note"]
            due_date = (Date.parse(parsed_json["due_date"]) unless parsed_json["due_date"].nil?)
            if parsed_json["items"].nil?
              items = nil
            else
              items = parsed_json["items"].to_json
              items = CandidApiClient::ImportInvoice::V1::Types::InvoiceItemInfoUpdate.from_json(json_object: items)
            end
            new(
              customer_invoice_url: customer_invoice_url,
              status: status,
              note: note,
              due_date: due_date,
              items: items,
              additional_properties: struct
            )
          end

          # Serialize an instance of ImportInvoiceUpdateRequest to a JSON object
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
            obj.customer_invoice_url&.is_a?(String) != false || raise("Passed value for field obj.customer_invoice_url is not the expected type, validation failed.")
            obj.status&.is_a?(CandidApiClient::Invoices::V2::Types::InvoiceStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
            obj.note&.is_a?(String) != false || raise("Passed value for field obj.note is not the expected type, validation failed.")
            obj.due_date&.is_a?(Date) != false || raise("Passed value for field obj.due_date is not the expected type, validation failed.")
            obj.items.nil? || CandidApiClient::ImportInvoice::V1::Types::InvoiceItemInfoUpdate.validate_raw(obj: obj.items)
          end
        end
      end
    end
  end
end
