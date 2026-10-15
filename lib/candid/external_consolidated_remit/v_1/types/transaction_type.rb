# frozen_string_literal: true

module Candid
  module ExternalConsolidatedRemit
    module V1
      module Types
        module TransactionType
          extend Candid::Internal::Types::Enum

          INSURANCE_PAYMENT = "insurance_payment"
          INSURANCE_ADJUSTMENT = "insurance_adjustment"
        end
      end
    end
  end
end
