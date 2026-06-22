# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          # Information about the payer listed in the COB request.
          class CobPayer < Internal::Types::Model
            field :name, -> { String }, optional: true, nullable: false
            field :payer_identification, -> { String }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
