# frozen_string_literal: true

module Candid
  module OrganizationProviders
    module V3
      module Types
        class OrganizationProviderUpdateV2 < Internal::Types::Model
          field :npi, -> { String }, optional: true, nullable: false
          field :is_rendering, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :is_billing, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :first_name, -> { String }, optional: true, nullable: false
          field :last_name, -> { String }, optional: true, nullable: false
          field :organization_name, -> { String }, optional: true, nullable: false
          field :provider_type, lambda {
            Candid::OrganizationProviders::V2::Types::ProviderType
          }, optional: true, nullable: false
          field :tax_id, -> { String }, optional: true, nullable: false
          field :taxonomy_code, -> { String }, optional: true, nullable: false
          field :license_type, lambda {
            Candid::OrganizationProviders::V2::Types::LicenseType
          }, optional: true, nullable: false
          field :addresses, lambda {
            Internal::Types::Array[Candid::OrganizationProviders::V2::Types::OrganizationProviderAddress]
          }, optional: true, nullable: false
          field :employment_start_date, -> { String }, optional: true, nullable: false
          field :employment_termination_date, -> { String }, optional: true, nullable: false
          field :qualifications, lambda {
            Internal::Types::Array[Candid::Identifiers::Types::UpdatableIdentifier]
          }, optional: true, nullable: false
        end
      end
    end
  end
end
