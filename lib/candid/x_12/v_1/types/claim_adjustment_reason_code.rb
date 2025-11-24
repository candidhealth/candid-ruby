# frozen_string_literal: true

module Candid
  module X12
    module V1
      module Types
        class ClaimAdjustmentReasonCode < Internal::Types::Model
          field :group_code, -> { Candid::Commons::Types::ClaimAdjustmentGroupCodes }, optional: false, nullable: false
          field :reason_code, -> { Candid::X12::V1::Types::Carc }, optional: false, nullable: false
          field :amount_cents, -> { Integer }, optional: false, nullable: false
        end
      end
    end
  end
end
