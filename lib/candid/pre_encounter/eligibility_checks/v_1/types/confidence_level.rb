# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          module ConfidenceLevel
            extend Candid::Internal::Types::Enum

            REVIEW_NEEDED = "REVIEW_NEEDED"
            HIGH = "HIGH"
          end
        end
      end
    end
  end
end
