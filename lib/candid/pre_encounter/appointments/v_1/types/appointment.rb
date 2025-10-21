# frozen_string_literal: true

module Candid
  module PreEncounter
    module Appointments
      module V1
        module Types
          # An appointment object with immutable server-owned properties.
          class Appointment < Internal::Types::Model
            field :id, -> { String }, optional: false, nullable: false

          end
        end
      end
    end
  end
end
