# frozen_string_literal: true

module Candid
  module EncounterProviders
    module V2
      module Types
        class EncounterProvider < Internal::Types::Model
          field :provider_id, -> { String }, optional: false, nullable: false
          field :address, -> { Candid::Commons::Types::StreetAddressLongZip }, optional: false, nullable: false
          field :tax_id, -> { String }, optional: true, nullable: false
          field :npi, -> { String }, optional: false, nullable: false
          field :taxonomy_code, -> { String }, optional: true, nullable: false
          field :qualifier, -> { Candid::Commons::Types::QualifierCode }, optional: true, nullable: false
          field :provider_commercial_license_type, -> { Candid::Commons::Types::BillingProviderCommercialLicenseType }, optional: true, nullable: false

        end
      end
    end
  end
end
