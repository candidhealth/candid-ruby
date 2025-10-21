# frozen_string_literal: true

module Candid
  module FeeSchedules
    module V3
      module Types
        # Threshold and dollar amount matching for a service line
        class ThresholdMatch < Internal::Types::Model
          field :threshold, -> { Candid::FeeSchedules::V3::Types::PayerThreshold }, optional: false, nullable: false
          field :rate_cents, -> { Integer }, optional: false, nullable: false
          field :match, -> { Internal::Types::Boolean }, optional: false, nullable: false
          field :explanation, -> { String }, optional: false, nullable: false

        end
      end
    end
  end
end
