# frozen_string_literal: true

module Candid
  module Commons
    module Types
      module SnoozeReason
        extend Candid::Internal::Types::Enum

        PENDING_APPEAL = "Pending Appeal"
        PENDING_ADJUDICATION = "Pending Adjudication"
        PENDING_REPROCESSING = "Pending Reprocessing"
        PENDING_PAYMENT_POSTING = "Pending Payment Posting"
        PENDING_EOB_CONVERSION = "Pending EOB Conversion"
        PENDING_CREDENTIALING_OR_CONTRACTING = "Pending Credentialing or Contracting"
        PENDING_DOCUMENTATION_UPDATE = "Pending Documentation Update"
        PENDING_MEDICAL_RECORDS_REVIEW = "Pending Medical Records Review"
        PENDING_PATIENT_RESPONSE = "Pending Patient Response"
        PENDING_PAYER_RESPONSE = "Pending Payer Response"
        PENDING_REFUND_CHECK = "Pending Refund Check"
        PENDING_RECOUPMENT = "Pending Recoupment"
        OTHER = "Other"
      end
    end
  end
end
