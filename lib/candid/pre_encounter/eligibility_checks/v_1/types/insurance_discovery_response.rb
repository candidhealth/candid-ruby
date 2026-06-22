# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          # An object representing the data for an insurance discovery response.
          class InsuranceDiscoveryResponse < Internal::Types::Model
            field :discovery_id, -> { String }, optional: true, nullable: false
            field :status, -> { Candid::PreEncounter::EligibilityChecks::V1::Types::InsuranceDiscoveryStatus }, optional: true, nullable: false
            field :items, -> { Internal::Types::Array[Object] }, optional: true, nullable: false
            field :coverages_found, -> { Integer }, optional: true, nullable: false
            field :errors, -> { Internal::Types::Array[Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckErrorDetails] }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
