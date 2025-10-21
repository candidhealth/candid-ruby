# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          # An object representing a Coordination Of Benefits recommendation.
          class CoordinationOfBenefitsRecommendation < Internal::Types::Model
            field :payload, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false

          end
        end
      end
    end
  end
end
