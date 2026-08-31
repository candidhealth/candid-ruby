# frozen_string_literal: true

module Candid
  module Dashboarding
    module V1
      module Types
        module MetricName
          extend Candid::Internal::Types::Enum

          PATIENT_TOTAL_BALANCE_V_1 = "patient_total_balance_v1"
          PATIENT_OLDEST_BALANCE_DAYS_V_1 = "patient_oldest_balance_days_v1"
          PATIENT_OUTSTANDING_BALANCE_COUNT_V_1 = "patient_outstanding_balance_count_v1"
          PRE_ADJUDICATION_CLAIMS_COUNT_V_1 = "pre_adjudication_claims_count_v1"
          PRE_ADJUDICATION_TOTAL_AMOUNT_V_1 = "pre_adjudication_total_amount_v1"
          PRE_ADJUDICATION_OLDEST_AGE_DAYS_V_1 = "pre_adjudication_oldest_age_days_v1"
          POST_ADJUDICATION_CLAIMS_COUNT_V_1 = "post_adjudication_claims_count_v1"
          POST_ADJUDICATION_TOTAL_AMOUNT_V_1 = "post_adjudication_total_amount_v1"
          POST_ADJUDICATION_OLDEST_AGE_DAYS_V_1 = "post_adjudication_oldest_age_days_v1"
          PAYMENT_POSTING_CLAIMS_COUNT_V_1 = "payment_posting_claims_count_v1"
          PAYMENT_POSTING_TOTAL_AMOUNT_V_1 = "payment_posting_total_amount_v1"
          PAYMENT_POSTING_OLDEST_AGE_DAYS_V_1 = "payment_posting_oldest_age_days_v1"
          KPI_DENIAL_RATE_V_1 = "kpi_denial_rate_v1"
          KPI_FIRST_PASS_RESOLUTION_RATE_V_1 = "kpi_first_pass_resolution_rate_v1"
          KPI_DAYS_IN_AR_V_1 = "kpi_days_in_ar_v1"
          KPI_AR_OVER_90_DAYS_RATE_V_1 = "kpi_ar_over_90_days_rate_v1"
          KPI_NET_COLLECTION_RATE_V_1 = "kpi_net_collection_rate_v1"
        end
      end
    end
  end
end
