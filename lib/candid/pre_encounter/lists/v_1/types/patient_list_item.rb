# frozen_string_literal: true

module Candid
  module PreEncounter
    module Lists
      module V1
        module Types
          class PatientListItem < Internal::Types::Model
            field :patient, -> { Candid::PreEncounter::Patients::V1::Types::Patient }, optional: false, nullable: false
            field :primary_coverage, lambda {
              Candid::PreEncounter::Coverages::V1::Types::MutableCoverage
            }, optional: true, nullable: false
            field :secondary_coverage, lambda {
              Candid::PreEncounter::Coverages::V1::Types::MutableCoverage
            }, optional: true, nullable: false
            field :tertiary_coverage, lambda {
              Candid::PreEncounter::Coverages::V1::Types::MutableCoverage
            }, optional: true, nullable: false
            field :next_appointment, lambda {
              Candid::PreEncounter::Appointments::V1::Types::MutableAppointment
            }, optional: true, nullable: false
            field :primary_mrn, -> { String }, optional: true, nullable: false
            field :alternative_mrns, -> { Internal::Types::Array[String] }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
