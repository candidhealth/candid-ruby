# frozen_string_literal: true

module Candid
  module EncounterProviders
    module V2
      module Types
        # Update type for the treating provider. All fields are optional.
        class TreatingProviderUpdate < Internal::Types::Model
          field :first_name, -> { String }, optional: true, nullable: false
          field :last_name, -> { String }, optional: true, nullable: false
          field :npi, -> { String }, optional: true, nullable: false
          field :taxonomy_code, -> { String }, optional: true, nullable: false
          field :address, -> { Candid::Commons::Types::StreetAddressLongZip }, optional: true, nullable: false
          field :license_type, -> { Candid::OrganizationProviders::V2::Types::LicenseType }, optional: true, nullable: false
        end
      end
    end
  end
end
