# frozen_string_literal: true

module CandidApiClient
  module Invoices
    module V2
      module Types
        class InvoiceDestination
          STRIPE = "STRIPE"
          CEDAR = "CEDAR"
          HEALTHIE = "HEALTHIE"
          COLLECTLY = "COLLECTLY"
          THIRD_PARTY_PAYERS = "THIRD_PARTY_PAYERS"
        end
      end
    end
  end
end
