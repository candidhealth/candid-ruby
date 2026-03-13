# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          # This object is our fern representation of Stedi's EligbilityCheckError object from their API.
          class EligibilityCheckErrorDetails < Internal::Types::Model
            field :field, -> { String }, optional: true, nullable: false, api_name: "field?"
            field :description, -> { String }, optional: true, nullable: false, api_name: "description?"
            field :location, -> { String }, optional: true, nullable: false, api_name: "location?"
            field :possible_resolutions, -> { String }, optional: true, nullable: false, api_name: "possibleResolutions?"
            field :code, -> { String }, optional: true, nullable: false, api_name: "code?"
            field :followup_action, -> { String }, optional: true, nullable: false, api_name: "followupAction?"
          end
        end
      end
    end
  end
end
