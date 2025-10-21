# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          # An object representing a Medicare Advantage recommendation.
          class MedicareAdvantageRecommendation < Internal::Types::Model
            field :payload, -> { Candid::PreEncounter::EligibilityChecks::V1::Types::MedicareAdvantageRecommendationPayload }, optional: false, nullable: false

          end
        end
      end
    end
  end
end
