# frozen_string_literal: true

module Candid
  module PreEncounter
    module Appointments
      module V1
        module Types
          # A visit is a collection of appointments that occur on the same day.
          class Visit < Internal::Types::Model
            field :patient_id, -> { String }, optional: false, nullable: false
            field :patient, -> { Candid::PreEncounter::Patients::V1::Types::MutablePatientWithMrn }, optional: false, nullable: false
            field :start_time, -> { String }, optional: false, nullable: false
            field :status, -> { Candid::PreEncounter::Appointments::V1::Types::AppointmentStatus }, optional: false, nullable: false
            field :primary_coverage, -> { Candid::PreEncounter::Coverages::V1::Types::MutableCoverage }, optional: true, nullable: false

          end
        end
      end
    end
  end
end
