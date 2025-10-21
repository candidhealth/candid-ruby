# frozen_string_literal: true

module Candid
  module Invoices
    module V2
      module Types
        class Invoice < Internal::Types::Model
          field :amount_cents, -> { Integer }, optional: false, nullable: false
          field :created_at, -> { String }, optional: false, nullable: false
          field :updated_at, -> { String }, optional: false, nullable: false
          field :organization_id, -> { String }, optional: false, nullable: false
          field :invoice_destination_metadata, -> { Candid::Invoices::V2::Types::InvoiceDestinationMetadata }, optional: false, nullable: false
          field :patient_external_id, -> { String }, optional: false, nullable: false
          field :note, -> { String }, optional: true, nullable: false
          field :due_date, -> { String }, optional: false, nullable: false
          field :status, -> { Candid::Invoices::V2::Types::InvoiceStatus }, optional: false, nullable: false
          field :url, -> { String }, optional: true, nullable: false
          field :customer_invoice_url, -> { String }, optional: true, nullable: false
          field :items, -> { Candid::Invoices::V2::Types::InvoiceItemInfo }, optional: false, nullable: false

        end
      end
    end
  end
end
