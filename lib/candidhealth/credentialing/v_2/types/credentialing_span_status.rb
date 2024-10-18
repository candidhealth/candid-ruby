# frozen_string_literal: true

module CandidApiClient
  module Credentialing
    module V2
      module Types
        # Stage of a credentialing span in the credentialing workflow.
        class CredentialingSpanStatus
          WORK_IN_PROGRESS = "work_in_progress"
          PENDING = "pending"
          EFFECTIVE = "effective"
          EXPIRED = "expired"
        end
      end
    end
  end
end
