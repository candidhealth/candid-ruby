# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          class EligibilityCheckPage < Internal::Types::Model
            field :items, lambda {
              Internal::Types::Array[Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheck]
            }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
