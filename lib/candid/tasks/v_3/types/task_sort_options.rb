# frozen_string_literal: true

module Candid
  module Tasks
    module V3
      module Types
        module TaskSortOptions
          extend Candid::Internal::Types::Enum
          UPDATED_AT_ASC = "updated_at:asc"
          UPDATED_AT_DESC = "updated_at:desc"
          PATIENT_NAME_ASC = "patient_name:asc"
          PATIENT_NAME_DESC = "patient_name:desc"
          PATIENT_EXTERNAL_ID_ASC = "patient_external_id:asc"
          PATIENT_EXTERNAL_ID_DESC = "patient_external_id:desc"
          PAYER_NAME_ASC = "payer_name:asc"
          PAYER_NAME_DESC = "payer_name:desc"
          PAYER_ID_ASC = "payer_id:asc"
          PAYER_ID_DESC = "payer_id:desc"
          STATUS_ASC = "status:asc"
          STATUS_DESC = "status:desc"
          TASK_TYPE_ASC = "task_type:asc"
          TASK_TYPE_DESC = "task_type:desc"
          CATEGORY_ASC = "category:asc"
          CATEGORY_DESC = "category:desc"
          AGG_UPDATED_AT_ASC = "agg_updated_at:asc"
          AGG_UPDATED_AT_DESC = "agg_updated_at:desc"
          DATE_OF_SERVICE_ASC = "date_of_service:asc"
          DATE_OF_SERVICE_DESC = "date_of_service:desc"
          BLOCKS_CLAIM_SUBMISSION_ASC = "blocks_claim_submission:asc"
          BLOCKS_CLAIM_SUBMISSION_DESC = "blocks_claim_submission:desc"end
      end
    end
  end
end
