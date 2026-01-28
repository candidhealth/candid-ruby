# frozen_string_literal: true

module Candid
  module PreEncounter
    module Appointments
      module V1
        module Types
          # A visit is a collection of appointments that occur on the same day.
          class Visit < Internal::Types::Model
            field :patient_id, -> { String }, optional: false, nullable: false
            field :patient, lambda {
              Candid::PreEncounter::Patients::V1::Types::MutablePatientWithMrn
            }, optional: false, nullable: false
            field :start_time, -> { String }, optional: false, nullable: false
            field :status, lambda {
              Candid::PreEncounter::Appointments::V1::Types::AppointmentStatus
            }, optional: false, nullable: false
            field :primary_coverage_status, lambda {
              Candid::PreEncounter::Coverages::V1::Types::CoverageStatus
            }, optional: true, nullable: false
            field :secondary_coverage_status, lambda {
              Candid::PreEncounter::Coverages::V1::Types::CoverageStatus
            }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
