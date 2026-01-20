# frozen_string_literal: true

module Candid
  module Financials
    module Types
      # Represents an active balance earmarking record that holds allocated funds for future auto-allocation.
      # Earmarks are created when funds are allocated but should be held for a specific encounter or date of service.
      # Only active (non-deleted) earmarks are returned.
      class BalanceEarmark < Internal::Types::Model
        field :id, -> { String }, optional: false, nullable: false
        field :target, -> { Candid::Financials::Types::AllocationEarmarkType }, optional: false, nullable: false
      end
    end
  end
end
