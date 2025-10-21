# frozen_string_literal: true

module Candid
  module Invoices
    module V2
      module Types
        class UnattributedInvoiceItem < Internal::Types::Model
          field :amount_cents, -> { Integer }, optional: false, nullable: false

        end
      end
    end
  end
end
