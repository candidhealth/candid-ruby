# frozen_string_literal: true

module CandidApiClient
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          # enum to represent the source of an error in an eligibility check
          class EligibilityCheckErrorSource
            CANDID = "CANDID"
            STEDI = "STEDI"
          end
        end
      end
    end
  end
end
