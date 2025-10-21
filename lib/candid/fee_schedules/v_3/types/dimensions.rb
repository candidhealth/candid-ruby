# frozen_string_literal: true

module Candid
  module FeeSchedules
    module V3
      module Types
        # Dimension values that qualify a rate. For the optional dimensions, a null value signifies "all apply". For set-type dimensions, an empty set signifies "all apply". Only one of, but not both, of `network_types` and `payer_plan_group_id` may be populated.
        class Dimensions < Internal::Types::Model
          field :payer_uuid, -> { String }, optional: false, nullable: false
          field :organization_billing_provider_id, -> { String }, optional: false, nullable: false
          field :states, -> { Internal::Types::Array[Candid::Commons::Types::State] }, optional: false, nullable: false
          field :zip_codes, -> { Internal::Types::Array[String] }, optional: false, nullable: false
          field :license_types, -> { Internal::Types::Array[Candid::OrganizationProviders::V2::Types::LicenseType] }, optional: false, nullable: false
          field :facility_type_codes, -> { Internal::Types::Array[Candid::Commons::Types::FacilityTypeCode] }, optional: false, nullable: false
          field :network_types, -> { Internal::Types::Array[Candid::Commons::Types::NetworkType] }, optional: false, nullable: false
          field :payer_plan_group_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false
          field :cpt_code, -> { String }, optional: false, nullable: false
          field :modifiers, -> { Internal::Types::Array[Candid::Commons::Types::ProcedureModifier] }, optional: false, nullable: false

        end
      end
    end
  end
end
