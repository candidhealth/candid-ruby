# frozen_string_literal: true

module CandidApiClient
  module Invoices
    module Types
      class InvoiceStatus
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
