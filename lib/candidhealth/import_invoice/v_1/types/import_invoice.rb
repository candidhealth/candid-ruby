# frozen_string_literal: true

require "date"
require_relative "../../../invoices/v_2/types/invoice_item_info"
require_relative "../../../invoices/v_2/types/invoice_status"
require "ostruct"
require "json"

module CandidApiClient
  module ImportInvoice
    module V1
      module Types
        class ImportInvoice
          # @return [String]
          attr_reader :id
          # @return [DateTime]
          attr_reader :created_at
          # @return [DateTime]
          attr_reader :updated_at
          # @return [CandidApiClient::Invoices::V2::Types::InvoiceItemInfo] The InvoiceItem rollup which contains all claim and service line invoice items
          attr_reader :items
          # @return [String]
          attr_reader :patient_external_id
          # @return [String] Id of the customer in the source system
          attr_reader :external_customer_identifier
          # @return [CandidApiClient::Invoices::V2::Types::InvoiceStatus]
          attr_reader :status
          # @return [String] Id of the invoice being imported in the source system
          attr_reader :external_identifier
          # @return [String]
          attr_reader :note
          # @return [String] Link to the patient view of the invoice in the third-party service
          attr_reader :customer_invoice_url
          # @return [Date]
          attr_reader :due_date
          # @return [Integer] Total monetary amount (in cents) of all Invoice Items
          attr_reader :amount_cents
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param id [String]
          # @param created_at [DateTime]
          # @param updated_at [DateTime]
          # @param items [CandidApiClient::Invoices::V2::Types::InvoiceItemInfo] The InvoiceItem rollup which contains all claim and service line invoice items
          # @param patient_external_id [String]
          # @param external_customer_identifier [String] Id of the customer in the source system
          # @param status [CandidApiClient::Invoices::V2::Types::InvoiceStatus]
          # @param external_identifier [String] Id of the invoice being imported in the source system
          # @param note [String]
          # @param customer_invoice_url [String] Link to the patient view of the invoice in the third-party service
          # @param due_date [Date]
          # @param amount_cents [Integer] Total monetary amount (in cents) of all Invoice Items
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::ImportInvoice::V1::Types::ImportInvoice]
          def initialize(id:, created_at:, updated_at:, items:, patient_external_id:, external_customer_identifier:,
                         status:, external_identifier:, due_date:, amount_cents:, note: OMIT, customer_invoice_url: OMIT, additional_properties: nil)
            @id = id
            @created_at = created_at
            @updated_at = updated_at
            @items = items
            @patient_external_id = patient_external_id
            @external_customer_identifier = external_customer_identifier
            @status = status
            @external_identifier = external_identifier
            @note = note if note != OMIT
            @customer_invoice_url = customer_invoice_url if customer_invoice_url != OMIT
            @due_date = due_date
            @amount_cents = amount_cents
            @additional_properties = additional_properties
            @_field_set = {
              "id": id,
              "created_at": created_at,
              "updated_at": updated_at,
              "items": items,
              "patient_external_id": patient_external_id,
              "external_customer_identifier": external_customer_identifier,
              "status": status,
              "external_identifier": external_identifier,
              "note": note,
              "customer_invoice_url": customer_invoice_url,
              "due_date": due_date,
              "amount_cents": amount_cents
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of ImportInvoice
          #
          # @param json_object [String]
          # @return [CandidApiClient::ImportInvoice::V1::Types::ImportInvoice]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            id = struct["id"]
            created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
            updated_at = (DateTime.parse(parsed_json["updated_at"]) unless parsed_json["updated_at"].nil?)
            if parsed_json["items"].nil?
              items = nil
            else
              items = parsed_json["items"].to_json
              items = CandidApiClient::Invoices::V2::Types::InvoiceItemInfo.from_json(json_object: items)
            end
            patient_external_id = struct["patient_external_id"]
            external_customer_identifier = struct["external_customer_identifier"]
            status = struct["status"]
            external_identifier = struct["external_identifier"]
            note = struct["note"]
            customer_invoice_url = struct["customer_invoice_url"]
            due_date = (Date.parse(parsed_json["due_date"]) unless parsed_json["due_date"].nil?)
            amount_cents = struct["amount_cents"]
            new(
              id: id,
              created_at: created_at,
              updated_at: updated_at,
              items: items,
              patient_external_id: patient_external_id,
              external_customer_identifier: external_customer_identifier,
              status: status,
              external_identifier: external_identifier,
              note: note,
              customer_invoice_url: customer_invoice_url,
              due_date: due_date,
              amount_cents: amount_cents,
              additional_properties: struct
            )
          end

          # Serialize an instance of ImportInvoice to a JSON object
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
            obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
            obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
            obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
            CandidApiClient::Invoices::V2::Types::InvoiceItemInfo.validate_raw(obj: obj.items)
            obj.patient_external_id.is_a?(String) != false || raise("Passed value for field obj.patient_external_id is not the expected type, validation failed.")
            obj.external_customer_identifier.is_a?(String) != false || raise("Passed value for field obj.external_customer_identifier is not the expected type, validation failed.")
            obj.status.is_a?(CandidApiClient::Invoices::V2::Types::InvoiceStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
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
end
