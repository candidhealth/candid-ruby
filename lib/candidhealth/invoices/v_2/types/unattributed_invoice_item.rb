# frozen_string_literal: true

require "ostruct"
require "json"

module CandidApiClient
  module Invoices
    module V2
      module Types
        class UnattributedInvoiceItem
          # @return [Integer]
          attr_reader :amount_cents
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param amount_cents [Integer]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::Invoices::V2::Types::UnattributedInvoiceItem]
          def initialize(amount_cents:, additional_properties: nil)
            @amount_cents = amount_cents
            @additional_properties = additional_properties
            @_field_set = { "amount_cents": amount_cents }
          end

          # Deserialize a JSON object to an instance of UnattributedInvoiceItem
          #
          # @param json_object [String]
          # @return [CandidApiClient::Invoices::V2::Types::UnattributedInvoiceItem]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            amount_cents = struct["amount_cents"]
            new(amount_cents: amount_cents, additional_properties: struct)
          end

          # Serialize an instance of UnattributedInvoiceItem to a JSON object
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
          end
        end
      end
    end
  end
end
