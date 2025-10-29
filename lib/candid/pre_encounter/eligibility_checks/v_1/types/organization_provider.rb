# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          class OrganizationProvider < Internal::Types::Model
            field :organization_name, -> { String }, optional: true, nullable: false
            field :npi, -> { String }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
