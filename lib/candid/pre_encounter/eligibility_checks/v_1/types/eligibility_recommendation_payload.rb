# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          class EligibilityRecommendationPayload < Internal::Types::Model
            extend Candid::Internal::Types::Union

            discriminant :type

            member -> { Candid::PreEncounter::EligibilityChecks::V1::Types::MedicareAdvantageRecommendation }, key: "MEDICARE_ADVANTAGE"
            member -> { Candid::PreEncounter::EligibilityChecks::V1::Types::CoordinationOfBenefitsRecommendation }, key: "COORDINATION_OF_BENEFITS"
            member -> { Candid::PreEncounter::EligibilityChecks::V1::Types::CopayEstimationRecommendation }, key: "COPAY_ESTIMATION"
            member -> { Candid::PreEncounter::EligibilityChecks::V1::Types::UserConfiguredPromptsRecommendation }, key: "USER_CONFIGURED_PROMPTS"
          end
        end
      end
    end
  end
end
