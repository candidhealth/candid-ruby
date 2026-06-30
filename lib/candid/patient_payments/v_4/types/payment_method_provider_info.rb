# frozen_string_literal: true

module Candid
  module PatientPayments
    module V4
      module Types
        class PaymentMethodProviderInfo < Internal::Types::Model
          field :npi, -> { String }, optional: true, nullable: false
          field :first_name, -> { String }, optional: true, nullable: false
          field :last_name, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
