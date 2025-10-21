# frozen_string_literal: true

module Candid
  module NonInsurancePayers
    module V1
      module Types
        class ToggleNonInsurancePayerEnablementRequest < Internal::Types::Model
          field :enabled, -> { Internal::Types::Boolean }, optional: false, nullable: false

        end
      end
    end
  end
end
