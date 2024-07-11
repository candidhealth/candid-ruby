# frozen_string_literal: true

require "date"
require_relative "invoice_status"
require_relative "invoice_item"
require "ostruct"
require "json"

module CandidApiClient
  module Invoices
    module Types
      class Invoice
        # @return [String]
        attr_reader :id
        # @return [DateTime]
        attr_reader :created_at
        # @return [DateTime]
        attr_reader :updated_at
        # @return [String]
        attr_reader :organzation_id
        # @return [String]
        attr_reader :source_id
        # @return [String]
        attr_reader :source_customer_id
        # @return [String]
        attr_reader :patient_external_id
        # @return [String]
        attr_reader :note
        # @return [String]
        attr_reader :due_date
        # @return [CandidApiClient::Invoices::Types::InvoiceStatus]
        attr_reader :status
        # @return [String]
        attr_reader :url
        # @return [String]
        attr_reader :customer_invoice_url
        # @return [Array<CandidApiClient::Invoices::Types::InvoiceItem>]
        attr_reader :items
        # @return [OpenStruct] Additional properties unmapped to the current class definition
        attr_reader :additional_properties
        # @return [Object]
        attr_reader :_field_set
        protected :_field_set

        OMIT = Object.new

        # @param id [String]
        # @param created_at [DateTime]
        # @param updated_at [DateTime]
        # @param organzation_id [String]
        # @param source_id [String]
        # @param source_customer_id [String]
        # @param patient_external_id [String]
        # @param note [String]
        # @param due_date [String]
        # @param status [CandidApiClient::Invoices::Types::InvoiceStatus]
        # @param url [String]
        # @param customer_invoice_url [String]
        # @param items [Array<CandidApiClient::Invoices::Types::InvoiceItem>]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [CandidApiClient::Invoices::Types::Invoice]
        def initialize(id:, created_at:, updated_at:, organzation_id:, source_id:, source_customer_id:,
                       patient_external_id:, due_date:, status:, items:, note: OMIT, url: OMIT, customer_invoice_url: OMIT, additional_properties: nil)
          @id = id
          @created_at = created_at
          @updated_at = updated_at
          @organzation_id = organzation_id
          @source_id = source_id
          @source_customer_id = source_customer_id
          @patient_external_id = patient_external_id
          @note = note if note != OMIT
          @due_date = due_date
          @status = status
          @url = url if url != OMIT
          @customer_invoice_url = customer_invoice_url if customer_invoice_url != OMIT
          @items = items
          @additional_properties = additional_properties
          @_field_set = {
            "id": id,
            "created_at": created_at,
            "updated_at": updated_at,
            "organzation_id": organzation_id,
            "source_id": source_id,
            "source_customer_id": source_customer_id,
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
        # @return [CandidApiClient::Invoices::Types::Invoice]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          id = struct["id"]
          created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
          updated_at = (DateTime.parse(parsed_json["updated_at"]) unless parsed_json["updated_at"].nil?)
          organzation_id = struct["organzation_id"]
          source_id = struct["source_id"]
          source_customer_id = struct["source_customer_id"]
          patient_external_id = struct["patient_external_id"]
          note = struct["note"]
          due_date = struct["due_date"]
          status = struct["status"]
          url = struct["url"]
          customer_invoice_url = struct["customer_invoice_url"]
          items = parsed_json["items"]&.map do |item|
            item = item.to_json
            CandidApiClient::Invoices::Types::InvoiceItem.from_json(json_object: item)
          end
          new(
            id: id,
            created_at: created_at,
            updated_at: updated_at,
            organzation_id: organzation_id,
            source_id: source_id,
            source_customer_id: source_customer_id,
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
          obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
          obj.created_at.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
          obj.updated_at.is_a?(DateTime) != false || raise("Passed value for field obj.updated_at is not the expected type, validation failed.")
          obj.organzation_id.is_a?(String) != false || raise("Passed value for field obj.organzation_id is not the expected type, validation failed.")
          obj.source_id.is_a?(String) != false || raise("Passed value for field obj.source_id is not the expected type, validation failed.")
          obj.source_customer_id.is_a?(String) != false || raise("Passed value for field obj.source_customer_id is not the expected type, validation failed.")
          obj.patient_external_id.is_a?(String) != false || raise("Passed value for field obj.patient_external_id is not the expected type, validation failed.")
          obj.note&.is_a?(String) != false || raise("Passed value for field obj.note is not the expected type, validation failed.")
          obj.due_date.is_a?(String) != false || raise("Passed value for field obj.due_date is not the expected type, validation failed.")
          obj.status.is_a?(CandidApiClient::Invoices::Types::InvoiceStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
          obj.url&.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
          obj.customer_invoice_url&.is_a?(String) != false || raise("Passed value for field obj.customer_invoice_url is not the expected type, validation failed.")
          obj.items.is_a?(Array) != false || raise("Passed value for field obj.items is not the expected type, validation failed.")
        end
      end
    end
  end
end
