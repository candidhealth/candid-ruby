# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          # Information about the provider requesting the insurance discovery check.
          class InsuranceDiscoveryProvider < Internal::Types::Model
            field :npi, -> { String }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
