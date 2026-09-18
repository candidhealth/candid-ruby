# frozen_string_literal: true

module Candid
  module EncounterSummaries
    module V1
      module Types
        # Filter on a field by matching against a set of allowed values or prefixes, with optional negation.
        class PrefixableSetFilter < Internal::Types::Model
          field :mode, -> { Candid::EncounterSummaries::V1::Types::PrefixableSetMatchMode }, optional: true, nullable: false
          field :values, -> { Internal::Types::Array[String] }, optional: false, nullable: false
        end
      end
    end
  end
end
