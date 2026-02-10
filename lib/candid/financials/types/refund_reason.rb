# frozen_string_literal: true

module Candid
  module Financials
    module Types
      module RefundReason
        extend Candid::Internal::Types::Enum

        OVERCHARGED = "OVERCHARGED"
        ENTERED_IN_ERROR = "ENTERED_IN_ERROR"
      end
    end
  end
end
