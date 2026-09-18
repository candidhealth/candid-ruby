# frozen_string_literal: true

module Candid
  module PreEncounter
    module Patients
      module V1
        module Types
          class AuditAppointmentWorkQueueChanged < Internal::Types::Model
            field :from_work_queue, -> { Candid::PreEncounter::Appointments::V1::Types::AppointmentWorkQueue }, optional: true, nullable: false
            field :to_work_queue, -> { Candid::PreEncounter::Appointments::V1::Types::AppointmentWorkQueue }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
