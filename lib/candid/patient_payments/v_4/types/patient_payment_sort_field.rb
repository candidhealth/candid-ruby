# frozen_string_literal: true

module Candid
  module PatientPayments
    module V4
      module Types
        module PatientPaymentSortField
          extend Candid::Internal::Types::Enum
          PAYMENT_SOURCE = "payment_source"
          AMOUNT_CENTS = "amount_cents"
          PAYMENT_TIMESTAMP = "payment_timestamp"
          PAYMENT_NOTE = "payment_note"end
      end
    end
  end
end
