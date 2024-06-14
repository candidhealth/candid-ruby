# frozen_string_literal: true

require_relative "invoice_item_attribution_create"
require "json"

module CandidApiClient
  module Invoices
    module V2
      class InvoiceItemCreate
        attr_reader :attribution, :amount_cents, :additional_properties

        # @param attribution [Invoices::V2::InvoiceItemAttributionCreate]
        # @param amount_cents [Integer]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Invoices::V2::InvoiceItemCreate]
        def initialize(attribution:, amount_cents:, additional_properties: nil)
          # @type [Invoices::V2::InvoiceItemAttributionCreate]
          @attribution = attribution
          # @type [Integer]
          @amount_cents = amount_cents
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of InvoiceItemCreate
        #
        # @param json_object [JSON]
        # @return [Invoices::V2::InvoiceItemCreate]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          if parsed_json["attribution"].nil?
            attribution = nil
          else
            attribution = parsed_json["attribution"].to_json
            attribution = Invoices::V2::InvoiceItemAttributionCreate.from_json(json_object: attribution)
          end
          amount_cents = struct.amount_cents
          new(attribution: attribution, amount_cents: amount_cents, additional_properties: struct)
        end

        # Serialize an instance of InvoiceItemCreate to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "attribution": @attribution, "amount_cents": @amount_cents }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          Invoices::V2::InvoiceItemAttributionCreate.validate_raw(obj: obj.attribution)
          obj.amount_cents.is_a?(Integer) != false || raise("Passed value for field obj.amount_cents is not the expected type, validation failed.")
        end
      end
    end
  end
end
