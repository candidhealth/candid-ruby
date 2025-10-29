# frozen_string_literal: true

module Candid
  module PreEncounter
    module Coverages
      module V1
        module Types
          # A type to represent the latest eligibility check status of a coverage.
          class LatestEligibilityCheck < Internal::Types::Model
            field :check_id, -> { String }, optional: false, nullable: false
            field :status, lambda {
              Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityStatus
            }, optional: false, nullable: false
            field :initiated_at, -> { String }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
