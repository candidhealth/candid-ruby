# frozen_string_literal: true

module Candid
  module EncounterSummaries
    module V1
      module Types
        # Filter on a text field using a match operator (equals, contains, starts_with, ends_with) with optional
        # negation.
        class StringFilter < Internal::Types::Model
          field :mode, -> { Candid::EncounterSummaries::V1::Types::StringMatchMode }, optional: true, nullable: false
          field :values, -> { Internal::Types::Array[String] }, optional: false, nullable: false
        end
      end
    end
  end
end
