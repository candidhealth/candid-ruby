# frozen_string_literal: true

module Candid
  module PreEncounter
    module Coverages
      module V1
        module Types
          class CoverageBenefits < Internal::Types::Model
            field :plan_coverage, -> { Candid::PreEncounter::Coverages::V1::Types::PlanCoverage }, optional: true, nullable: false
            field :service_specific_coverage, -> { Internal::Types::Array[Candid::PreEncounter::Coverages::V1::Types::ServiceCoverage] }, optional: true, nullable: false
            field :benefits_related_entities, -> { Internal::Types::Array[Candid::PreEncounter::Coverages::V1::Types::BenefitsRelatedEntity] }, optional: true, nullable: false
            field :non_covered_details, -> { Internal::Types::Array[Candid::PreEncounter::Coverages::V1::Types::NonCoveredDetail] }, optional: true, nullable: false
            field :notes, -> { String }, optional: true, nullable: false
            field :auto_updated_eligibility_check_id, -> { String }, optional: true, nullable: false, api_name: "autoUpdatedEligibilityCheckId"
          end
        end
      end
    end
  end
end
