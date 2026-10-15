# frozen_string_literal: true

module Candid
  module ExternalConsolidatedRemit
    module V1
      module Types
        # A single financial transaction posted from a consolidated remit's ERA payments - either an
        # InsurancePayment or an InsuranceAdjustment. Fields common to both (see
        # TransactionCommonFields) are always present alongside whichever type-specific fields apply,
        # so callers who only care about the common shape never need to branch on type.
        class ExternalConsolidatedRemitTransaction < Internal::Types::Model
          extend Candid::Internal::Types::Union

          discriminant :type

          member -> { Candid::ExternalConsolidatedRemit::V1::Types::ExternalConsolidatedRemitInsurancePaymentTransaction }, key: "INSURANCE_PAYMENT"
          member -> { Candid::ExternalConsolidatedRemit::V1::Types::ExternalConsolidatedRemitInsuranceAdjustmentTransaction }, key: "INSURANCE_ADJUSTMENT"
        end
      end
    end
  end
end
