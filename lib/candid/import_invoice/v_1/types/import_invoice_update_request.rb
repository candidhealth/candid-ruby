# frozen_string_literal: true

module Candid
  module ImportInvoice
    module V1
      module Types
        class ImportInvoiceUpdateRequest < Internal::Types::Model
          field :customer_invoice_url, -> { String }, optional: true, nullable: false
          field :status, -> { Candid::Invoices::V2::Types::InvoiceStatus }, optional: true, nullable: false
          field :note, -> { String }, optional: true, nullable: false
          field :due_date, -> { String }, optional: true, nullable: false
          field :items, -> { Candid::ImportInvoice::V1::Types::InvoiceItemInfoUpdate }, optional: true, nullable: false
        end
      end
    end
  end
end
