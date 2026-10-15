# frozen_string_literal: true

module Candid
  module FeeSchedules
    module V3
      module Types
        class BatchMatchResult < Internal::Types::Model
          field :point, -> { Candid::FeeSchedules::V3::Types::BatchMatchPoint }, optional: false, nullable: false
          field :match, -> { Candid::FeeSchedules::V3::Types::MatchedRate }, optional: true, nullable: false
        end
      end
    end
  end
end
