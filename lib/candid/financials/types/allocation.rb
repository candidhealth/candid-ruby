# frozen_string_literal: true

module Candid
  module Financials
    module Types
      class Allocation < Internal::Types::Model
        field :amount_cents, -> { Integer }, optional: false, nullable: false
        field :target, -> { Candid::Financials::Types::AllocationTarget }, optional: false, nullable: false

      end
    end
  end
end
