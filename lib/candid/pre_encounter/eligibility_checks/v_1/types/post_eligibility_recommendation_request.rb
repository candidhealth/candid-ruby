# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          class PostEligibilityRecommendationRequest < Internal::Types::Model
            field :eligibility_check_id, -> { String }, optional: false, nullable: false
            field :patient, lambda {
              Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityRecommendationPatientInfo
            }, optional: false, nullable: false
            field :recommendation, lambda {
              Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityRecommendationPayload
            }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
