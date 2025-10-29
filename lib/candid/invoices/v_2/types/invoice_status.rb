# frozen_string_literal: true

module Candid
  module Invoices
    module V2
      module Types
        module InvoiceStatus
          extend Candid::Internal::Types::Enum

          DRAFT = "DRAFT"
          OPEN = "OPEN"
          PAID = "PAID"
          VOID = "VOID"
          UNCOLLECTIBLE = "UNCOLLECTIBLE"
          HELD = "HELD"
        end
      end
    end
  end
end
