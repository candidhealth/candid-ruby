# frozen_string_literal: true

module Candid
  module Invoices
    module V2
      module Types
        class ClaimInvoiceItemInfo < Internal::Types::Model
          field :claim_invoice_item, -> { Candid::Invoices::V2::Types::ClaimInvoiceItem }, optional: true, nullable: false
          field :service_line_invoice_items, -> { Internal::Types::Hash[String, Candid::Invoices::V2::Types::ServiceLineInvoiceItem] }, optional: false, nullable: false

        end
      end
    end
  end
end
