# frozen_string_literal: true

module Candid
  module Commons
    module Types
      class PhoneNumber < Internal::Types::Model
        field :number, -> { String }, optional: false, nullable: false
        field :type, -> { Candid::Commons::Types::PhoneNumberType }, optional: false, nullable: false

      end
    end
  end
end
