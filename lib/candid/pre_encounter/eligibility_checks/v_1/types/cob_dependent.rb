# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          # A dependent for which you want to check coordination of benefits.
          # If the dependent has their own member ID, include their information in the subscriber object instead.
          class CobDependent < Internal::Types::Model
            field :first_name, -> { String }, optional: false, nullable: false
            field :last_name, -> { String }, optional: false, nullable: false
            field :date_of_birth, -> { String }, optional: false, nullable: false
            field :ssn, -> { String }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
