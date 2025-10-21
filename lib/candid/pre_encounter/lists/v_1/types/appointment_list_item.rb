# frozen_string_literal: true

module Candid
  module PreEncounter
    module Lists
      module V1
        module Types
          class AppointmentListItem < Internal::Types::Model
            field :appointment, -> { Candid::PreEncounter::Appointments::V1::Types::Appointment }, optional: false, nullable: false
            field :patient, -> { Candid::PreEncounter::Patients::V1::Types::MutablePatientWithMrn }, optional: false, nullable: false
            field :primary_coverage, -> { Candid::PreEncounter::Coverages::V1::Types::MutableCoverage }, optional: true, nullable: false
            field :primary_service_type, -> { Candid::PreEncounter::Appointments::V1::Types::UniversalServiceIdentifier }, optional: true, nullable: false

          end
        end
      end
    end
  end
end
