# frozen_string_literal: true

module Candid
  module EncounterSummaries
    module V1
      module Types
        # Filter on a text field using either a match operator (equals, contains, starts_with, ends_with) with
        # optional negation, or a lexicographic range (between, not_between) for fixed-width codes like CPT.
        # Use values with the match modes, and min/max with the range modes.
        class RangeableStringFilter < Internal::Types::Model
          field :mode, -> { Candid::EncounterSummaries::V1::Types::RangeableStringMatchMode }, optional: true, nullable: false
          field :values, -> { Internal::Types::Array[String] }, optional: true, nullable: false
          field :min, -> { String }, optional: true, nullable: false
          field :max, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
