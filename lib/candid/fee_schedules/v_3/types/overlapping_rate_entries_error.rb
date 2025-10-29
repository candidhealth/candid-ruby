# frozen_string_literal: true

module Candid
  module FeeSchedules
    module V3
      module Types
        # This error is thrown when two rate entries have time ranges that overlap.
        class OverlappingRateEntriesError < Internal::Types::Model
          field :message, -> { String }, optional: false, nullable: false
          field :rate_a, -> { Candid::FeeSchedules::V3::Types::RateEntry }, optional: false, nullable: false
          field :rate_b, -> { Candid::FeeSchedules::V3::Types::RateEntry }, optional: false, nullable: false
        end
      end
    end
  end
end
