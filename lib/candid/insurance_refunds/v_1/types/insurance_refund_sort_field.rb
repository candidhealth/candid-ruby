# frozen_string_literal: true

module Candid
  module InsuranceRefunds
    module V1
      module Types
        module InsuranceRefundSortField
          extend Candid::Internal::Types::Enum

          AMOUNT_CENTS = "amount_cents"
          REFUND_TIMESTAMP = "refund_timestamp"
          REFUND_NOTE = "refund_note"
          REFUND_REASON = "refund_reason"
        end
      end
    end
  end
end
