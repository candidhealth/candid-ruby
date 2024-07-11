# frozen_string_literal: true

module CandidApiClient
  module Tasks
    module Commons
      module Types
        class TaskStatus
          FINISHED = "finished"
          ADDRESSED_BY_PROVIDER_GROUP = "addressed_by_provider_group"
          SENT_TO_PROVIDER_GROUP = "sent_to_provider_group"
          OPEN_TASK = "open"
          BLOCKED = "blocked"
          WAITING_FOR_REVIEW = "waiting_for_review"
          IN_PROGRESS = "in_progress"
        end
      end
    end
  end
end
