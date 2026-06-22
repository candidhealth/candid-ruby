# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          # Information about the entity requesting the COB check.
          # Provide either organization_name (for organizations) or first_name and last_name (for individuals), plus
          # npi.
          class CobProvider < Internal::Types::Model
            field :organization_name, -> { String }, optional: true, nullable: false
            field :first_name, -> { String }, optional: true, nullable: false
            field :last_name, -> { String }, optional: true, nullable: false
            field :npi, -> { String }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
