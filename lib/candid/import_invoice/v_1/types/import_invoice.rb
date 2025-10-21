# frozen_string_literal: true

module Candid
  module ImportInvoice
    module V1
      module Types
        class ImportInvoice < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :created_at, -> { String }, optional: false, nullable: false
          field :updated_at, -> { String }, optional: false, nullable: false
          field :items, -> { Candid::Invoices::V2::Types::InvoiceItemInfo }, optional: false, nullable: false
          field :patient_external_id, -> { String }, optional: false, nullable: false
          field :external_customer_identifier, -> { String }, optional: false, nullable: false
          field :status, -> { Candid::Invoices::V2::Types::InvoiceStatus }, optional: false, nullable: false
          field :external_identifier, -> { String }, optional: false, nullable: false
          field :note, -> { String }, optional: true, nullable: false
          field :customer_invoice_url, -> { String }, optional: true, nullable: false
          field :due_date, -> { String }, optional: false, nullable: false
          field :amount_cents, -> { Integer }, optional: false, nullable: false

        end
      end
    end
  end
end
