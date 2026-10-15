# frozen_string_literal: true

module Candid
  module EraCommons
    module Types
      module EraDocumentStatus
        extend Candid::Internal::Types::Enum

        QUEUED = "queued"
        PROCESSED = "processed"
        FAILED = "failed"
        MANUAL_INTERVENTION = "manual_intervention"
      end
    end
  end
end
