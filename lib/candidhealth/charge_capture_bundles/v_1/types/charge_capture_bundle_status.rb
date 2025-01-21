# frozen_string_literal: true

module CandidApiClient
  module ChargeCaptureBundles
    module V1
      module Types
        class ChargeCaptureBundleStatus
          IN_PROGRESS = "in-progress"
          IN_ERROR = "in-error"
          SUCCESSFUL = "successful"
          ABORTED = "aborted"
        end
      end
    end
  end
end
