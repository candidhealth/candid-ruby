# frozen_string_literal: true

module Candid
  module Commons
    module Types
      class StreetAddressLongZip < Internal::Types::Model
        field :zip_plus_four_code, -> { String }, optional: false, nullable: false
      end
    end
  end
end
