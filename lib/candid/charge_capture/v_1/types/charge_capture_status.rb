# frozen_string_literal: true

module Candid
  module ChargeCapture
    module V1
      module Types
        module ChargeCaptureStatus
          extend Candid::Internal::Types::Enum
          PLANNED = "planned"
          NOT_BILLABLE = "not-billable"
          BILLABLE = "billable"
          ABORTED = "aborted"
          ENTERED_IN_ERROR = "entered-in-error"end
      end
    end
  end
end
