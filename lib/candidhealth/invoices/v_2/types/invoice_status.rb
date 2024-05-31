# frozen_string_literal: true

module CandidApiClient
  module Invoices
    module V2
      class InvoiceStatus
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
