# frozen_string_literal: true

module CandidApiClient
  module Commons
    module Types
      class SourceOfPaymentCode
        SELF_PAY = "09"
        OTHER_NON_FEDERAL_PROGRAMS = "11"
        PPO = "12"
        POS = "13"
        EPO = "14"
        INDEMNITY_INSURANCE = "15"
        HMO_MEDICARE_RISK = "16"
        DMO = "17"
        AUTO = "AM"
        BLUE_CROSS_BLUE_SHIELD = "BL"
        CHAMPUS = "CH"
        COMMERCIAL_INSURANCE_CO = "CI"
        DISABILITY = "DS"
        FEDERAL_EMPLOYEES = "FI"
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
      end
    end
  end
end
