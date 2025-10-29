# frozen_string_literal: true

module Candid
  module PreEncounter
    module Appointments
      module V1
        module Types
          module UniversalServiceIdentifier
            extend Candid::Internal::Types::Enum

            MD_VISIT = "MD_Visit"
            TREATMENT = "Treatment"
            TESTS = "Tests"
            ACTIVITY = "Activity"
          end
        end
      end
    end
  end
end
