# frozen_string_literal: true

module Candid
  module EncounterSummaries
    module V1
      module Types
        # Filter on work queue category by matching against a set of allowed categories, with optional
        # negation.
        class WorkQueueCategorySetFilter < Internal::Types::Model
          field :mode, -> { Candid::EncounterSummaries::V1::Types::SetMatchMode }, optional: true, nullable: false
          field :values, -> { Internal::Types::Array[Candid::WorkQueues::V2::Types::WorkQueueCategory] }, optional: false, nullable: false
        end
      end
    end
  end
end
