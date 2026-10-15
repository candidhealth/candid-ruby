# frozen_string_literal: true

module Candid
  module ExternalConsolidatedRemit
    module V1
      module Types
        # EraClaimPayment fields, minus era_payment (redundant with the remit_id already on this
        # transaction) and service_payments (redundant with the single related service payment
        # already returned alongside this).
        class EraClaimPaymentSummary < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :patient_control_number, -> { String }, optional: false, nullable: false
          field :payer_claim_control_number, -> { String }, optional: false, nullable: false
          field :claim_status_code, -> { Candid::EraCommons::Types::ClaimStatusCodeCreate }, optional: false, nullable: false
          field :total_claim_charge_amount_cents, -> { Integer }, optional: false, nullable: false
          field :claim_payment_amount_cents, -> { Integer }, optional: false, nullable: false
          field :patient_responsibility_amount_cents, -> { Integer }, optional: false, nullable: false
          field :adjustments, -> { Internal::Types::Array[Candid::Eras::Types::EraAdjustment] }, optional: false, nullable: false
        end
      end
    end
  end
end
