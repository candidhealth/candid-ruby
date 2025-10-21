# frozen_string_literal: true

module Candid
  module Guarantor
    module V1
      module Types
        class Guarantor < Internal::Types::Model
          field :guarantor_id, -> { String }, optional: false, nullable: false
          field :phone_numbers, -> { Internal::Types::Array[Candid::Commons::Types::PhoneNumber] }, optional: false, nullable: false
          field :phone_consent, -> { Internal::Types::Boolean }, optional: false, nullable: false
          field :email, -> { String }, optional: true, nullable: false
          field :email_consent, -> { Internal::Types::Boolean }, optional: false, nullable: false
          field :auto_charge_consent, -> { Internal::Types::Boolean }, optional: false, nullable: false

        end
      end
    end
  end
end
