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
          ENTERED_IN_ERROR = "entered-in-error"
        end
      end
    end
  end
end
