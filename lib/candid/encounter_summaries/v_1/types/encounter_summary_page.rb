# frozen_string_literal: true

module Candid
  module EncounterSummaries
    module V1
      module Types
        class EncounterSummaryPage < Internal::Types::Model
          field :items, -> { Internal::Types::Array[Candid::EncounterSummaries::V1::Types::EncounterSummary] }, optional: false, nullable: false
        end
      end
    end
  end
end
