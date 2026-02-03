# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          # An object representing a user-configured prompt recommendation from AI analysis
          class UserConfiguredPromptsRecommendation < Internal::Types::Model
            field :payload, lambda {
              Candid::PreEncounter::EligibilityChecks::V1::Types::UserConfiguredPromptsRecommendationPayload
            }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
