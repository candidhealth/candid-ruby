# frozen_string_literal: true

module Candid
  module PayerGroups
    module V1
      module Types
        class PayerGroupPage < Internal::Types::Model
          field :items, -> { Internal::Types::Array[Candid::PayerGroups::V1::Types::PayerGroup] }, optional: false, nullable: false
        end
      end
    end
  end
end
