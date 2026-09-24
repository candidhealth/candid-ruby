# frozen_string_literal: true

module Candid
  module PreEncounter
    module Appointments
      module V1
        module Types
          class AppointmentDeactivateRequest < Internal::Types::Model
            field :id, -> { String }, optional: false, nullable: false
            field :version, -> { String }, optional: false, nullable: false
            field :cancellation_reason, -> { String }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
