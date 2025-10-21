# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          module EligibilityCheckStatus
            extend Candid::Internal::Types::Enum
            COMPLETED = "COMPLETED"
            FAILED = "FAILED"
            PENDING = "PENDING"end
        end
      end
    end
  end
end
