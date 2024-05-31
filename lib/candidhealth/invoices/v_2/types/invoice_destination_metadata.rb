# frozen_string_literal: true

require_relative "invoice_destination"
require "json"

module CandidApiClient
  module Invoices
    module V2
      class InvoiceDestinationMetadata
        attr_reader :invoice_destination, :source_id, :source_customer_id, :destination_status, :additional_properties

        # @param invoice_destination [Invoices::V2::InvoiceDestination] Defines which third-party service this invoice was created in
        # @param source_id [String] The id of the invoice in the third-party service
        # @param source_customer_id [String] The id of the customer that the invoice is attributed to in the third-party service
        # @param destination_status [String] The status of the invoice in the third-party service
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Invoices::V2::InvoiceDestinationMetadata]
        def initialize(invoice_destination:, source_id:, source_customer_id:, destination_status: nil,
                       additional_properties: nil)
          # @type [Invoices::V2::InvoiceDestination] Defines which third-party service this invoice was created in
          @invoice_destination = invoice_destination
          # @type [String] The id of the invoice in the third-party service
          @source_id = source_id
          # @type [String] The id of the customer that the invoice is attributed to in the third-party service
          @source_customer_id = source_customer_id
          # @type [String] The status of the invoice in the third-party service
          @destination_status = destination_status
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of InvoiceDestinationMetadata
        #
        # @param json_object [JSON]
        # @return [Invoices::V2::InvoiceDestinationMetadata]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          JSON.parse(json_object)
          invoice_destination = struct.invoice_destination
          source_id = struct.source_id
          source_customer_id = struct.source_customer_id
          destination_status = struct.destination_status
          new(invoice_destination: invoice_destination, source_id: source_id, source_customer_id: source_customer_id,
              destination_status: destination_status, additional_properties: struct)
        end

        # Serialize an instance of InvoiceDestinationMetadata to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          {
            "invoice_destination": @invoice_destination,
            "source_id": @source_id,
            "source_customer_id": @source_customer_id,
            "destination_status": @destination_status
          }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.invoice_destination.is_a?(Invoices::V2::InvoiceDestination) != false || raise("Passed value for field obj.invoice_destination is not the expected type, validation failed.")
          obj.source_id.is_a?(String) != false || raise("Passed value for field obj.source_id is not the expected type, validation failed.")
          obj.source_customer_id.is_a?(String) != false || raise("Passed value for field obj.source_customer_id is not the expected type, validation failed.")
          obj.destination_status&.is_a?(String) != false || raise("Passed value for field obj.destination_status is not the expected type, validation failed.")
        end
      end
    end
  end
end
