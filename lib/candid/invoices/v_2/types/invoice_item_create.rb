# frozen_string_literal: true

module Candid
  module Invoices
    module V2
      module Types
        class InvoiceItemCreate < Internal::Types::Model
          field :attribution, -> { Candid::Invoices::V2::Types::InvoiceItemAttributionCreate }, optional: false, nullable: false
          field :amount_cents, -> { Integer }, optional: false, nullable: false

        end
      end
    end
  end
end
