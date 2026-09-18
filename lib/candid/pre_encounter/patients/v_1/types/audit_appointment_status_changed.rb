# frozen_string_literal: true

module Candid
  module PreEncounter
    module Patients
      module V1
        module Types
          class AuditAppointmentStatusChanged < Internal::Types::Model
            field :from_status, -> { Candid::PreEncounter::Appointments::V1::Types::AppointmentStatus }, optional: true, nullable: false
            field :to_status, -> { Candid::PreEncounter::Appointments::V1::Types::AppointmentStatus }, optional: true, nullable: false
            field :not_ready_reason, -> { Candid::PreEncounter::Appointments::V1::Types::NotReadyReason }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
