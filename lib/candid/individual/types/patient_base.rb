# frozen_string_literal: true

module Candid
  module Individual
    module Types
      class PatientBase < Internal::Types::Model
        field :external_id, -> { String }, optional: false, nullable: false
        field :date_of_birth, -> { String }, optional: false, nullable: false
        field :address, -> { Candid::Commons::Types::StreetAddressShortZip }, optional: false, nullable: false

      end
    end
  end
end
