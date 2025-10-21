# frozen_string_literal: true

module Candid
  module FeeSchedules
    module V3
      module Types
        # Dimension matching for a service line
        class DimensionMatch < Internal::Types::Model
          field :payer, -> { Candid::FeeSchedules::V3::Types::MatchPayer }, optional: false, nullable: false
          field :geography, -> { Candid::FeeSchedules::V3::Types::MatchGeo }, optional: false, nullable: false
          field :organization_billing_provider, -> { Candid::FeeSchedules::V3::Types::MatchProvider }, optional: false, nullable: false
          field :date_of_service, -> { Candid::FeeSchedules::V3::Types::MatchDate }, optional: false, nullable: false
          field :cpt_code, -> { Candid::FeeSchedules::V3::Types::MatchCptCode }, optional: false, nullable: false
          field :modifiers, -> { Candid::FeeSchedules::V3::Types::MatchModifiers }, optional: false, nullable: false
          field :license_type, -> { Candid::FeeSchedules::V3::Types::MatchLicenseType }, optional: false, nullable: false
          field :facility_type_code, -> { Candid::FeeSchedules::V3::Types::MatchFacilityTypeCode }, optional: false, nullable: false
          field :network_types, -> { Candid::FeeSchedules::V3::Types::MatchNetworkTypes }, optional: false, nullable: false
          field :payer_plan_groups, -> { Candid::FeeSchedules::V3::Types::MatchPayerPlanGroups }, optional: false, nullable: false

        end
      end
    end
  end
end
