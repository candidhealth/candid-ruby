# frozen_string_literal: true

module Candid
  module PreEncounter
    module Coverages
      module V1
        module Types
          class CoverageDetails < Internal::Types::Model
            field :type, -> { Candid::PreEncounter::Coverages::V1::Types::BenefitType }, optional: false, nullable: false
            field :coverage_level, -> { Candid::PreEncounter::Coverages::V1::Types::CoverageLevel }, optional: false, nullable: false
            field :unit, -> { Candid::PreEncounter::Coverages::V1::Types::CoverageValueUnit }, optional: false, nullable: false
            field :value, -> { Integer }, optional: false, nullable: false
            field :additional_notes, -> { String }, optional: true, nullable: false

          end
        end
      end
    end
  end
end
