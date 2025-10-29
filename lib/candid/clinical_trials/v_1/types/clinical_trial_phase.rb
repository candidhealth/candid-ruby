# frozen_string_literal: true

module Candid
  module ClinicalTrials
    module V1
      module Types
        module ClinicalTrialPhase
          extend Candid::Internal::Types::Enum

          PHASE_ONE = "Phase 1"
          PHASE_TWO = "Phase 2"
          PHASE_THREE = "Phase 3"
        end
      end
    end
  end
end
