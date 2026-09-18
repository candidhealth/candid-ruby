# frozen_string_literal: true

module Candid
  module EncounterSummaries
    module V1
      module Types
        module DatetimeRangeMatchMode
          extend Candid::Internal::Types::Enum

          BETWEEN = "between"
          NOT_BETWEEN = "not_between"
        end
      end
    end
  end
end
