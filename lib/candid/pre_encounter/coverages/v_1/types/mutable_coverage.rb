# frozen_string_literal: true

module Candid
  module PreEncounter
    module Coverages
      module V1
        module Types
          class MutableCoverage < Internal::Types::Model
            field :status, -> { Candid::PreEncounter::Coverages::V1::Types::CoverageStatus }, optional: false, nullable: false
            field :subscriber, -> { Candid::PreEncounter::Coverages::V1::Types::Subscriber }, optional: false, nullable: false
            field :relationship, -> { Candid::PreEncounter::Common::Types::Relationship }, optional: false, nullable: false
            field :patient, -> { String }, optional: false, nullable: false
            field :insurance_plan, -> { Candid::PreEncounter::Coverages::V1::Types::InsurancePlan }, optional: false, nullable: false
            field :verified, -> { Internal::Types::Boolean }, optional: false, nullable: false
            field :eligibility_checks, -> { Internal::Types::Array[Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckMetadata] }, optional: true, nullable: false
            field :latest_eligibility_check, -> { Candid::PreEncounter::Coverages::V1::Types::LatestEligibilityCheck }, optional: true, nullable: false
            field :benefits, -> { Candid::PreEncounter::Coverages::V1::Types::CoverageBenefits }, optional: true, nullable: false
            field :orcon, -> { Internal::Types::Boolean }, optional: true, nullable: false

          end
        end
      end
    end
  end
end
