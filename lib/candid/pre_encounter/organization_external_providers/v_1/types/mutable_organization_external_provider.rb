# frozen_string_literal: true

module Candid
  module PreEncounter
    module OrganizationExternalProviders
      module V1
        module Types
          # An object representing an organization-level external provider.
          class MutableOrganizationExternalProvider < Internal::Types::Model
            field :name, -> { Candid::PreEncounter::Common::Types::HumanName }, optional: false, nullable: false
            field :types, -> { Internal::Types::Array[Candid::PreEncounter::OrganizationExternalProviders::V1::Types::OrganizationExternalProviderType] }, optional: false, nullable: false
            field :npi, -> { String }, optional: true, nullable: false
            field :tax_id, -> { String }, optional: true, nullable: false
            field :taxonomy_code, -> { String }, optional: true, nullable: false
            field :phone_number, -> { String }, optional: true, nullable: false
            field :fax_number, -> { String }, optional: true, nullable: false
            field :license_type, -> { Candid::PreEncounter::OrganizationExternalProviders::V1::Types::LicenseType }, optional: true, nullable: false
            field :addresses, -> { Internal::Types::Array[Candid::PreEncounter::Common::Types::Address] }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
