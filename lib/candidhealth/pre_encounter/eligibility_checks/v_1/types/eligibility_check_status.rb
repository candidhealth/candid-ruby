# frozen_string_literal: true

module CandidApiClient
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          # enum to represent the status of an eligibility checks
          class EligibilityCheckStatus
            COMPLETED = "COMPLETED"
            FAILED = "FAILED"
            PENDING = "PENDING"
          end
        end
      end
    end
  end
end
