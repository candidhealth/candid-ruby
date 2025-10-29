# frozen_string_literal: true

module Candid
  module ServiceLines
    module V2
      module Types
        module DenialReasonContent
          extend Candid::Internal::Types::Enum

          AUTHORIZATION_REQUIRED = "Authorization Required"
          REFERRAL_REQUIRED = "Referral Required"
          MEDICAL_RECORDS_REQUESTED = "Medical Records Requested"
          TIMELY_FILING = "Timely Filing"
          DUPLICATE_CLAIM = "Duplicate Claim"
          FULL_CONTRACTUAL_ADJUSTMENT = "Full Contractual Adjustment"
          INCORRECT_PLACE_OF_SERVICE = "Incorrect Place of Service"
          INCORRECT_PATIENT_GENDER = "Incorrect Patient Gender"
          INCORRECT_PATIENT_INFO = "Incorrect Patient Info"
          BUNDLED = "Bundled"
          EXCEEDED_BILLABLE_TIME = "Exceeded Billable Time"
          INVALID_PROVIDER_INFORMATION = "Invalid Provider Information"
          INVALID_DIAGNOSIS_CODE = "Invalid Diagnosis Code"
          INCORRECT_PROCEDURE_CODE = "Incorrect Procedure Code"
          INVALID_MODIFIER = "Invalid Modifier"
          MISSING_NDC_CODE = "Missing NDC Code"
          INVALID_INSURANCE_DATA = "Invalid Insurance Data"
          NO_ACTIVE_COVERAGE = "No Active Coverage"
          COORDINATION_OF_BENEFITS = "Coordination of Benefits"
          INCORRECT_PAYER = "Incorrect Payer"
          CREDENTIALING = "Credentialing"
          NO_EFFECTIVE_CONTRACT = "No Effective Contract"
          MISSING_W_9 = "Missing W-9"
          MISSING_CONTRACT_LINKAGE = "Missing Contract Linkage"
          NON_COVERED_BENEFIT = "Non-Covered Benefit"
          EXPERIMENTAL_PROCEDURE = "Experimental Procedure"
          NOT_MEDICALLY_NECESSARY = "Not Medically Necessary"
          INFO_REQUESTED_FROM_PROVIDER = "Info Requested from Provider"
          INFO_REQUESTED_FROM_PATIENT = "Info Requested from Patient"
          BILLING_ERROR = "Billing Error"
          UNKNOWN = "Unknown"
          MAX_BENEFIT_REACHED = "Max Benefit Reached"
        end
      end
    end
  end
end
