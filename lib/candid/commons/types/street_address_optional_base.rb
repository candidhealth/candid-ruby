# frozen_string_literal: true

module Candid
  module Commons
    module Types
      class StreetAddressOptionalBase < Internal::Types::Model
        field :address_1, -> { String }, optional: true, nullable: false
        field :address_2, -> { String }, optional: true, nullable: false
        field :city, -> { String }, optional: true, nullable: false
        field :state, -> { Candid::Commons::Types::State }, optional: true, nullable: false
        field :zip_code, -> { String }, optional: true, nullable: false

      end
    end
  end
end
