# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          class AsyncInsuranceDiscoveryCheckResult < Internal::Types::Model
            field :metadata, -> { Candid::PreEncounter::EligibilityChecks::V1::Types::InsuranceDiscoveryCheckMetadata }, optional: false, nullable: false
            field :response, -> { Candid::PreEncounter::EligibilityChecks::V1::Types::InsuranceDiscoveryResponse }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
