# frozen_string_literal: true

module CandidApiClient
  module WriteOffs
    module V1
      module Types
        class PatientWriteOffReason
          SMALL_BALANCE = "SMALL_BALANCE"
          CHARITY_OR_FINANCIAL_ASSISTANCE = "CHARITY_OR_FINANCIAL_ASSISTANCE"
          PATIENT_EXPERIENCE_OR_SERVICE_RECOVERY = "PATIENT_EXPERIENCE_OR_SERVICE_RECOVERY"
          OON_COURTESY_ADJUSTMENT = "OON_COURTESY_ADJUSTMENT"
          PROMPT_PAY_DISCOUNT = "PROMPT_PAY_DISCOUNT"
          BAD_DEBT = "BAD_DEBT"
          COLLECTION_AGENCY = "COLLECTION_AGENCY"
          OTHER = "OTHER"
          UNKNOWN = "UNKNOWN"
          UNCOLLECTIBLE_OR_NON_BILLABLE = "UNCOLLECTIBLE_OR_NON_BILLABLE"
          DECEASED = "DECEASED"
          BANKRUPTCY = "BANKRUPTCY"
        end
      end
    end
  end
end
