# frozen_string_literal: true

module Candid
  module FeeSchedules
    module V3
      module Types
        # A dimensions object where all properties are optional.
        class OptionalDimensions < Internal::Types::Model
          field :payer_uuid, -> { String }, optional: true, nullable: false
          field :organization_billing_provider_id, -> { String }, optional: true, nullable: false
          field :states, -> { Internal::Types::Array[Candid::Commons::Types::State] }, optional: false, nullable: false
          field :zip_codes, -> { Internal::Types::Array[String] }, optional: false, nullable: false
          field :license_types, lambda {
            Internal::Types::Array[Candid::OrganizationProviders::V2::Types::LicenseType]
          }, optional: false, nullable: false
          field :facility_type_codes, lambda {
            Internal::Types::Array[Candid::Commons::Types::FacilityTypeCode]
          }, optional: false, nullable: false
          field :network_types, lambda {
            Internal::Types::Array[Candid::Commons::Types::NetworkType]
          }, optional: false, nullable: false
          field :payer_plan_group_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false
          field :cpt_code, -> { String }, optional: true, nullable: false
          field :modifiers, lambda {
            Internal::Types::Array[Candid::Commons::Types::ProcedureModifier]
          }, optional: false, nullable: false
        end
      end
    end
  end
end
