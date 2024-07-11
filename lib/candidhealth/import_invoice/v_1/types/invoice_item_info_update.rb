# frozen_string_literal: true

require_relative "invoice_item_update_type"
require_relative "../../../invoices/v_2/types/invoice_item_create"
require "ostruct"
require "json"

module CandidApiClient
  module ImportInvoice
    module V1
      module Types
        class InvoiceItemInfoUpdate
          # @return [CandidApiClient::ImportInvoice::V1::Types::InvoiceItemUpdateType] The only supported update operations for invoice items is to either overwrite
          #  the entire list of invoice items
          #  or to append new invoice items
          attr_reader :update_type
          # @return [Array<CandidApiClient::Invoices::V2::Types::InvoiceItemCreate>]
          attr_reader :items
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param update_type [CandidApiClient::ImportInvoice::V1::Types::InvoiceItemUpdateType] The only supported update operations for invoice items is to either overwrite
          #  the entire list of invoice items
          #  or to append new invoice items
          # @param items [Array<CandidApiClient::Invoices::V2::Types::InvoiceItemCreate>]
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::ImportInvoice::V1::Types::InvoiceItemInfoUpdate]
          def initialize(update_type:, items:, additional_properties: nil)
            @update_type = update_type
            @items = items
            @additional_properties = additional_properties
            @_field_set = { "update_type": update_type, "items": items }
          end

          # Deserialize a JSON object to an instance of InvoiceItemInfoUpdate
          #
          # @param json_object [String]
          # @return [CandidApiClient::ImportInvoice::V1::Types::InvoiceItemInfoUpdate]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            update_type = struct["update_type"]
            items = parsed_json["items"]&.map do |item|
              item = item.to_json
              CandidApiClient::Invoices::V2::Types::InvoiceItemCreate.from_json(json_object: item)
            end
            new(
              update_type: update_type,
              items: items,
              additional_properties: struct
            )
          end

          # Serialize an instance of InvoiceItemInfoUpdate to a JSON object
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
            obj.update_type.is_a?(CandidApiClient::ImportInvoice::V1::Types::InvoiceItemUpdateType) != false || raise("Passed value for field obj.update_type is not the expected type, validation failed.")
            obj.items.is_a?(Array) != false || raise("Passed value for field obj.items is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
