# frozen_string_literal: true

module Candid
  module ServiceLines
    module V2
      module Types
        class ServiceLineCreateBaseBase < Internal::Types::Model
          field :modifiers, -> { Internal::Types::Array[Candid::Commons::Types::ProcedureModifier] }, optional: true, nullable: false
          field :has_epsdt_indicator, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :has_family_planning_indicator, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :quantity, -> { String }, optional: false, nullable: false
          field :units, -> { Candid::Commons::Types::ServiceLineUnits }, optional: false, nullable: false
          field :charge_amount_cents, -> { Integer }, optional: true, nullable: false
          field :drug_identification, -> { Candid::ServiceLines::V2::Types::DrugIdentification }, optional: true, nullable: false
          field :place_of_service_code, -> { Candid::Commons::Types::FacilityTypeCode }, optional: true, nullable: false
          field :description, -> { String }, optional: true, nullable: false
          field :date_of_service, -> { String }, optional: true, nullable: false
          field :end_date_of_service, -> { String }, optional: true, nullable: false
          field :ordering_provider, -> { Candid::EncounterProviders::V2::Types::OrderingProvider }, optional: true, nullable: false
          field :test_results, -> { Internal::Types::Array[Candid::ServiceLines::V2::Types::TestResult] }, optional: true, nullable: false
          field :note, -> { String }, optional: true, nullable: false

        end
      end
    end
  end
end
