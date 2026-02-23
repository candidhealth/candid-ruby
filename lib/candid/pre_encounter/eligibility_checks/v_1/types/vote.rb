# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          # User feedback on a recommendation
          class Vote < Internal::Types::Model
            field :user_id, -> { String }, optional: false, nullable: false
            field :value, lambda {
              Candid::PreEncounter::EligibilityChecks::V1::Types::VoteValue
            }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
