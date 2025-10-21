# frozen_string_literal: true

module Candid
  module PatientPayments
    module V4
      module Types
        class PatientPaymentsPage < Internal::Types::Model
          field :items, -> { Internal::Types::Array[Candid::PatientPayments::V4::Types::PatientPayment] }, optional: false, nullable: false

        end
      end
    end
  end
end
