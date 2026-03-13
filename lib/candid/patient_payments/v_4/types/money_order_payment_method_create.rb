# frozen_string_literal: true

module Candid
  module PatientPayments
    module V4
      module Types
        class MoneyOrderPaymentMethodCreate < Internal::Types::Model
          field :money_order_serial_number, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
