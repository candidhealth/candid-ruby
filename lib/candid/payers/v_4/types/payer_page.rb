# frozen_string_literal: true

module Candid
  module Payers
    module V4
      module Types
        class PayerPage < Internal::Types::Model
          field :items, lambda {
            Internal::Types::Array[Candid::Payers::V4::Types::Payer]
          }, optional: false, nullable: false
        end
      end
    end
  end
end
