# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          module EligibilitySource
            extend Candid::Internal::Types::Enum

            STEDI = "STEDI"
            AVAILITY = "AVAILITY"
            PHONE_AGENT = "PHONE_AGENT"
            BROWSER_AGENT = "BROWSER_AGENT"
          end
        end
      end
    end
  end
end
