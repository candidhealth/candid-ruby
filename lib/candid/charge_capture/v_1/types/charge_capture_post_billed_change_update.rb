# frozen_string_literal: true

module Candid
  module ChargeCapture
    module V1
      module Types
        class ChargeCapturePostBilledChangeUpdate < Internal::Types::Model
          field :charge_capture_change_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false
          field :resolved, -> { Internal::Types::Boolean }, optional: false, nullable: false
        end
      end
    end
  end
end
