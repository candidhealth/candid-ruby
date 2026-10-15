# frozen_string_literal: true

module Candid
  module Eras
    module Types
      class EraAdjustment < Internal::Types::Model
        field :adjustment_group_code, -> { Candid::Commons::Types::ClaimAdjustmentGroupCodes }, optional: false, nullable: false
        field :adjustment_reason_code, -> { Candid::X12::V1::Types::Carc }, optional: false, nullable: false
        field :adjustment_amount_cents, -> { Integer }, optional: true, nullable: false
        field :adjustment_quantity, -> { Integer }, optional: true, nullable: false
      end
    end
  end
end
