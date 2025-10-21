# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          class StediPayerItem < Internal::Types::Model
            field :score, -> { Integer }, optional: false, nullable: false
            field :payer, -> { Candid::PreEncounter::EligibilityChecks::V1::Types::StediPayer }, optional: false, nullable: false

          end
        end
      end
    end
  end
end
