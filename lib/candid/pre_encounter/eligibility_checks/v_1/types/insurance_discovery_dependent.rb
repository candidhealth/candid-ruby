# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          # Demographic information for the patient when they are a dependent on a health plan.
          # If you only have the dependent's information, identify them in the subscriber object instead and leave this
          # empty.
          class InsuranceDiscoveryDependent < Internal::Types::Model
            field :first_name, -> { String }, optional: false, nullable: false
            field :last_name, -> { String }, optional: false, nullable: false
            field :middle_name, -> { String }, optional: true, nullable: false
            field :date_of_birth, -> { String }, optional: true, nullable: false
            field :ssn, -> { String }, optional: true, nullable: false
            field :gender, -> { Candid::PreEncounter::EligibilityChecks::V1::Types::InsuranceDiscoveryGender }, optional: true, nullable: false
            field :address, -> { Candid::PreEncounter::EligibilityChecks::V1::Types::InsuranceDiscoveryAddress }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
