# frozen_string_literal: true

module Candid
  module ChargeCaptureBundles
    module V1
      module Types
        module ChargeCaptureClaimCreationStatus
          extend Candid::Internal::Types::Enum

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
