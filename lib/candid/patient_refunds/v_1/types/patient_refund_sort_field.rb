# frozen_string_literal: true

module Candid
  module PatientRefunds
    module V1
      module Types
        module PatientRefundSortField
          extend Candid::Internal::Types::Enum
          REFUND_SOURCE = "refund_source"
          AMOUNT_CENTS = "amount_cents"
          REFUND_TIMESTAMP = "refund_timestamp"
          REFUND_REASON = "refund_reason"
          REFUND_NOTE = "refund_note"end
      end
    end
  end
end
