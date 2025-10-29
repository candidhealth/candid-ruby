# frozen_string_literal: true

module Candid
  module PreEncounter
    module Coverages
      module V1
        module Types
          class CoverageBenefits < Internal::Types::Model
            field :plan_coverage, lambda {
              Candid::PreEncounter::Coverages::V1::Types::PlanCoverage
            }, optional: true, nullable: false
            field :service_specific_coverage, lambda {
              Internal::Types::Array[Candid::PreEncounter::Coverages::V1::Types::ServiceCoverage]
            }, optional: true, nullable: false
            field :benefits_related_entities, lambda {
              Internal::Types::Array[Candid::PreEncounter::Coverages::V1::Types::BenefitsRelatedEntity]
            }, optional: true, nullable: false
            field :notes, -> { String }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
