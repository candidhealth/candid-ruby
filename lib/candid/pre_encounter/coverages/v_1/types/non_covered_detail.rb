# frozen_string_literal: true

module Candid
  module PreEncounter
    module Coverages
      module V1
        module Types
          class NonCoveredDetail < Internal::Types::Model
            field :type, -> { Candid::PreEncounter::Coverages::V1::Types::BenefitType }, optional: false, nullable: false
            field :coverage_level, -> { Candid::PreEncounter::Coverages::V1::Types::CoverageLevel }, optional: false, nullable: false, api_name: "coverageLevel"
            field :unit, -> { Candid::PreEncounter::Coverages::V1::Types::CoverageValueUnit }, optional: false, nullable: false
            field :value, -> { Integer }, optional: false, nullable: false
            field :additional_notes, -> { String }, optional: true, nullable: false
            field :service_type_codes, -> { Internal::Types::Array[Candid::PreEncounter::Coverages::V1::Types::ServiceTypeCode] }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
