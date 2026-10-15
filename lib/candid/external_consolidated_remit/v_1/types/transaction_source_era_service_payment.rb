# frozen_string_literal: true

module Candid
  module ExternalConsolidatedRemit
    module V1
      module Types
        class TransactionSourceEraServicePayment < Internal::Types::Model
          field :era_service_payment, -> { Candid::Eras::Types::EraServicePayment }, optional: false, nullable: false
          field :service_line_id, -> { String }, optional: true, nullable: false
          field :era_claim_payment, -> { Candid::ExternalConsolidatedRemit::V1::Types::EraClaimPaymentSummary }, optional: false, nullable: false
        end
      end
    end
  end
end
