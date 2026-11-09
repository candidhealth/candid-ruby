# frozen_string_literal: true

module Candid
  module PayerGroups
    module V1
      module Types
        class PayerGroup < Internal::Types::Model
          field :payer_group_id, -> { String }, optional: false, nullable: false
          field :payer_plan_group_count, -> { Integer }, optional: false, nullable: false
        end
      end
    end
  end
end
