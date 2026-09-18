# frozen_string_literal: true

module Candid
  module EncounterSummaries
    module V1
      module Types
        # Shared request fields for encounter search endpoints.
        class EncounterSearchBase < Internal::Types::Model
          field :filters, -> { Candid::EncounterSummaries::V1::Types::EncounterFilter }, optional: true, nullable: false
          field :page_token, -> { String }, optional: true, nullable: false
          field :sort, -> { Internal::Types::Array[Candid::EncounterSummaries::V1::Types::SortCriterion] }, optional: true, nullable: false
        end
      end
    end
  end
end
