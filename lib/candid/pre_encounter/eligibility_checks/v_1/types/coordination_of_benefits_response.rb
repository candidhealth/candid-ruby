# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          # An object representing the data for a coordination of benefits response.
          class CoordinationOfBenefitsResponse < Internal::Types::Model
            field :provider, -> { Candid::PreEncounter::EligibilityChecks::V1::Types::CobResponseProvider }, optional: true, nullable: false
            field :subscriber, -> { Candid::PreEncounter::EligibilityChecks::V1::Types::CobResponseSubscriber }, optional: true, nullable: false
            field :dependent, -> { Candid::PreEncounter::EligibilityChecks::V1::Types::CobResponseDependent }, optional: true, nullable: false
            field :payer, -> { Candid::PreEncounter::EligibilityChecks::V1::Types::CobPayer }, optional: true, nullable: false
            field :plan_date_information, -> { Candid::PreEncounter::EligibilityChecks::V1::Types::CobPlanDateInformation }, optional: true, nullable: false
            field :benefits_information, -> { Internal::Types::Array[Object] }, optional: true, nullable: false
            field :errors, -> { Internal::Types::Array[Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckErrorDetails] }, optional: true, nullable: false
            field :coordination_of_benefits, -> { Candid::PreEncounter::EligibilityChecks::V1::Types::Cob }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
