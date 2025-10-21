# frozen_string_literal: true

module Candid
  module OrganizationProviders
    module V2
      module Types
        class OrganizationProviderBase < Internal::Types::Model
          field :npi, -> { String }, optional: false, nullable: false
          field :is_rendering, -> { Internal::Types::Boolean }, optional: false, nullable: false
          field :is_billing, -> { Internal::Types::Boolean }, optional: false, nullable: false
          field :first_name, -> { String }, optional: true, nullable: false
          field :last_name, -> { String }, optional: true, nullable: false
          field :organization_name, -> { String }, optional: true, nullable: false
          field :provider_type, -> { Candid::OrganizationProviders::V2::Types::ProviderType }, optional: false, nullable: false
          field :tax_id, -> { String }, optional: true, nullable: false
          field :taxonomy_code, -> { String }, optional: true, nullable: false
          field :license_type, -> { Candid::OrganizationProviders::V2::Types::LicenseType }, optional: false, nullable: false
          field :ptan, -> { String }, optional: true, nullable: false
          field :medicaid_provider_id, -> { String }, optional: true, nullable: false
          field :addresses, -> { Internal::Types::Array[Candid::OrganizationProviders::V2::Types::OrganizationProviderAddress] }, optional: true, nullable: false

        end
      end
    end
  end
end
