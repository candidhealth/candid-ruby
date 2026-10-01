# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          class Confidence < Internal::Types::Model
            field :level, -> { Candid::PreEncounter::EligibilityChecks::V1::Types::ConfidenceLevel }, optional: true, nullable: false
            field :reason, -> { String }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
