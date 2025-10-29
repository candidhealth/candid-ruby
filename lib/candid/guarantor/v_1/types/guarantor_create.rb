# frozen_string_literal: true

module Candid
  module Guarantor
    module V1
      module Types
        class GuarantorCreate < Internal::Types::Model
          field :phone_numbers, lambda {
            Internal::Types::Array[Candid::Commons::Types::PhoneNumber]
          }, optional: true, nullable: false
          field :phone_consent, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :email, -> { String }, optional: true, nullable: false
          field :email_consent, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :auto_charge_consent, -> { Internal::Types::Boolean }, optional: true, nullable: false
        end
      end
    end
  end
end
