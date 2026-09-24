# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          module InsuranceDiscoveryStatus
            extend Candid::Internal::Types::Enum

            PENDING = "PENDING"
            COMPLETE = "COMPLETE"
            ERROR = "ERROR"
            UNKNOWN = "UNKNOWN"
          end
        end
      end
    end
  end
end
