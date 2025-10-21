# frozen_string_literal: true

module Candid
  module Invoices
    module V2
      module Types
        class InvoiceDestinationMetadata < Internal::Types::Model
          field :invoice_destination, -> { Candid::Invoices::V2::Types::InvoiceDestination }, optional: false, nullable: false
          field :source_id, -> { String }, optional: false, nullable: false
          field :source_customer_id, -> { String }, optional: false, nullable: false
          field :destination_status, -> { String }, optional: true, nullable: false

        end
      end
    end
  end
end
