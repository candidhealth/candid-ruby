# frozen_string_literal: true

module Candid
  module PreEncounter
    module Lists
      module V1
        module Types
          class AppointmentListItem < Internal::Types::Model
            field :appointment, lambda {
              Candid::PreEncounter::Appointments::V1::Types::Appointment
            }, optional: false, nullable: false
            field :patient, lambda {
              Candid::PreEncounter::Patients::V1::Types::MutablePatientWithMrn
            }, optional: false, nullable: false
            field :primary_coverage, lambda {
              Candid::PreEncounter::Coverages::V1::Types::MutableCoverage
            }, optional: true, nullable: false
            field :primary_service_type, lambda {
              Candid::PreEncounter::Appointments::V1::Types::UniversalServiceIdentifier
            }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
