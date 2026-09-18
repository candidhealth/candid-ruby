# frozen_string_literal: true

module Candid
  module EncounterSummaries
    module V1
      module Types
        # Filter on a boolean field's value.
        class BooleanFilter < Internal::Types::Model
          field :value, -> { Internal::Types::Boolean }, optional: false, nullable: false
        end
      end
    end
  end
end
