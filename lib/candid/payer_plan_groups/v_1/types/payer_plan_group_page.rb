# frozen_string_literal: true

module Candid
  module PayerPlanGroups
    module V1
      module Types
        class PayerPlanGroupPage < Internal::Types::Model
          field :items, -> { Internal::Types::Array[Candid::PayerPlanGroups::V1::Types::PayerPlanGroup] }, optional: false, nullable: false

        end
      end
    end
  end
end
