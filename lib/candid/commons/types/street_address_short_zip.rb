# frozen_string_literal: true

module Candid
  module Commons
    module Types
      class StreetAddressShortZip < Internal::Types::Model
        field :zip_plus_four_code, -> { String }, optional: true, nullable: false
      end
    end
  end
end
