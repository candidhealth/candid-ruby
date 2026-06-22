# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          # Dates associated with the patient's health plan coverage.
          class CobPlanDateInformation < Internal::Types::Model
            field :plan_begin, -> { String }, optional: true, nullable: false
            field :plan_end, -> { String }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
