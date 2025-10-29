# frozen_string_literal: true

module Candid
  module ChargeCaptureBundles
    module V1
      module Types
        class ChargeCaptureBundleErrorResolution < Internal::Types::Model
          field :charge_capture_bundle_error_id, -> { String }, optional: false, nullable: false
          field :resolved_by, -> { String }, optional: true, nullable: false
          field :resolution_reason, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
