# frozen_string_literal: true

module CandidApiClient
  module PreEncounter
    module Coverages
      module V1
        module Types
          # enum to represent the statuses of eligibility checks
          class EligibilityCheckStatus
            CREATED = "CREATED"
            COMPLETED = "COMPLETED"
            FAILED = "FAILED"
            PENDING = "PENDING"
          end
        end
      end
    end
  end
end
