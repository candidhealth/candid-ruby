# frozen_string_literal: true

module Candid
  module FeeSchedules
    module V3
      module Types
        class MatchResult < Internal::Types::Model
          field :threshold, -> { Candid::FeeSchedules::V3::Types::ThresholdMatch }, optional: false, nullable: false
          field :rate_id, -> { String }, optional: false, nullable: false

        end
      end
    end
  end
end
