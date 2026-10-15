# frozen_string_literal: true

module Candid
  module ExternalConsolidatedRemit
    module V1
      module Types
        module InsuranceAdjustmentSource
          extend Candid::Internal::Types::Enum

          MANUAL = "MANUAL"
          ERA = "ERA"
          ERA_RULE = "ERA_RULE"
          PAYMENT_BUNDLE = "PAYMENT_BUNDLE"
        end
      end
    end
  end
end
