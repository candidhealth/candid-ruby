# frozen_string_literal: true

module Candid
  module Commons
    module Types
      module NetworkType
        extend Candid::Internal::Types::Enum
        PPO = "12"
        POS = "13"
        EPO = "14"
        INDEMNITY_INSURANCE = "15"
        HMO_MEDICARE_RISK = "16"
        DMO = "17"
        AUTO = "AM"
        CHAMPUS = "CH"
        DISABILITY = "DS"
        HMO = "HM"
        LIABILITY = "LM"
        MEDICARE_PART_A = "MA"
        MEDICARE_PART_B = "MB"
        MEDICAID = "MC"
        OTHER_FEDERAL_PROGRAM = "OF"
        TITLE_V = "TV"
        VETERANS_AFFAIRS_PLAN = "VA"
        WORKERS_COMP_HEALTH_CLAIM = "WC"
        MUTUALLY_DEFINED = "ZZ"
        COMMERCIAL_INSURANCE_CO = "CI"
        BLUE_CROSS_BLUE_SHIELD = "BL"end
    end
  end
end
