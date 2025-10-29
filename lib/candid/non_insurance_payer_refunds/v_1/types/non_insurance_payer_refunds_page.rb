# frozen_string_literal: true

module Candid
  module NonInsurancePayerRefunds
    module V1
      module Types
        class NonInsurancePayerRefundsPage < Internal::Types::Model
          field :items, lambda {
            Internal::Types::Array[Candid::NonInsurancePayerRefunds::V1::Types::NonInsurancePayerRefund]
          }, optional: false, nullable: false
        end
      end
    end
  end
end
