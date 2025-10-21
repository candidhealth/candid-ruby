# frozen_string_literal: true

module Candid
  module ImportInvoice
    module V1
      module Types
        class ImportInvoicesPage < Internal::Types::Model
          field :items, -> { Internal::Types::Array[Candid::ImportInvoice::V1::Types::ImportInvoice] }, optional: false, nullable: false

        end
      end
    end
  end
end
