# frozen_string_literal: true

module Candid
  module EncounterSummaries
    module V1
      module Types
        module PrefixableSetMatchMode
          extend Candid::Internal::Types::Enum

          IN = "in"
          NOT_IN = "not_in"
          STARTS_WITH = "starts_with"
        end
      end
    end
  end
end
