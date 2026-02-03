# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          # Payload for MD visit copay estimation from AI analysis
          class CopayEstimationRecommendationPayload < Internal::Types::Model
            field :structured_response, -> { Integer }, optional: true, nullable: false
            field :exposition, -> { String }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
