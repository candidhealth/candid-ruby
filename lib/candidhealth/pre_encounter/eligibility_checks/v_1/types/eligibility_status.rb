# frozen_string_literal: true

module CandidApiClient
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          # enum to represent the status of a patient's coverage
          class EligibilityStatus
            ACTIVE = "ACTIVE"
            INACTIVE = "INACTIVE"
            UNKNOWN = "UNKNOWN"
          end
        end
      end
    end
  end
end
