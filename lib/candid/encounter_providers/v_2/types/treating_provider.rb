# frozen_string_literal: true

module Candid
  module EncounterProviders
    module V2
      module Types
        # The treating provider for professional encounters. Unlike other provider types, the treating provider has an
        # optional NPI and no organization_name field.
        class TreatingProvider < Internal::Types::Model
          field :first_name, -> { String }, optional: false, nullable: false
          field :last_name, -> { String }, optional: false, nullable: false
          field :npi, -> { String }, optional: true, nullable: false
          field :taxonomy_code, -> { String }, optional: true, nullable: false
          field :address, -> { Candid::Commons::Types::StreetAddressLongZip }, optional: true, nullable: false
          field :license_type, -> { Candid::OrganizationProviders::V2::Types::LicenseType }, optional: true, nullable: false
        end
      end
    end
  end
end
