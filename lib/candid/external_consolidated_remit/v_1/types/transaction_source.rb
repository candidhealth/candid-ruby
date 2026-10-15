# frozen_string_literal: true

module Candid
  module ExternalConsolidatedRemit
    module V1
      module Types
        # Every transaction in scope here originates either directly from an ERA service payment (the
        # common case) or from a provider-level adjustment (PLB) payment bundle.
        class TransactionSource < Internal::Types::Model
          extend Candid::Internal::Types::Union

          discriminant :type

          member -> { Candid::ExternalConsolidatedRemit::V1::Types::TransactionSourceEraServicePayment }, key: "ERA_SERVICE_PAYMENT"
          member -> { Candid::ExternalConsolidatedRemit::V1::Types::TransactionSourcePaymentBundle }, key: "PAYMENT_BUNDLE"
        end
      end
    end
  end
end
