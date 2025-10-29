# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          class EligibilityRecommendationPayload < Internal::Types::Model
            extend Candid::Internal::Types::Union

            discriminant :type

            member lambda {
              Candid::PreEncounter::EligibilityChecks::V1::Types::MedicareAdvantageRecommendation
            }, key: "MEDICARE_ADVANTAGE"
            member lambda {
              Candid::PreEncounter::EligibilityChecks::V1::Types::CoordinationOfBenefitsRecommendation
            }, key: "COORDINATION_OF_BENEFITS"
          end
        end
      end
    end
  end
end
