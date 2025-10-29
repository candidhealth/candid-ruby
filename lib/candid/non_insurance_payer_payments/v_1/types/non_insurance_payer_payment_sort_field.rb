# frozen_string_literal: true

module Candid
  module NonInsurancePayerPayments
    module V1
      module Types
        module NonInsurancePayerPaymentSortField
          extend Candid::Internal::Types::Enum

          AMOUNT_CENTS = "amount_cents"
          PAYMENT_TIMESTAMP = "payment_timestamp"
        end
      end
    end
  end
end
