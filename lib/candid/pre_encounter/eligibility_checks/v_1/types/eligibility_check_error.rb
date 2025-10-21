# frozen_string_literal: true

module Candid
  module PreEncounter
    module EligibilityChecks
      module V1
        module Types
          class EligibilityCheckError < Internal::Types::Model
            field :source, -> { Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckErrorSource }, optional: false, nullable: false
            field :error_details, -> { Candid::PreEncounter::EligibilityChecks::V1::Types::EligibilityCheckErrorDetails }, optional: false, nullable: false

          end
        end
      end
    end
  end
end
