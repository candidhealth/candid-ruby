# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          class IndividualProvider < Internal::Types::Model
            field :first_name, -> { String }, optional: true, nullable: false
            field :last_name, -> { String }, optional: true, nullable: false
            field :npi, -> { String }, optional: false, nullable: false

          end
        end
      end
    end
  end
end
