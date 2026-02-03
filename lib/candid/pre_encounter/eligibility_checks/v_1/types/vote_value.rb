# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          module VoteValue
            extend Candid::Internal::Types::Enum

            GOOD = "GOOD"
            BAD = "BAD"
            OK = "OK"
          end
        end
      end
    end
  end
end
