# frozen_string_literal: true

module Candid
  module InsurancePayments
    module V1
      module Types
        module InsurancePaymentSortField
          extend Candid::Internal::Types::Enum
          AMOUNT_CENTS = "amount_cents"
          PAYMENT_TIMESTAMP = "payment_timestamp"
          PAYMENT_NOTE = "payment_note"end
      end
    end
  end
end
