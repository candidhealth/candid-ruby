# frozen_string_literal: true

module Candid
  module OrganizationProviders
    module V3
      module Types
        class OrganizationProviderV2 < Internal::Types::Model
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
          field :addresses, -> { Internal::Types::Array[Candid::OrganizationProviders::V2::Types::OrganizationProviderAddress] }, optional: true, nullable: false
          field :employment_start_date, -> { String }, optional: true, nullable: false
          field :employment_termination_date, -> { String }, optional: true, nullable: false
          field :organization_provider_id, -> { String }, optional: false, nullable: false
          field :qualifications, -> { Internal::Types::Array[Candid::Identifiers::Types::Identifier] }, optional: false, nullable: false

        end
      end
    end
  end
end
