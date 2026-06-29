# frozen_string_literal: true

module Candid
  module PatientPayments
    module V4
      module Types
        class CardPaymentMethod < Internal::Types::Model
          field :authorization_number, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
