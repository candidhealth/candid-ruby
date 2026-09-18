# frozen_string_literal: true

module Candid
  module EncounterSummaries
    module V1
      module Types
        # Filter on a datetime field by specifying an inclusive range. Either bound may be omitted for an open-ended
        # range.
        class DatetimeRangeFilter < Internal::Types::Model
          field :mode, -> { Candid::EncounterSummaries::V1::Types::DatetimeRangeMatchMode }, optional: true, nullable: false
          field :min, -> { String }, optional: true, nullable: false
          field :max, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
