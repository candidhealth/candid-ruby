# frozen_string_literal: true

module Candid
  module ExternalConsolidatedRemit
    module V1
      module Types
        # Unlike InsurancePayment, posted_by/voided_by can genuinely be real user ids for this
        # transaction type.
        class ExternalConsolidatedRemitInsuranceAdjustmentTransaction < Internal::Types::Model
          field :adjustment_source, -> { Candid::ExternalConsolidatedRemit::V1::Types::InsuranceAdjustmentSource }, optional: false, nullable: false
          field :adjustment_reason, -> { Candid::ExternalConsolidatedRemit::V1::Types::InsuranceAdjustmentReason }, optional: false, nullable: false
          field :carc, -> { String }, optional: true, nullable: false
          field :adjustment_details, -> { Internal::Types::Array[Candid::Eras::Types::EraAdjustment] }, optional: false, nullable: false
          field :reverses_adjustment_id, -> { String }, optional: true, nullable: false
          field :reverted_by_adjustment_id, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
