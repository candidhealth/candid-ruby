# frozen_string_literal: true

module Candid
  module PatientPayments
    module V3
      module Types
        module PatientPaymentStatus
          extend Candid::Internal::Types::Enum

          PENDING = "PENDING"
          PAID = "paid"
          CANCELED = "CANCELED"
          VOIDED = "voided"
          FAILED = "FAILED"
          COMPLETED = "COMPLETED"
          STRIPE_SUCCEEDED = "succeeded"
          STRIPE_PENDING = "pending"
          STRIPE_FAILED = "failed"
          STRIPE_REQUIRES_ACTION = "requires_action"
          STRIPE_CANCELED = "canceled"
        end
      end
    end
  end
end
