# frozen_string_literal: true

module Candid
  module PatientPayments
    module V4
      module Types
        class CheckPaymentMethod < Internal::Types::Model
          field :check_number, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
