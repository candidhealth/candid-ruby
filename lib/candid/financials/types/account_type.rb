# frozen_string_literal: true

module Candid
  module Financials
    module Types
      module AccountType
        extend Candid::Internal::Types::Enum

        PATIENT = "PATIENT"
        INSURANCE = "INSURANCE"
        THIRD_PARTY_PAYER = "THIRD_PARTY_PAYER"
      end
    end
  end
end
