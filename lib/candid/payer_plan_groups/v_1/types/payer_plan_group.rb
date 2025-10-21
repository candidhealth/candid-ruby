# frozen_string_literal: true

module Candid
  module PayerPlanGroups
    module V1
      module Types
        class PayerPlanGroup < Internal::Types::Model
          field :payer_plan_group_id, -> { String }, optional: false, nullable: false
          field :payer, -> { Candid::Payers::V3::Types::Payer }, optional: false, nullable: false
          field :is_active, -> { Internal::Types::Boolean }, optional: false, nullable: false

        end
      end
    end
  end
end
