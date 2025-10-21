# frozen_string_literal: true

module Candid
  module Invoices
    module V2
      module Types
        class InvoiceInfo < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :invoice, -> { Candid::Invoices::V2::Types::Invoice }, optional: false, nullable: false
          field :invoice_type, -> { Candid::Invoices::V2::Types::InvoiceDestination }, optional: false, nullable: false

        end
      end
    end
  end
end
