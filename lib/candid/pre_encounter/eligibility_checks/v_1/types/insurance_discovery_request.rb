# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          # An object representing the data for an insurance discovery request.
          class InsuranceDiscoveryRequest < Internal::Types::Model
            field :provider, -> { Candid::PreEncounter::EligibilityChecks::V1::Types::InsuranceDiscoveryProvider }, optional: false, nullable: false
            field :subscriber, -> { Candid::PreEncounter::EligibilityChecks::V1::Types::InsuranceDiscoverySubscriber }, optional: false, nullable: false
            field :dependent, -> { Candid::PreEncounter::EligibilityChecks::V1::Types::InsuranceDiscoveryDependent }, optional: true, nullable: false
            field :encounter, -> { Candid::PreEncounter::EligibilityChecks::V1::Types::InsuranceDiscoveryEncounter }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
