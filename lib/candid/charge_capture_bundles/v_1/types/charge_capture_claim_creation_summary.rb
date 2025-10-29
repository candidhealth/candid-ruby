# frozen_string_literal: true

module Candid
  module ChargeCaptureBundles
    module V1
      module Types
        class ChargeCaptureClaimCreationSummary < Internal::Types::Model
          field :charge_capture_charges_not_linked_to_claims_count, -> { Integer }, optional: false, nullable: false
          field :charge_capture_claim_creations_not_started_count, -> { Integer }, optional: false, nullable: false
          field :charge_capture_held_claim_creations_count, -> { Integer }, optional: false, nullable: false
          field :charge_capture_claim_creations_in_error_count, -> { Integer }, optional: false, nullable: false
          field :charge_capture_unresolved_change_count, -> { Integer }, optional: false, nullable: false
        end
      end
    end
  end
end
