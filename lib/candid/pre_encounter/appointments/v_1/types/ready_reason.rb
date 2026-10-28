# frozen_string_literal: true

module Candid
  module PreEncounter
    module Appointments
      module V1
        module Types
          module ReadyReason
            extend Candid::Internal::Types::Enum

            REVIEWED_RTE = "REVIEWED_RTE"
            CHECKED_PAYER_PORTAL = "CHECKED_PAYER_PORTAL"
            CALLED_PAYER = "CALLED_PAYER"
            PRIOR_APPOINTMENT_READY = "PRIOR_APPOINTMENT_READY"
          end
        end
      end
    end
  end
end
