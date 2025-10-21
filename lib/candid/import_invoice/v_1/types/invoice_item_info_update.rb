# frozen_string_literal: true

module Candid
  module ImportInvoice
    module V1
      module Types
        class InvoiceItemInfoUpdate < Internal::Types::Model
          field :update_type, -> { Candid::ImportInvoice::V1::Types::InvoiceItemUpdateType }, optional: false, nullable: false
          field :items, -> { Internal::Types::Array[Candid::Invoices::V2::Types::InvoiceItemCreate] }, optional: false, nullable: false

        end
      end
    end
  end
end
