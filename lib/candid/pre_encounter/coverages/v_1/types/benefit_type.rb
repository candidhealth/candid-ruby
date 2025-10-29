# frozen_string_literal: true

module Candid
  module PreEncounter
    module Coverages
      module V1
        module Types
          module BenefitType
            extend Candid::Internal::Types::Enum

            DEDUCTIBLE = "DEDUCTIBLE"
            DEDUCTIBLE_CONTRACT = "DEDUCTIBLE_CONTRACT"
            DEDUCTIBLE_REMAINING = "DEDUCTIBLE_REMAINING"
            DEDUCTIBLE_YEAR_TO_DATE = "DEDUCTIBLE_YEAR_TO_DATE"
            OOP_MAX = "OOP_MAX"
            OOP_MAX_CONTRACT = "OOP_MAX_CONTRACT"
            OOP_MAX_REMAINING = "OOP_MAX_REMAINING"
            OOP_MAX_YEAR_TO_DATE = "OOP_MAX_YEAR_TO_DATE"
            COPAY = "COPAY"
            COINSURANCE = "COINSURANCE"
          end
        end
      end
    end
  end
end
