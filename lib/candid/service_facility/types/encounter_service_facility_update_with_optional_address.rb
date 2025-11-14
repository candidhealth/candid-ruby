# frozen_string_literal: true

module Candid
  module ServiceFacility
    module Types
      class EncounterServiceFacilityUpdateWithOptionalAddress < Internal::Types::Model
        field :organization_name, -> { String }, optional: true, nullable: false
        field :npi, -> { String }, optional: true, nullable: false
        field :address, -> { Candid::Commons::Types::StreetAddressShortZipOptional }, optional: true, nullable: false
        field :secondary_identification, -> { String }, optional: true, nullable: false
        field :mammography_certification_number, -> { String }, optional: true, nullable: false
      end
    end
  end
end
