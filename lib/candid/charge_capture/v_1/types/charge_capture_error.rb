# frozen_string_literal: true

module Candid
  module ChargeCapture
    module V1
      module Types
        class ChargeCaptureError < Internal::Types::Model
          field :id, -> { String }, optional: false, nullable: false
          field :charge_capture_id, -> { String }, optional: true, nullable: false
          field :message, -> { String }, optional: false, nullable: false
          field :resolved, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :resolved_by, -> { String }, optional: true, nullable: false
          field :resolution_reason, -> { String }, optional: true, nullable: false
          field :field_in_error, -> { String }, optional: true, nullable: false
          field :claim_creation_id, -> { String }, optional: false, nullable: false

        end
      end
    end
  end
end
