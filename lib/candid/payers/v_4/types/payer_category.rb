# frozen_string_literal: true

module Candid
  module Payers
    module V4
      module Types
        module PayerCategory
          extend Candid::Internal::Types::Enum

          BCBS = "BCBS"
          AETNA_AFFILIATED = "AETNA_AFFILIATED"
          CIGNA_AFFILIATED = "CIGNA_AFFILIATED"
          UNITED_AFFILIATED = "UNITED_AFFILIATED"
          MEDICARE = "MEDICARE"
          NON_TRADITIONAL_MEDICARE = "NON_TRADITIONAL_MEDICARE"
          MEDICAID = "MEDICAID"
          HOSPICE = "HOSPICE"
          SNF = "SNF"
          TRICARE = "TRICARE"
          WORKERS_COMP = "WORKERS_COMP"
          OTHER_GOVERNMENT = "OTHER_GOVERNMENT"
          AUTO_TPL = "AUTO_TPL"
        end
      end
    end
  end
end
