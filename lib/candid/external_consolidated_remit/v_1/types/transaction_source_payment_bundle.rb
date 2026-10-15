# frozen_string_literal: true

module Candid
  module ExternalConsolidatedRemit
    module V1
      module Types
        # Provider-level (PLB) money that isn't tied to a single claim. Bundles start out unallocated
        # to any claim, and once allocated are tied only to a service line - not to an individual claim
        # payment.
        class TransactionSourcePaymentBundle < Internal::Types::Model
          field :payment_bundle, -> { Candid::ExternalConsolidatedRemit::V1::Types::PaymentBundle }, optional: false, nullable: false
        end
      end
    end
  end
end
