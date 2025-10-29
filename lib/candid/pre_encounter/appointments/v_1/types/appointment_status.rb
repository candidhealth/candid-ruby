# frozen_string_literal: true

module Candid
  module PreEncounter
    module Appointments
      module V1
        module Types
          module AppointmentStatus
            extend Candid::Internal::Types::Enum

            PENDING = "PENDING"
            NOT_READY = "NOT_READY"
            READY = "READY"
            CHECKED_IN = "CHECKED_IN"
          end
        end
      end
    end
  end
end
