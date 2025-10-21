# frozen_string_literal: true

module Candid
  module PreEncounter
    module Coverages
      module V1
        module Types
          class ServiceCoverageDetails < Internal::Types::Model
            field :copay, -> { Candid::PreEncounter::Coverages::V1::Types::CoverageValue }, optional: true, nullable: false
            field :coinsurance, -> { Candid::PreEncounter::Coverages::V1::Types::CoverageValue }, optional: true, nullable: false
            field :visits, -> { Candid::PreEncounter::Coverages::V1::Types::CoverageValue }, optional: true, nullable: false
            field :visits_remaining, -> { Candid::PreEncounter::Coverages::V1::Types::CoverageValue }, optional: true, nullable: false
            field :additional_notes, -> { String }, optional: true, nullable: false

          end
        end
      end
    end
  end
end
