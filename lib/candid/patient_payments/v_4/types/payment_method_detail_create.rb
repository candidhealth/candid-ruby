# frozen_string_literal: true

module Candid
  module PatientPayments
    module V4
      module Types
        class PaymentMethodDetailCreate < Internal::Types::Model
          field :payment_method, -> { Candid::PatientPayments::V4::Types::PaymentMethodCreate }, optional: false, nullable: false
          field :collected_at_address, -> { Candid::Commons::Types::StreetAddressShortZip }, optional: true, nullable: false
        end
      end
    end
  end
end
