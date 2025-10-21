# frozen_string_literal: true

module Candid
  module Invoices
    module V2
      module Types
        module InvoiceDestination
          extend Candid::Internal::Types::Enum
          STRIPE = "STRIPE"
          CEDAR = "CEDAR"
          HEALTHIE = "HEALTHIE"
          COLLECTLY = "COLLECTLY"
          THIRD_PARTY_PAYERS = "THIRD_PARTY_PAYERS"end
      end
    end
  end
end
