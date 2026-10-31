# frozen_string_literal: true

module Candid
  module PreServiceRules
    module V1
      module Types
        module PreServiceRunStatus
          extend Candid::Internal::Types::Enum

          IN_PROGRESS = "IN_PROGRESS"
          COMPLETE = "COMPLETE"
          FAILED = "FAILED"
        end
      end
    end
  end
end
