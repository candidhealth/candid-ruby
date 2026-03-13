# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          # An eligibility recommendation object that contains an EligibilityRecommendationType and a payload of data
          # denoting the recommendation.
          class EligibilityRecommendation < Internal::Types::Model
            field :id, -> { String }, optional: false, nullable: false
            field :eligibility_check_id, -> { String }, optional: false, nullable: false
            field :recommendation, -> { Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityRecommendationPayload }, optional: false, nullable: false
            field :coverage_id, -> { String }, optional: true, nullable: false
            field :patient, -> { Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityRecommendationPatientInfo }, optional: false, nullable: false
            field :votes, -> { Internal::Types::Array[Candid::PreEncounter::EligibilityChecks::V1::Types::Vote] }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
