# frozen_string_literal: true

module Candid
  module PreEncounter
    module Coverages
      module V1
        module Types
          class ServiceCoverage < Internal::Types::Model
            field :service_code, -> { Candid::PreEncounter::Coverages::V1::Types::ServiceTypeCode }, optional: false, nullable: false
            field :in_network, -> { Candid::PreEncounter::Coverages::V1::Types::ServiceCoverageDetails }, optional: true, nullable: false
            field :in_network_flat, -> { Internal::Types::Array[Candid::PreEncounter::Coverages::V1::Types::CoverageDetails] }, optional: true, nullable: false
            field :out_of_network, -> { Candid::PreEncounter::Coverages::V1::Types::ServiceCoverageDetails }, optional: true, nullable: false
            field :out_of_network_flat, -> { Internal::Types::Array[Candid::PreEncounter::Coverages::V1::Types::CoverageDetails] }, optional: true, nullable: false

          end
        end
      end
    end
  end
end
