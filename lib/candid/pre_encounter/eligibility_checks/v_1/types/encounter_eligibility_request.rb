# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          class EncounterEligibilityRequest < Internal::Types::Model
            field :encounter_id, -> { String }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
