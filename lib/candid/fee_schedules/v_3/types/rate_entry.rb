# frozen_string_literal: true

module Candid
  module FeeSchedules
    module V3
      module Types
        # A rate value in cents for a specific time range.  Rate entries can be deactivated, which is set by using the deelte_rate endpoint.  Deactivated rate entries are not considered when matching against service lines.
        class RateEntry < Internal::Types::Model
          field :start_date, -> { String }, optional: false, nullable: false
          field :end_date, -> { String }, optional: true, nullable: false
          field :rate_cents, -> { Integer }, optional: false, nullable: false
          field :is_deactivated, -> { Internal::Types::Boolean }, optional: false, nullable: false

        end
      end
    end
  end
end
