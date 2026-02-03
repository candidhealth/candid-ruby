# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          # An object representing a copay estimation recommendation from AI analysis
          class CopayEstimationRecommendation < Internal::Types::Model
            field :payload, lambda {
              Candid::PreEncounter::EligibilityChecks::V1::Types::CopayEstimationRecommendationPayload
            }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
