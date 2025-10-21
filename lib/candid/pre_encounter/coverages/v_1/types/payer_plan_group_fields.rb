# frozen_string_literal: true

module Candid
  module PreEncounter
    module Coverages
      module V1
        module Types
          class PayerPlanGroupFields < Internal::Types::Model
            field :payer_plan_group_id, -> { String }, optional: false, nullable: false
            field :payer_id, -> { String }, optional: false, nullable: false
            field :payer_name, -> { String }, optional: false, nullable: false
            field :plan_type, -> { Candid::PreEncounter::Coverages::V1::Types::NetworkType }, optional: false, nullable: false

          end
        end
      end
    end
  end
end
