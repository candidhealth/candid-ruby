# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          class ParsedResponse < Internal::Types::Model
            field :eligibility_status, lambda {
              Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityStatus
            }, optional: false, nullable: false
            field :plan_metadata, lambda {
              Candid::PreEncounter::Coverages::V1::Types::PlanMetadata
            }, optional: true, nullable: false
            field :benefits, lambda {
              Candid::PreEncounter::Coverages::V1::Types::CoverageBenefits
            }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
