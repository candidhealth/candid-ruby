# frozen_string_literal: true

module Candid
  module FeeSchedules
    module V3
      module Types
        # A comprehensive rate including the current rate value and all values for historic time ranges. The time ranges specified by each RateEntry are disjoint.  A rate must always have at least one entry.
        class Rate < Internal::Types::Model
          field :rate_id, -> { String }, optional: false, nullable: false
          field :dimensions, -> { Candid::FeeSchedules::V3::Types::Dimensions }, optional: false, nullable: false
          field :version, -> { Integer }, optional: false, nullable: false
          field :updated_at, -> { String }, optional: false, nullable: false
          field :updated_by, -> { String }, optional: false, nullable: false
          field :entries, lambda {
            Internal::Types::Array[Candid::FeeSchedules::V3::Types::RateEntry]
          }, optional: false, nullable: false
        end
      end
    end
  end
end
