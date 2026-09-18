# frozen_string_literal: true

module Candid
  module EncounterSummaries
    module V1
      module Types
        # Filter on a UUID field by matching against a set of allowed values, with optional negation.
        class UuidSetFilter < Internal::Types::Model
          field :mode, -> { Candid::EncounterSummaries::V1::Types::UuidSetMatchMode }, optional: true, nullable: false
          field :values, -> { Internal::Types::Array[String] }, optional: false, nullable: false
        end
      end
    end
  end
end
