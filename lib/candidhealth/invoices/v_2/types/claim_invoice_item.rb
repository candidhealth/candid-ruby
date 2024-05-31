# frozen_string_literal: true

require_relative "../../../commons/types/claim_id"
require "json"

module CandidApiClient
  module Invoices
    module V2
      class ClaimInvoiceItem
        attr_reader :claim_id, :amount_cents, :additional_properties

        # @param claim_id [Commons::CLAIM_ID]
        # @param amount_cents [Integer]
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [Invoices::V2::ClaimInvoiceItem]
        def initialize(claim_id:, amount_cents:, additional_properties: nil)
          # @type [Commons::CLAIM_ID]
          @claim_id = claim_id
          # @type [Integer]
          @amount_cents = amount_cents
          # @type [OpenStruct] Additional properties unmapped to the current class definition
          @additional_properties = additional_properties
        end

        # Deserialize a JSON object to an instance of ClaimInvoiceItem
        #
        # @param json_object [JSON]
        # @return [Invoices::V2::ClaimInvoiceItem]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          JSON.parse(json_object)
          claim_id = struct.claim_id
          amount_cents = struct.amount_cents
          new(claim_id: claim_id, amount_cents: amount_cents, additional_properties: struct)
        end

        # Serialize an instance of ClaimInvoiceItem to a JSON object
        #
        # @return [JSON]
        def to_json(*_args)
          { "claim_id": @claim_id, "amount_cents": @amount_cents }.to_json
        end

        # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
        #
        # @param obj [Object]
        # @return [Void]
        def self.validate_raw(obj:)
          obj.claim_id.is_a?(UUID) != false || raise("Passed value for field obj.claim_id is not the expected type, validation failed.")
          obj.amount_cents.is_a?(Integer) != false || raise("Passed value for field obj.amount_cents is not the expected type, validation failed.")
        end
      end
    end
  end
end
