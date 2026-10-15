# frozen_string_literal: true

module Candid
  module FeeSchedules
    module V3
      module Types
        # A rate that matched a dimension point, with the entry in effect on the point's date of service.
        class MatchedRate < Internal::Types::Model
          field :matched_entry, -> { Candid::FeeSchedules::V3::Types::RateEntry }, optional: false, nullable: false
          field :total_cents, -> { Integer }, optional: false, nullable: false
        end
      end
    end
  end
end
