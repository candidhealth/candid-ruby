# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          class Provider < Internal::Types::Model
            extend Candid::Internal::Types::Union

            member -> { Candid::PreEncounter::EligibilityChecks::V1::Types::IndividualProvider }
            member -> { Candid::PreEncounter::EligibilityChecks::V1::Types::OrganizationProvider }
          end
        end
      end
    end
  end
end
