# frozen_string_literal: true

module Candid
  module PreEncounter
    module Appointments
      module V1
        module Types
          module NotReadyReason
            extend Candid::Internal::Types::Enum

            INACTIVE_PRIMARY = "INACTIVE_PRIMARY"
            INACTIVE_SECONDARY = "INACTIVE_SECONDARY"
            MEDICARE_ADVANTAGE_CONVERSION = "MEDICARE_ADVANTAGE_CONVERSION"
            MEDICAID_MANAGED_CONVERSION = "MEDICAID_MANAGED_CONVERSION"
            UNAVAILABLE_PRIMARY = "UNAVAILABLE_PRIMARY"
            UNAVAILABLE_SECONDARY = "UNAVAILABLE_SECONDARY"
            PENDING_PRIMARY = "PENDING_PRIMARY"
            PENDING_SECONDARY = "PENDING_SECONDARY"
            ELIGIBILITY_CHECK_FAILED_PRIMARY = "ELIGIBILITY_CHECK_FAILED_PRIMARY"
            ELIGIBILITY_CHECK_FAILED_SECONDARY = "ELIGIBILITY_CHECK_FAILED_SECONDARY"
            NEW_COMBO = "NEW_COMBO"
            NO_COVERAGE = "NO_COVERAGE"
            ERROR = "ERROR"
            MANUAL = "MANUAL"
          end
        end
      end
    end
  end
end
