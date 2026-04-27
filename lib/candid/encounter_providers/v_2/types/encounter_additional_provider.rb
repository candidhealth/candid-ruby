# frozen_string_literal: true

module Candid
  module EncounterProviders
    module V2
      module Types
        # A lighter-weight provider type with optional NPI. Used for treating providers and other additional provider
        # roles that may not have full NPI credentials.
        class EncounterAdditionalProvider < Internal::Types::Model
          field :provider_id, -> { String }, optional: false, nullable: false
          field :first_name, -> { String }, optional: false, nullable: false
          field :last_name, -> { String }, optional: false, nullable: false
          field :npi, -> { String }, optional: true, nullable: false
          field :taxonomy_code, -> { String }, optional: true, nullable: false
          field :address, -> { Candid::Commons::Types::StreetAddressLongZip }, optional: true, nullable: false
          field :tax_id, -> { String }, optional: true, nullable: false
          field :license_type, -> { Candid::OrganizationProviders::V2::Types::LicenseType }, optional: true, nullable: false
        end
      end
    end
  end
end
