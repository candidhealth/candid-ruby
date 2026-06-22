# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          # An object representing the data for a coordination of benefits request.
          class CoordinationOfBenefitsRequest < Internal::Types::Model
            field :trading_partner_service_id, -> { String }, optional: false, nullable: false
            field :provider, -> { Candid::PreEncounter::EligibilityChecks::V1::Types::CobProvider }, optional: false, nullable: false
            field :subscriber, -> { Candid::PreEncounter::EligibilityChecks::V1::Types::CobSubscriber }, optional: false, nullable: false
            field :dependent, -> { Candid::PreEncounter::EligibilityChecks::V1::Types::CobDependent }, optional: true, nullable: false
            field :encounter, -> { Candid::PreEncounter::EligibilityChecks::V1::Types::CobEncounter }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
