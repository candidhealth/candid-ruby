# frozen_string_literal: true

module Candid
  module ServiceFacility
    module Types
      class EncounterServiceFacility < Internal::Types::Model
        field :service_facility_id, -> { String }, optional: false, nullable: false
        field :organization_name, -> { String }, optional: false, nullable: false
        field :npi, -> { String }, optional: true, nullable: false
        field :address, -> { Candid::Commons::Types::StreetAddressLongZip }, optional: false, nullable: false
        field :secondary_identification, -> { String }, optional: true, nullable: false
      end
    end
  end
end
