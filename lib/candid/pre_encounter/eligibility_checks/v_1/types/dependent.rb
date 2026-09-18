# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          class Dependent < Internal::Types::Model
            field :name, -> { String }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
