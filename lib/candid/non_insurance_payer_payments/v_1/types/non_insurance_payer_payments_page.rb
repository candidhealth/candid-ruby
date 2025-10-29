# frozen_string_literal: true

module Candid
  module NonInsurancePayerPayments
    module V1
      module Types
        class NonInsurancePayerPaymentsPage < Internal::Types::Model
          field :items, lambda {
            Internal::Types::Array[Candid::NonInsurancePayerPayments::V1::Types::NonInsurancePayerPayment]
          }, optional: false, nullable: false
        end
      end
    end
  end
end
