# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          class EligibilityRecommendationRequest < Internal::Types::Model
            field :filters, -> { String }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
