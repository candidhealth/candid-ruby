# frozen_string_literal: true

module CandidApiClient
  module Financials
    module Types
      class PatientTransactionSource
        MANUAL_ENTRY = "MANUAL_ENTRY"
        CHARGEBEE = "CHARGEBEE"
        SQUARE = "SQUARE"
        STRIPE = "STRIPE"
        ELATION = "ELATION"
        CEDAR = "CEDAR"
        HEALTHIE = "HEALTHIE"
        REALLOCATION = "REALLOCATION"
      end
    end
  end
end
