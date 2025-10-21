# frozen_string_literal: true

module Candid
  module InsurancePayments
    module V1
      module Types
        class InsurancePaymentsPage < Internal::Types::Model
          field :items, -> { Internal::Types::Array[Candid::InsurancePayments::V1::Types::InsurancePayment] }, optional: false, nullable: false

        end
      end
    end
  end
end
