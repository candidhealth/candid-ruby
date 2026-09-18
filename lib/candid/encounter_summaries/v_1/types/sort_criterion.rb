# frozen_string_literal: true

module Candid
  module EncounterSummaries
    module V1
      module Types
        # A single sort criterion specifying a field and direction.
        class SortCriterion < Internal::Types::Model
          field :field, -> { Candid::EncounterSummaries::V1::Types::EncounterSortableFields }, optional: false, nullable: false
          field :direction, -> { Candid::EncounterSummaries::V1::Types::EncounterSortDirections }, optional: true, nullable: false
        end
      end
    end
  end
end
