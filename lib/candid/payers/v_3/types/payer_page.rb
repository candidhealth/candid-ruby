# frozen_string_literal: true

module Candid
  module Payers
    module V3
      module Types
        class PayerPage < Internal::Types::Model
          field :items, -> { Internal::Types::Array[Candid::Payers::V3::Types::Payer] }, optional: false, nullable: false

        end
      end
    end
  end
end
