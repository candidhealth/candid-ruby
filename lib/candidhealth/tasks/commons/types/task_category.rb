# frozen_string_literal: true

module CandidApiClient
  module Tasks
    module Commons
      module Types
        class TaskCategory
          OTHER = "other"
          PROVIDER_CREDENTIALING = "provider_credentialing"
          AUTHORIZATION_REQUIRED = "authorization_required"
          INACTIVE_COVERAGE = "inactive_coverage"
          UNKNOWN_ELIGIBILITY_OR_PATIENT_NOT_FOUND = "unknown_eligibility_or_patient_not_found"
          INCORRECT_MEMBER_ID = "incorrect_member_id"
          DOCUMENTATION_ADDENDUM_REQUEST = "documentation_addendum_request"
          COORDINATION_OF_BENEFITS = "coordination_of_benefits"
          MISSING_OR_INCORRECT_GENDER = "missing_or_incorrect_gender"
          INCORRECT_DATE_OF_BIRTH = "incorrect_date_of_birth"
          INCORRECT_PAYER = "incorrect_payer"
          INCORRECT_NAME = "incorrect_name"
          INVALID_DIAGNOSIS_CODE = "invalid_diagnosis_code"
          NON_COVERED_DIAGNOSIS_CODES = "non_covered_diagnosis_codes"
          INFORMATION_REQUESTED_FROM_PATIENT = "information_requested_from_patient"
          INCORRECT_RENDERING_PROVIDER_INFO = "incorrect_rendering_provider_info"
          MISSING_OR_INCORRECT_MODIFIER = "missing_or_incorrect_modifier"
          CODING_FREQUENCY_ERROR = "coding_frequency_error"
          INCORRECT_PATIENT_ADDRESS = "incorrect_patient_address"
          MULTIPLE_EM_CLAIMS = "multiple_em_claims"
          MISSING_OR_INCORRECT_CHARGE_AMOUNT = "missing_or_incorrect_charge_amount"
          MEDICAL_RECORDS_REQUEST = "medical_records_request"
          PROVIDER_ENROLLMENT_OR_CONTRACTING = "provider_enrollment_or_contracting"
          MISSING_OR_INCORRECT_GROUP_NUMBER = "missing_or_incorrect_group_number"
          MISSING_DIAGNOSIS_CODES = "missing_diagnosis_codes"
          MISSING_PATIENT_AUTHORIZATION = "missing_patient_authorization"
          INCORRECT_BILLING_PROVIDER_INFO = "incorrect_billing_provider_info"
          INCORRECT_PROCEDURE_CODE = "incorrect_procedure_code"
          INCORRECT_QUANTITY = "incorrect_quantity"
          INCORRECT_PLACE_OF_SERVICE_CODE = "incorrect_place_of_service_code"
          INCORRECT_SERVICE_FACILITY_INFO = "incorrect_service_facility_info"
          INCORRECT_DATE_OF_SERVICE = "incorrect_date_of_service"
          MISSING_OR_INCORRECT_NDC = "missing_or_incorrect_ndc"
          PATIENT_COLLECTIONS = "patient_collections"
          SUBMIT_TO_SECONDARY = "submit_to_secondary"
          TRANSIENT_SERVER_ERROR = "transient_server_error"
          MISSING_REMITTANCE_ENROLLMENT = "missing_remittance_enrollment"
          MISSING_CLAIMS_ENROLLMENT = "missing_claims_enrollment"
          HELD_BY_CUSTOMER = "held_by_customer"
          PENDING_MANUAL_REMIT_POSTING = "pending_manual_remit_posting"
          INCORRECT_REFERRING_PROVIDER_INFO = "incorrect_referring_provider_info"
        end
      end
    end
  end
end
