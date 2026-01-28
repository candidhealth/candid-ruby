# frozen_string_literal: true

module Candid
  module PreEncounter
    module Patients
      module V1
        module Types
          class PatientCoverageSnapshot < Internal::Types::Model
            field :patient, -> { Candid::PreEncounter::Patients::V1::Types::Patient }, optional: false, nullable: false
            field :primary_coverage, lambda {
              Candid::PreEncounter::Coverages::V1::Types::Coverage
            }, optional: true, nullable: false
            field :secondary_coverage, lambda {
              Candid::PreEncounter::Coverages::V1::Types::Coverage
            }, optional: true, nullable: false
            field :tertiary_coverage, lambda {
              Candid::PreEncounter::Coverages::V1::Types::Coverage
            }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
