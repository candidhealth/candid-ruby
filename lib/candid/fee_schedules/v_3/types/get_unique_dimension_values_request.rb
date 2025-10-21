
module Candid
  module FeeSchedules
    module V3
      module Types
        class GetUniqueDimensionValuesRequest < Internal::Types::Model
          field :page_token, -> { String }, optional: true, nullable: false
          field :limit, -> { Integer }, optional: true, nullable: false
          field :pivot_dimension, -> { Candid::FeeSchedules::V3::Types::DimensionName }, optional: false, nullable: false
          field :payer_uuid, -> { String }, optional: true, nullable: false
          field :organization_billing_provider_id, -> { String }, optional: true, nullable: false
          field :states, -> { Candid::Commons::Types::State }, optional: true, nullable: false
          field :zip_codes, -> { String }, optional: true, nullable: false
          field :license_types, -> { Candid::OrganizationProviders::V2::Types::LicenseType }, optional: true, nullable: false
          field :facility_type_codes, -> { Candid::Commons::Types::FacilityTypeCode }, optional: true, nullable: false
          field :network_types, -> { Candid::Commons::Types::NetworkType }, optional: true, nullable: false
          field :payer_plan_group_ids, -> { String }, optional: true, nullable: false
          field :cpt_code, -> { String }, optional: true, nullable: false
          field :modifiers, -> { Candid::Commons::Types::ProcedureModifier }, optional: true, nullable: false

        end
      end
    end
  end
end
