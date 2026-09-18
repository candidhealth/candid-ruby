# frozen_string_literal: true

module Candid
  module EncounterSummaries
    module V1
      module Types
        module EncounterSortableFields
          extend Candid::Internal::Types::Enum

          CREATED_AT = "created_at"
          DATE_OF_SERVICE = "date_of_service"
          PAYER_NAME = "payer_name"
          PAYER_ID = "payer_id"
          SECONDARY_PAYER_NAME = "secondary_payer_name"
          SECONDARY_PAYER_ID = "secondary_payer_id"
          CLAIM_STATUS = "status"
          PATIENT_NAME = "patient_name"
          BILLING_PROVIDER_TAX_ID = "billing_provider_tax_id"
          BILLING_PROVIDER_NPI = "billing_provider_npi"
          RENDERING_PROVIDER_NPI = "rendering_provider_npi"
          RENDERING_PROVIDER_NAME = "rendering_provider_name"
          WORK_QUEUE_MEMBERSHIP_ACTIVATED_AT = "work_queue_membership_activated_at"
          SNOOZE_END_DATE = "snooze_end_date"
          CARCS = "carcs"
          CLAIM_UPDATED_AT = "claim_updated_at"
          TASK_CATEGORY = "task_category"
          TASK_TYPE = "task_type"
          DIAGNOSIS_CODES = "diagnosis_codes"
          PATIENT_STATE = "patient_state"
          PRIMARY_PLAN_TYPE = "primary_plan_type"
          SECONDARY_PLAN_TYPE = "secondary_plan_type"
          PRIMARY_MEMBER_ID = "primary_member_id"
          PLACE_OF_SERVICE_CODE = "place_of_service_code"
          SERVICE_LINE_PLACE_OF_SERVICE_CODES = "service_line_place_of_service_codes"
          REJECTION_REASON = "rejection_reason"
          TASK_ASSIGNEE = "task_assignee"
          SERVICE_LINE_CPT_CODES = "service_line_cpt_codes"
          CLAIM_BALANCE = "claim_balance"
          PRIMARY_PAYER_PLAN_GROUP_NAME = "primary_payer_plan_group_name"
          SECONDARY_PAYER_PLAN_GROUP_NAME = "secondary_payer_plan_group_name"
          SUM_CHARGE_AMOUNT_CENTS = "sum_charge_amount_cents"
          PRIMARY_PAYER_PLAN_NAME = "primary_payer_plan_name"
          SECONDARY_PAYER_PLAN_NAME = "secondary_payer_plan_name"
          DAYS_SINCE_UNSNOOZED = "days_since_unsnoozed"
          ATTENDING_PROVIDER_NPI = "attending_provider_npi"
          ATTENDING_PROVIDER_NAME = "attending_provider_name"
          NON_INSURANCE_PAYER_NAMES = "non_insurance_payer_names"
          TIMELY_FILING_DEADLINE = "timely_filing_deadline"
        end
      end
    end
  end
end
