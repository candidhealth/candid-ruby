# frozen_string_literal: true

module Candid
  module Financials
    module Types
      module PatientTransactionSource
        extend Candid::Internal::Types::Enum
        MANUAL_ENTRY = "MANUAL_ENTRY"
        CHARGEBEE = "CHARGEBEE"
        SQUARE = "SQUARE"
        STRIPE = "STRIPE"
        ELATION = "ELATION"
        CEDAR = "CEDAR"
        HEALTHIE = "HEALTHIE"
        REALLOCATION = "REALLOCATION"end
    end
  end
end
