# frozen_string_literal: true

module CandidApiClient
  module ChargeCapture
    module V1
      module Types
        class ChargeCaptureStatus
          PLANNED = "planned"
          NOT_BILLABLE = "not-billable"
          BILLABLE = "billable"
          ABORTED = "aborted"
          BILLED = "billed"
          ENTERED_IN_ERROR = "entered-in-error"
          UNKNOWN = "unknown"
        end
      end
    end
  end
end
