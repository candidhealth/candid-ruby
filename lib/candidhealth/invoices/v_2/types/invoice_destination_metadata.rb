# frozen_string_literal: true

require_relative "invoice_destination"
require "ostruct"
require "json"

module CandidApiClient
  module Invoices
    module V2
      module Types
        class InvoiceDestinationMetadata
          # @return [CandidApiClient::Invoices::V2::Types::InvoiceDestination] Defines which third-party service this invoice was created in
          attr_reader :invoice_destination
          # @return [String] The id of the invoice in the third-party service
          attr_reader :source_id
          # @return [String] The id of the customer that the invoice is attributed to in the third-party
          #  service
          attr_reader :source_customer_id
          # @return [String] The status of the invoice in the third-party service
          attr_reader :destination_status
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param invoice_destination [CandidApiClient::Invoices::V2::Types::InvoiceDestination] Defines which third-party service this invoice was created in
          # @param source_id [String] The id of the invoice in the third-party service
          # @param source_customer_id [String] The id of the customer that the invoice is attributed to in the third-party
          #  service
          # @param destination_status [String] The status of the invoice in the third-party service
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Invoices::V2::Types::InvoiceDestinationMetadata]
          def initialize(invoice_destination:, source_id:, source_customer_id:, destination_status: OMIT,
                         additional_properties: nil)
            @invoice_destination = invoice_destination
            @source_id = source_id
            @source_customer_id = source_customer_id
            @destination_status = destination_status if destination_status != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "invoice_destination": invoice_destination,
              "source_id": source_id,
              "source_customer_id": source_customer_id,
              "destination_status": destination_status
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of InvoiceDestinationMetadata
          #
          # @param json_object [String]
          # @return [CandidApiClient::Invoices::V2::Types::InvoiceDestinationMetadata]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            invoice_destination = struct["invoice_destination"]
            source_id = struct["source_id"]
            source_customer_id = struct["source_customer_id"]
            destination_status = struct["destination_status"]
            new(
              invoice_destination: invoice_destination,
              source_id: source_id,
              source_customer_id: source_customer_id,
              destination_status: destination_status,
              additional_properties: struct
            )
          end

          # Serialize an instance of InvoiceDestinationMetadata to a JSON object
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
            obj.invoice_destination.is_a?(CandidApiClient::Invoices::V2::Types::InvoiceDestination) != false || raise("Passed value for field obj.invoice_destination is not the expected type, validation failed.")
            obj.source_id.is_a?(String) != false || raise("Passed value for field obj.source_id is not the expected type, validation failed.")
            obj.source_customer_id.is_a?(String) != false || raise("Passed value for field obj.source_customer_id is not the expected type, validation failed.")
            obj.destination_status&.is_a?(String) != false || raise("Passed value for field obj.destination_status is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
