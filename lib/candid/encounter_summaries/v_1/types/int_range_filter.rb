# frozen_string_literal: true

module Candid
  module EncounterSummaries
    module V1
      module Types
        # Filter on an integer field by specifying an inclusive range. Either bound may be omitted for an open-ended
        # range.
        class IntRangeFilter < Internal::Types::Model
          field :mode, -> { Candid::EncounterSummaries::V1::Types::IntRangeMatchMode }, optional: true, nullable: false
          field :min, -> { Integer }, optional: true, nullable: false
          field :max, -> { Integer }, optional: true, nullable: false
        end
      end
    end
  end
end
