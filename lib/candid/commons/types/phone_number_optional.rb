# frozen_string_literal: true

module Candid
  module Commons
    module Types
      class PhoneNumberOptional < Internal::Types::Model
        field :number, -> { String }, optional: true, nullable: false
        field :type, -> { Candid::Commons::Types::PhoneNumberType }, optional: true, nullable: false

      end
    end
  end
end
