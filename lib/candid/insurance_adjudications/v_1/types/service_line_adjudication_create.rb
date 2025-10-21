# frozen_string_literal: true

module Candid
  module InsuranceAdjudications
    module V1
      module Types
        class ServiceLineAdjudicationCreate < Internal::Types::Model
          field :denial_reason, -> { Candid::ServiceLines::V2::Types::DenialReasonContent }, optional: true, nullable: false
          field :insurance_allowed_amount_cents, -> { Integer }, optional: true, nullable: false
          field :insurance_paid_amount_cents, -> { Integer }, optional: true, nullable: false
          field :deductible_amount_cents, -> { Integer }, optional: true, nullable: false
          field :coinsurance_amount_cents, -> { Integer }, optional: true, nullable: false
          field :copay_amount_cents, -> { Integer }, optional: true, nullable: false
          field :carcs, -> { Internal::Types::Array[Candid::X12::V1::Types::ClaimAdjustmentReasonCode] }, optional: false, nullable: false
          field :rarcs, -> { Internal::Types::Array[Candid::X12::V1::Types::RemittanceAdviceRemarkCode] }, optional: false, nullable: false

        end
      end
    end
  end
end
