# frozen_string_literal: true

module Candid
  module PreEncounter
    module Coverages
      module V1
        module Types
          class PlanCoverageDetails < Internal::Types::Model
            field :deductible, lambda {
              Candid::PreEncounter::Coverages::V1::Types::CoverageValue
            }, optional: true, nullable: false
            field :deductible_contract, lambda {
              Candid::PreEncounter::Coverages::V1::Types::CoverageValue
            }, optional: true, nullable: false
            field :deductible_remaining, lambda {
              Candid::PreEncounter::Coverages::V1::Types::CoverageValue
            }, optional: true, nullable: false
            field :deductible_year_to_date, lambda {
              Candid::PreEncounter::Coverages::V1::Types::CoverageValue
            }, optional: true, nullable: false
            field :oop_max, lambda {
              Candid::PreEncounter::Coverages::V1::Types::CoverageValue
            }, optional: true, nullable: false
            field :oop_max_contract, lambda {
              Candid::PreEncounter::Coverages::V1::Types::CoverageValue
            }, optional: true, nullable: false
            field :oop_max_remaining, lambda {
              Candid::PreEncounter::Coverages::V1::Types::CoverageValue
            }, optional: true, nullable: false
            field :oop_max_year_to_date, lambda {
              Candid::PreEncounter::Coverages::V1::Types::CoverageValue
            }, optional: true, nullable: false
            field :additional_notes, -> { String }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
