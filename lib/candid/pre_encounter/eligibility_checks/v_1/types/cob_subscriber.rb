# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          # The primary policyholder for the insurance plan or a dependent with a unique member ID.
          # You must provide at least one of member_id or ssn.
          class CobSubscriber < Internal::Types::Model
            field :first_name, -> { String }, optional: false, nullable: false
            field :last_name, -> { String }, optional: false, nullable: false
            field :date_of_birth, -> { String }, optional: false, nullable: false
            field :member_id, -> { String }, optional: true, nullable: false
            field :ssn, -> { String }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
