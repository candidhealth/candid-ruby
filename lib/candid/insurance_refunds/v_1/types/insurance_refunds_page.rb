# frozen_string_literal: true

module Candid
  module InsuranceRefunds
    module V1
      module Types
        class InsuranceRefundsPage < Internal::Types::Model
          field :items, -> { Internal::Types::Array[Candid::InsuranceRefunds::V1::Types::InsuranceRefund] }, optional: false, nullable: false

        end
      end
    end
  end
end
