# frozen_string_literal: true

module Candid
  module FeeSchedules
    module V3
      module Types
        # Rate thresholds that determine fee schedule rate matching behavior.  When a service line is adjudicated by a payer Candid determines if the payer's
        # allowed amount "matches" the rate value.  If the allowed amount doesn't equal the rate value, Candid moves the claim to a PAID_INCORRECTLY state.  These
        # optional thresholds allow a user to set wiggle room to avoid claims moving to PAID_INCORRECTLY and instead have them move directly to FINALIZED_PAID
        # when the payer's allowed amount is greater than [rate_cents - lower_threshold_cents] and less than [rate_cents + upper_threshold_cents].
        #
        # Additionally, a client can set disable_paid_incorrectly to avoid the PAID_INCORRECTLY claim status entirely.
        class PayerThreshold < Internal::Types::Model
          field :upper_threshold_cents, -> { Integer }, optional: true, nullable: false
          field :lower_threshold_cents, -> { Integer }, optional: true, nullable: false
          field :disable_paid_incorrectly, -> { Internal::Types::Boolean }, optional: false, nullable: false
        end
      end
    end
  end
end
