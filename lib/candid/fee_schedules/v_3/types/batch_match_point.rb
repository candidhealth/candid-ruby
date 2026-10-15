# frozen_string_literal: true

module Candid
  module FeeSchedules
    module V3
      module Types
        # The dimension values to match a rate against, equivalent to a service line. An omitted optional dimension only
        # matches rates that have no restriction on that dimension.
        class BatchMatchPoint < Internal::Types::Model
          field :payer_uuid, -> { String }, optional: false, nullable: false
          field :organization_billing_provider_id, -> { String }, optional: false, nullable: false
          field :cpt_code, -> { String }, optional: false, nullable: false
          field :date_of_service, -> { String }, optional: false, nullable: false
          field :modifiers, -> { Internal::Types::Array[Candid::Commons::Types::ProcedureModifier] }, optional: true, nullable: false
          field :facility_type_code, -> { Candid::Commons::Types::FacilityTypeCode }, optional: true, nullable: false
          field :state, -> { Candid::Commons::Types::State }, optional: true, nullable: false
          field :zip_code, -> { String }, optional: true, nullable: false
          field :license_type, -> { Candid::OrganizationProviders::V2::Types::LicenseType }, optional: true, nullable: false
          field :network_types, -> { Internal::Types::Array[Candid::Commons::Types::NetworkType] }, optional: true, nullable: false
          field :payer_plan_group_id, -> { String }, optional: true, nullable: false
          field :quantity, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
