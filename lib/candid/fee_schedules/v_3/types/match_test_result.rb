# frozen_string_literal: true

module Candid
  module FeeSchedules
    module V3
      module Types
        class MatchTestResult < Internal::Types::Model
          field :dimensions, -> { Candid::FeeSchedules::V3::Types::DimensionMatch }, optional: false, nullable: false
          field :threshold, -> { Candid::FeeSchedules::V3::Types::ThresholdMatch }, optional: false, nullable: false

        end
      end
    end
  end
end
