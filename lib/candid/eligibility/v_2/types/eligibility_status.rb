# frozen_string_literal: true

module Candid
  module Eligibility
    module V2
      module Types
        module EligibilityStatus
          extend Candid::Internal::Types::Enum

          ACTIVE = "ACTIVE"
          INACTIVE = "INACTIVE"
          UNKNOWN = "UNKNOWN"
        end
      end
    end
  end
end
