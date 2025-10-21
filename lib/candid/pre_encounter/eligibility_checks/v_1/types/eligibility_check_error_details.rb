# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          # This object is our fern representation of Stedi's EligbilityCheckError object from their API.
          class EligibilityCheckErrorDetails < Internal::Types::Model
            field :field, -> { String }, optional: true, nullable: false
            field :description, -> { String }, optional: true, nullable: false
            field :location, -> { String }, optional: true, nullable: false
            field :possible_resolutions, -> { String }, optional: true, nullable: false
            field :code, -> { String }, optional: true, nullable: false
            field :followup_action, -> { String }, optional: true, nullable: false

          end
        end
      end
    end
  end
end
