# frozen_string_literal: true

module Candid
  module FeeSchedules
    module V3
      module Types
        class PayerPlanGroupDoesNotMatchRatePayerError < Internal::Types::Model
          field :rate_payer_uuid, -> { String }, optional: false, nullable: false
          field :payer_plan_group_payer_uuid, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
