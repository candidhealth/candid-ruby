# frozen_string_literal: true

module Candid
  module PreEncounter
    module Appointments
      module V1
        module Types
          class AppointmentScanRequest < Internal::Types::Model
            field :since, -> { String }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
