# frozen_string_literal: true

module Candid
  module PreEncounter
    module Appointments
      module V1
        module Types
          module AppointmentWorkQueue
            extend Candid::Internal::Types::Enum

            EMERGENT_ISSUE = "EMERGENT_ISSUE"
            NEW_PATIENT = "NEW_PATIENT"
            RETURNING_PATIENT = "RETURNING_PATIENT"
            MANUAL_ESCALATION = "MANUAL_ESCALATION"
          end
        end
      end
    end
  end
end
