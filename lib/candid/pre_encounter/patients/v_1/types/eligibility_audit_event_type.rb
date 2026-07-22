# frozen_string_literal: true

module Candid
  module PreEncounter
    module Patients
      module V1
        module Types
          module EligibilityAuditEventType
            extend Candid::Internal::Types::Enum

            APPOINTMENT_STATUS_CHANGED = "APPOINTMENT_STATUS_CHANGED"
            APPOINTMENT_WORK_QUEUE_CHANGED = "APPOINTMENT_WORK_QUEUE_CHANGED"
            APPOINTMENT_COPAY_UPDATED = "APPOINTMENT_COPAY_UPDATED"
            COVERAGE_CREATED = "COVERAGE_CREATED"
            COVERAGE_UPDATED = "COVERAGE_UPDATED"
            ELIG_CHECK_COMPLETED = "ELIG_CHECK_COMPLETED"
          end
        end
      end
    end
  end
end
