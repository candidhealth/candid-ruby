# frozen_string_literal: true

module Candid
  module PatientPayments
    module V4
      module Types
        class PaymentMethodCreate < Internal::Types::Model
          extend Candid::Internal::Types::Union

          discriminant :type

          member -> { Candid::PatientPayments::V4::Types::CashPaymentMethodCreate }, key: "CASH"
          member -> { Candid::PatientPayments::V4::Types::CheckPaymentMethodCreate }, key: "CHECK"
          member -> { Candid::PatientPayments::V4::Types::CardPaymentMethodCreate }, key: "CARD"
          member -> { Candid::PatientPayments::V4::Types::MoneyOrderPaymentMethodCreate }, key: "MONEY_ORDER"
        end
      end
    end
  end
end
