# frozen_string_literal: true

module Candid
  module WorkQueues
    module V2
      module Types
        module WorkQueueCategory
          extend Candid::Internal::Types::Enum

          PRE_SUBMISSION = "Pre-Submission"
          REJECTIONS = "Rejections"
          DENIALS = "Denials"
          OTHER_POST_SUBMISSION = "Other Post-Submission"
          STALE_CLAIMS = "Stale Claims"
          CUSTOM = "Custom"
          CODING = "Coding"
          CHARGE_INGESTION = "Charge Ingestion"
        end
      end
    end
  end
end
