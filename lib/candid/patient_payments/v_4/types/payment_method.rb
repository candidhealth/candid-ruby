# frozen_string_literal: true

module Candid
  module PatientPayments
    module V4
      module Types
        class PaymentMethod < Internal::Types::Model
          extend Candid::Internal::Types::Union

          discriminant :type

          member -> { Candid::PatientPayments::V4::Types::CashPaymentMethod }, key: "CASH"
          member -> { Candid::PatientPayments::V4::Types::CheckPaymentMethod }, key: "CHECK"
          member -> { Candid::PatientPayments::V4::Types::CardPaymentMethod }, key: "CARD"
        end
      end
    end
  end
end
