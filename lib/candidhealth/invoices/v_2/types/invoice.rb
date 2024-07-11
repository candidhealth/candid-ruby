# frozen_string_literal: true

require "date"
require_relative "invoice_destination_metadata"
require_relative "invoice_status"
require_relative "invoice_item_info"
require "ostruct"
require "json"

module CandidApiClient
  module Invoices
    module V2
      module Types
        class Invoice
          # @return [Integer] Total monetary amount (in cents) of all Invoice Items
          attr_reader :amount_cents
          # @return [DateTime]
          attr_reader :created_at
          # @return [DateTime]
          attr_reader :updated_at
          # @return [String]
          attr_reader :organization_id
          # @return [CandidApiClient::Invoices::V2::Types::InvoiceDestinationMetadata] Contains all relevant information from the third-party service this invoice was
          #  created in
          attr_reader :invoice_destination_metadata
          # @return [String]
          attr_reader :patient_external_id
          # @return [String]
          attr_reader :note
          # @return [Date]
          attr_reader :due_date
          # @return [CandidApiClient::Invoices::V2::Types::InvoiceStatus]
          attr_reader :status
          # @return [String] Link to the admin view of the invoice in the third-party service
          attr_reader :url
          # @return [String] Link to the patient view of the invoice in the third-party service
          attr_reader :customer_invoice_url
          # @return [CandidApiClient::Invoices::V2::Types::InvoiceItemInfo] The InvoiceItem rollup which contains all claim and service line invoice items
          attr_reader :items
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param amount_cents [Integer] Total monetary amount (in cents) of all Invoice Items
          # @param created_at [DateTime]
          # @param updated_at [DateTime]
          # @param organization_id [String]
          # @param invoice_destination_metadata [CandidApiClient::Invoices::V2::Types::InvoiceDestinationMetadata] Contains all relevant information from the third-party service this invoice was
          #  created in
          # @param patient_external_id [String]
          # @param note [String]
          # @param due_date [Date]
          # @param status [CandidApiClient::Invoices::V2::Types::InvoiceStatus]
          # @param url [String] Link to the admin view of the invoice in the third-party service
          # @param customer_invoice_url [String] Link to the patient view of the invoice in the third-party service
          # @param items [CandidApiClient::Invoices::V2::Types::InvoiceItemInfo] The InvoiceItem rollup which contains all claim and service line invoice items
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Invoices::V2::Types::Invoice]
          def initialize(amount_cents:, created_at:, updated_at:, organization_id:, invoice_destination_metadata:,
                         patient_external_id:, due_date:, status:, items:, note: OMIT, url: OMIT, customer_invoice_url: OMIT, additional_properties: nil)
            @amount_cents = amount_cents
            @created_at = created_at
            @updated_at = updated_at
            @organization_id = organization_id
            @invoice_destination_metadata = invoice_destination_metadata
            @patient_external_id = patient_external_id
            @note = note if note != OMIT
            @due_date = due_date
            @status = status
            @url = url if url != OMIT
            @customer_invoice_url = customer_invoice_url if customer_invoice_url != OMIT
            @items = items
            @additional_properties = additional_properties
            @_field_set = {
              "amount_cents": amount_cents,
              "created_at": created_at,
              "updated_at": updated_at,
              "organization_id": organization_id,
              "invoice_destination_metadata": invoice_destination_metadata,
              "patient_external_id": patient_external_id,
              "note": note,
              "due_date": due_date,
              "status": status,
              "url": url,
              "customer_invoice_url": customer_invoice_url,
              "items": items
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of Invoice
          #
          # @param json_object [String]
          # @return [CandidApiClient::Invoices::V2::Types::Invoice]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            amount_cents = struct["amount_cents"]
            created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
            updated_at = (DateTime.parse(parsed_json["updated_at"]) unless parsed_json["updated_at"].nil?)
            organization_id = struct["organization_id"]
            if parsed_json["invoice_destination_metadata"].nil?
              invoice_destination_metadata = nil
            else
              invoice_destination_metadata = parsed_json["invoice_destination_metadata"].to_json
              invoice_destination_metadata = CandidApiClient::Invoices::V2::Types::InvoiceDestinationMetadata.from_json(json_object: invoice_destination_metadata)
            end
            patient_external_id = struct["patient_external_id"]
            note = struct["note"]
            due_date = (Date.parse(parsed_json["due_date"]) unless parsed_json["due_date"].nil?)
            status = struct["status"]
            url = struct["url"]
            customer_invoice_url = struct["customer_invoice_url"]
            if parsed_json["items"].nil?
              items = nil
            else
              items = parsed_json["items"].to_json
              items = CandidApiClient::Invoices::V2::Types::InvoiceItemInfo.from_json(json_object: items)
            end
            new(
              amount_cents: amount_cents,
              created_at: created_at,
              updated_at: updated_at,
              organization_id: organization_id,
              invoice_destination_metadata: invoice_destination_metadata,
              patient_external_id: patient_external_id,
              note: note,
              due_date: due_date,
              status: status,
              url: url,
              customer_invoice_url: customer_invoice_url,
              items: items,
              additional_properties: struct
            )
          end

          # Serialize an instance of Invoice to a JSON object
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
            obj.amount_cents.is_a?(Integer) != false || raise("Passed value for field obj.amount_cents is not the expected type, validation failed.")
            obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
            obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
            obj.organization_id.is_a?(String) != false || raise("Passed value for field obj.organization_id is not the expected type, validation failed.")
            CandidApiClient::Invoices::V2::Types::InvoiceDestinationMetadata.validate_raw(obj: obj.invoice_destination_metadata)
            obj.patient_external_id.is_a?(String) != false || raise("Passed value for field obj.patient_external_id is not the expected type, validation failed.")
            obj.note&.is_a?(String) != false || raise("Passed value for field obj.note is not the expected type, validation failed.")
            obj.due_date.is_a?(Date) != false || raise("Passed value for field obj.due_date is not the expected type, validation failed.")
            obj.status.is_a?(CandidApiClient::Invoices::V2::Types::InvoiceStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
            obj.url&.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
            obj.customer_invoice_url&.is_a?(String) != false || raise("Passed value for field obj.customer_invoice_url is not the expected type, validation failed.")
            CandidApiClient::Invoices::V2::Types::InvoiceItemInfo.validate_raw(obj: obj.items)
          end
        end
      end
    end
  end
end
