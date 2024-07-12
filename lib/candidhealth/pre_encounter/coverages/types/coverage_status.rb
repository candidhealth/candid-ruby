# frozen_string_literal: true

module CandidApiClient
  module PreEncounter
    module Coverages
      module Types
        # enum to represent the statuses defined at
        #  https://build.fhir.org/valueset-fm-status.html
        class CoverageStatus
          ACTIVE = "ACTIVE"
          CANCELLED = "CANCELLED"
          DRAFT = "DRAFT"
          ENTERED_IN_ERROR = "ENTERED_IN_ERROR"
        end
      end
    end
  end
end
