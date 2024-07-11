# frozen_string_literal: true

require_relative "invoice"
require_relative "invoice_destination"
require "ostruct"
require "json"

module CandidApiClient
  module Invoices
    module V2
      module Types
        class InvoiceInfo
          # @return [String]
          attr_reader :id
          # @return [CandidApiClient::Invoices::V2::Types::Invoice]
          attr_reader :invoice
          # @return [CandidApiClient::Invoices::V2::Types::InvoiceDestination]
          attr_reader :invoice_type
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param id [String]
          # @param invoice [CandidApiClient::Invoices::V2::Types::Invoice]
          # @param invoice_type [CandidApiClient::Invoices::V2::Types::InvoiceDestination]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Invoices::V2::Types::InvoiceInfo]
          def initialize(id:, invoice:, invoice_type:, additional_properties: nil)
            @id = id
            @invoice = invoice
            @invoice_type = invoice_type
            @additional_properties = additional_properties
            @_field_set = { "id": id, "invoice": invoice, "invoice_type": invoice_type }
          end

          # Deserialize a JSON object to an instance of InvoiceInfo
          #
          # @param json_object [String]
          # @return [CandidApiClient::Invoices::V2::Types::InvoiceInfo]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            id = struct["id"]
            if parsed_json["invoice"].nil?
              invoice = nil
            else
              invoice = parsed_json["invoice"].to_json
              invoice = CandidApiClient::Invoices::V2::Types::Invoice.from_json(json_object: invoice)
            end
            invoice_type = struct["invoice_type"]
            new(
              id: id,
              invoice: invoice,
              invoice_type: invoice_type,
              additional_properties: struct
            )
          end

          # Serialize an instance of InvoiceInfo to a JSON object
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
            CandidApiClient::Invoices::V2::Types::Invoice.validate_raw(obj: obj.invoice)
            obj.invoice_type.is_a?(CandidApiClient::Invoices::V2::Types::InvoiceDestination) != false || raise("Passed value for field obj.invoice_type is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
