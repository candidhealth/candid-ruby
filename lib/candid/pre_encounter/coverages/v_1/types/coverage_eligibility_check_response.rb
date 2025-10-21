# frozen_string_literal: true

module Candid
  module PreEncounter
    module Coverages
      module V1
        module Types
          class CoverageEligibilityCheckResponse < Internal::Types::Model
            field :metadata, -> { Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckMetadata }, optional: false, nullable: false
            field :check, -> { Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheck }, optional: true, nullable: false

          end
        end
      end
    end
  end
end
