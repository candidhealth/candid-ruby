# frozen_string_literal: true

module Candid
  module ChargeCapture
    module V1
      module Types
        # ChargeCapturePostBilledChange represents a change to a ChargeCapture that occurred after the ChargeCapture's status moved to BILLED. Action must be taken to resolve the update, and then the update should be marked as resolved.
        class ChargeCapturePostBilledChange < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :message, -> { String }, optional: false, nullable: false
          field :resolved, -> { Internal::Types::Boolean }, optional: false, nullable: false
        end
      end
    end
  end
end
