# frozen_string_literal: true

module Candid
  module PayerGroups
    module V1
      module Types
        class CreatePayerGroupRequest < Internal::Types::Model
          field :payer_plan_group_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false
        end
      end
    end
  end
end
