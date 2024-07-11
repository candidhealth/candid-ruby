# frozen_string_literal: true

require_relative "invoice_item_attribution_create"
require "ostruct"
require "json"

module CandidApiClient
  module Invoices
    module V2
      module Types
        class InvoiceItemCreate
          # @return [CandidApiClient::Invoices::V2::Types::InvoiceItemAttributionCreate]
          attr_reader :attribution
          # @return [Integer]
          attr_reader :amount_cents
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param attribution [CandidApiClient::Invoices::V2::Types::InvoiceItemAttributionCreate]
          # @param amount_cents [Integer]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Invoices::V2::Types::InvoiceItemCreate]
          def initialize(attribution:, amount_cents:, additional_properties: nil)
            @attribution = attribution
            @amount_cents = amount_cents
            @additional_properties = additional_properties
            @_field_set = { "attribution": attribution, "amount_cents": amount_cents }
          end

          # Deserialize a JSON object to an instance of InvoiceItemCreate
          #
          # @param json_object [String]
          # @return [CandidApiClient::Invoices::V2::Types::InvoiceItemCreate]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            if parsed_json["attribution"].nil?
              attribution = nil
            else
              attribution = parsed_json["attribution"].to_json
              attribution = CandidApiClient::Invoices::V2::Types::InvoiceItemAttributionCreate.from_json(json_object: attribution)
            end
            amount_cents = struct["amount_cents"]
            new(
              attribution: attribution,
              amount_cents: amount_cents,
              additional_properties: struct
            )
          end

          # Serialize an instance of InvoiceItemCreate to a JSON object
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
            CandidApiClient::Invoices::V2::Types::InvoiceItemAttributionCreate.validate_raw(obj: obj.attribution)
            obj.amount_cents.is_a?(Integer) != false || raise("Passed value for field obj.amount_cents is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
