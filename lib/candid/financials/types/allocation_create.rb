# frozen_string_literal: true

module Candid
  module Financials
    module Types
      # Allocations are portions of payments that are applied to specific resources, known as targets. Each allocation has
      # and amount, defined in cents, and a target.
      class AllocationCreate < Internal::Types::Model
        field :amount_cents, -> { Integer }, optional: false, nullable: false
        field :target, -> { Candid::Financials::Types::AllocationTargetCreate }, optional: false, nullable: false

      end
    end
  end
end
