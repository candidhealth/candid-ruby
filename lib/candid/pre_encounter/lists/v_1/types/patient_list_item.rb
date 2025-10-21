# frozen_string_literal: true

module Candid
  module PreEncounter
    module Lists
      module V1
        module Types
          class PatientListItem < Internal::Types::Model
            field :patient, -> { Candid::PreEncounter::Patients::V1::Types::Patient }, optional: false, nullable: false
            field :primary_coverage, -> { Candid::PreEncounter::Coverages::V1::Types::MutableCoverage }, optional: true, nullable: false
            field :secondary_coverage, -> { Candid::PreEncounter::Coverages::V1::Types::MutableCoverage }, optional: true, nullable: false
            field :tertiary_coverage, -> { Candid::PreEncounter::Coverages::V1::Types::MutableCoverage }, optional: true, nullable: false
            field :next_appointment, -> { Candid::PreEncounter::Appointments::V1::Types::MutableAppointment }, optional: true, nullable: false

          end
        end
      end
    end
  end
end
