# frozen_string_literal: true

module Candid
  module Commons
    module Types
      class StreetAddressBase < Internal::Types::Model
        field :address_1, -> { String }, optional: false, nullable: false, api_name: "address1"
        field :address_2, -> { String }, optional: true, nullable: false, api_name: "address2"
        field :city, -> { String }, optional: false, nullable: false
        field :state, -> { Candid::Commons::Types::State }, optional: false, nullable: false
        field :zip_code, -> { String }, optional: false, nullable: false
      end
    end
  end
end
