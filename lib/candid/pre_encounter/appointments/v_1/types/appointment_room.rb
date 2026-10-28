# frozen_string_literal: true

module Candid
  module PreEncounter
    module Appointments
      module V1
        module Types
          # A room booked for the appointment.
          class AppointmentRoom < Internal::Types::Model
            field :placer_room_id, -> { String }, optional: true, nullable: false
            field :name, -> { String }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
