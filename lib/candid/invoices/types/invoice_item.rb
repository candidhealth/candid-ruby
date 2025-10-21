# frozen_string_literal: true

module Candid
  module Invoices
    module Types
      class InvoiceItem < Internal::Types::Model
        field :service_line_id, -> { String }, optional: false, nullable: false
        field :amount_cents, -> { Integer }, optional: false, nullable: false

      end
    end
  end
end
