# frozen_string_literal: true

module Candid
  module Encounters
    module V4
      module Types
        module InterventionCategory
          extend Candid::Internal::Types::Enum

          ALLOPATHIC = "allopathic"
          NATUROPATHIC = "naturopathic"
          TESTS = "tests"
          LIFESTYLE = "lifestyle"
        end
      end
    end
  end
end
