# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          class EncounterEligibilityResponse < Internal::Types::Model
            field :items, -> { Internal::Types::Array[Candid::PreEncounter::EligibilityChecks::V1::Types::EncounterEligibility] }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
