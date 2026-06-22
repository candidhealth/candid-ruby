# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          # Information about the encounter for the COB check.
          # Service dates must be within the past 2 years and must not be in the future.
          class CobEncounter < Internal::Types::Model
            field :date_of_service, -> { String }, optional: true, nullable: false
            field :beginning_date_of_service, -> { String }, optional: true, nullable: false
            field :end_date_of_service, -> { String }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
