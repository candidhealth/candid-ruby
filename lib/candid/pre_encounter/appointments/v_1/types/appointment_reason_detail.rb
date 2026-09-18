# frozen_string_literal: true

module Candid
  module PreEncounter
    module Appointments
      module V1
        module Types
          # The clinical context for the appointment.
          class AppointmentReasonDetail < Internal::Types::Model
            field :diagnosis_codes, -> { Internal::Types::Array[String] }, optional: true, nullable: false
            field :procedure_codes, -> { Internal::Types::Array[String] }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
