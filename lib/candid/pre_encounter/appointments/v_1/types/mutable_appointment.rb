# frozen_string_literal: true

module Candid
  module PreEncounter
    module Appointments
      module V1
        module Types
          # An object representing a appointment.
          class MutableAppointment < Internal::Types::Model
            field :patient_id, -> { String }, optional: false, nullable: false
            field :start_timestamp, -> { String }, optional: false, nullable: false
            field :status, -> { Candid::PreEncounter::Appointments::V1::Types::AppointmentStatus }, optional: true, nullable: false
            field :service_duration, -> { Integer }, optional: false, nullable: false
            field :services, -> { Internal::Types::Array[Candid::PreEncounter::Appointments::V1::Types::Service] }, optional: false, nullable: false
            field :placer_appointment_id, -> { String }, optional: true, nullable: false
            field :attending_doctor, -> { Candid::PreEncounter::Common::Types::ExternalProvider }, optional: true, nullable: false
            field :estimated_copay_cents, -> { Integer }, optional: true, nullable: false
            field :estimated_patient_responsibility_cents, -> { Integer }, optional: true, nullable: false
            field :patient_deposit_cents, -> { Integer }, optional: true, nullable: false
            field :appointment_details, -> { String }, optional: true, nullable: false
            field :checked_in_timestamp, -> { String }, optional: true, nullable: false
            field :notes, -> { String }, optional: true, nullable: false
            field :location_resource_id, -> { String }, optional: true, nullable: false
            field :automated_eligibility_check_complete, -> { Internal::Types::Boolean }, optional: true, nullable: false
            field :work_queue, -> { Candid::PreEncounter::Appointments::V1::Types::AppointmentWorkQueue }, optional: true, nullable: false

          end
        end
      end
    end
  end
end
