# frozen_string_literal: true

module Candid
  module PatientAr
    module V1
      module Types
        class PatientPaymentInfo < Internal::Types::Model
          field :total_payment_cents, -> { Integer }, optional: false, nullable: false
          field :items, -> { Internal::Types::Array[Candid::PatientAr::V1::Types::PatientPaymentAllocation] }, optional: false, nullable: false

        end
      end
    end
  end
end
