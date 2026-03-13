# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          # Payload for user-configured prompt recommendations from AI analysis
          class UserConfiguredPromptsRecommendationPayload < Internal::Types::Model
            field :results, -> { Internal::Types::Array[Candid::PreEncounter::EligibilityChecks::V1::Types::UserConfiguredPromptsResult] }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
