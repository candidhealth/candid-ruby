# frozen_string_literal: true

module Candid
  module PreEncounter
    module Coverages
      module V1
        module Types
          class PlanCoverageDetails < Internal::Types::Model
            field :deductible, -> { Candid::PreEncounter::Coverages::V1::Types::CoverageValue }, optional: true, nullable: false
            field :deductible_contract, -> { Candid::PreEncounter::Coverages::V1::Types::CoverageValue }, optional: true, nullable: false
            field :deductible_remaining, -> { Candid::PreEncounter::Coverages::V1::Types::CoverageValue }, optional: true, nullable: false
            field :deductible_year_to_date, -> { Candid::PreEncounter::Coverages::V1::Types::CoverageValue }, optional: true, nullable: false
            field :oop_max, -> { Candid::PreEncounter::Coverages::V1::Types::CoverageValue }, optional: true, nullable: false
            field :oop_max_contract, -> { Candid::PreEncounter::Coverages::V1::Types::CoverageValue }, optional: true, nullable: false
            field :oop_max_remaining, -> { Candid::PreEncounter::Coverages::V1::Types::CoverageValue }, optional: true, nullable: false
            field :oop_max_year_to_date, -> { Candid::PreEncounter::Coverages::V1::Types::CoverageValue }, optional: true, nullable: false
            field :additional_notes, -> { String }, optional: true, nullable: false

          end
        end
      end
    end
  end
end
