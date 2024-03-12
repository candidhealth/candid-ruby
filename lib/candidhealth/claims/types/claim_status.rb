# frozen_string_literal: true

module CandidApiClient
  class Claims
    class ClaimStatus
      BILLER_RECEIVED = "biller_received"
      CODED = "coded"
      SUBMITTED_TO_PAYER = "submitted_to_payer"
      MISSING_INFORMATION = "missing_information"
      NOT_BILLABLE = "not_billable"
      WAITING_FOR_PROVIDER = "waiting_for_provider"
      ERA_RECEIVED = "era_received"
      REJECTED = "rejected"
      DENIED = "denied"
      PAID = "paid"
      PAID_INCORRECTLY = "paid_incorrectly"
      FINALIZED_PAID = "finalized_paid"
      FINALIZED_DENIED = "finalized_denied"
      HELD_BY_CUSTOMER = "held_by_customer"
      ERA_REQUIRES_REVIEW = "era_requires_review"
    end
  end
end
