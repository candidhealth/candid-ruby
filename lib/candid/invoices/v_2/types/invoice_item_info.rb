# frozen_string_literal: true

module Candid
  module Invoices
    module V2
      module Types
        class InvoiceItemInfo < Internal::Types::Model
          field :claim_invoice_items, lambda {
            Internal::Types::Hash[String, Candid::Invoices::V2::Types::ClaimInvoiceItemInfo]
          }, optional: false, nullable: false
          field :unattributed_items, lambda {
            Internal::Types::Array[Candid::Invoices::V2::Types::UnattributedInvoiceItem]
          }, optional: false, nullable: false
        end
      end
    end
  end
end
