# frozen_string_literal: true

require "json"

module CandidApiClient
  module Invoices
    module V2
      class UnattributedInvoiceItem
        attr_reader :amount_cents, :additional_properties

        # @param amount_cents [Integer]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Invoices::V2::UnattributedInvoiceItem]
        def initialize(amount_cents:, additional_properties: nil)
          # @type [Integer]
          @amount_cents = amount_cents
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of UnattributedInvoiceItem
        #
        # @param json_object [JSON]
        # @return [Invoices::V2::UnattributedInvoiceItem]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          JSON.parse(json_object)
          amount_cents = struct.amount_cents
          new(amount_cents: amount_cents, additional_properties: struct)
        end

        # Serialize an instance of UnattributedInvoiceItem to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "amount_cents": @amount_cents }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
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
