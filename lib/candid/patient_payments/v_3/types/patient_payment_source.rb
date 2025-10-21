# frozen_string_literal: true

module Candid
  module PatientPayments
    module V3
      module Types
        module PatientPaymentSource
          extend Candid::Internal::Types::Enum
          MANUAL_ENTRY = "MANUAL_ENTRY"
          CHARGEBEE_PAYMENTS = "CHARGEBEE_PAYMENTS"
          CHARGEBEE_MANUALLY_VOIDED_BY_CANDID = "CHARGEBEE MANUALLY VOIDED BY CANDID"
          CHARGEBEE_REFUNDS = "CHARGEBEE_REFUNDS"
          SQUARE_REFUNDS = "SQUARE_REFUNDS"
          SQUARE_PAYMENTS = "SQUARE_PAYMENTS"
          STRIPE_CHARGES = "STRIPE_CHARGES"
          STRIPE_REFUNDS = "STRIPE_REFUNDS"
          ELATION_PAYMENTS = "ELATION_PAYMENTS"end
      end
    end
  end
end
