# frozen_string_literal: true

module Candid
  module InsuranceAdjudications
    module V1
      module Types
        class ClaimAdjudicationCreate < Internal::Types::Model
          field :claim_status_code, lambda {
            Candid::EraCommons::Types::ClaimStatusCodeCreate
          }, optional: false, nullable: false
          field :insurance_paid_amount_cents, -> { Integer }, optional: true, nullable: false
          field :charge_amount_cents, -> { Integer }, optional: true, nullable: false
          field :service_lines, lambda {
            Internal::Types::Hash[String, Internal::Types::Array[Candid::InsuranceAdjudications::V1::Types::ServiceLineAdjudicationCreate]]
          }, optional: false, nullable: false
          field :payer_claim_number, -> { String }, optional: true, nullable: false
          field :carcs, lambda {
            Internal::Types::Array[Candid::X12::V1::Types::ClaimAdjustmentReasonCode]
          }, optional: false, nullable: false
        end
      end
    end
  end
end
