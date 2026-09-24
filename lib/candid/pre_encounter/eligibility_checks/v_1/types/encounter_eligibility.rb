# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          class EncounterEligibility < Internal::Types::Model
            field :id, -> { String }, optional: false, nullable: false
            field :source, -> { Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilitySource }, optional: false, nullable: false
            field :date_of_service, -> { String }, optional: true, nullable: false, api_name: "dateOfService"
            field :payer_id, -> { String }, optional: false, nullable: false, api_name: "payerId"
            field :provider_npi, -> { String }, optional: false, nullable: false, api_name: "providerNPI"
            field :dependent, -> { Candid::PreEncounter::EligibilityChecks::V1::Types::Dependent }, optional: true, nullable: false
            field :status, -> { Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityStatus }, optional: false, nullable: false
            field :errors, -> { Internal::Types::Array[Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckError] }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
