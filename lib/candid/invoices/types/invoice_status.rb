# frozen_string_literal: true

module Candid
  module Invoices
    module Types
      module InvoiceStatus
        extend Candid::Internal::Types::Enum

        DRAFT = "draft"
        OPEN = "open"
        PAID = "paid"
        VOID = "void"
        UNCOLLECTIBLE = "uncollectible"
        HELD = "held"
      end
    end
  end
end
