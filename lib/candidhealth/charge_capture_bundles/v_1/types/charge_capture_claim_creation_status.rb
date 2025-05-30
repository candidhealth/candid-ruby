# frozen_string_literal: true

module CandidApiClient
  module ChargeCaptureBundles
    module V1
      module Types
        class ChargeCaptureClaimCreationStatus
          NOT_STARTED = "not-started"
          IN_ERROR = "in-error"
          SUCCESSFUL = "successful"
          SUCCESSFUL_DRY_RUN = "successful-dry-run"
          ABORTED = "aborted"
          HELD = "held"
        end
      end
    end
  end
end
