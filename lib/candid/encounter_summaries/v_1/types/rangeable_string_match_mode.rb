# frozen_string_literal: true

module Candid
  module EncounterSummaries
    module V1
      module Types
        module RangeableStringMatchMode
          extend Candid::Internal::Types::Enum

          EQUALS = "equals"
          NOT_EQUALS = "not_equals"
          CONTAINS = "contains"
          NOT_CONTAINS = "not_contains"
          STARTS_WITH = "starts_with"
          ENDS_WITH = "ends_with"
          BETWEEN = "between"
          NOT_BETWEEN = "not_between"
        end
      end
    end
  end
end
