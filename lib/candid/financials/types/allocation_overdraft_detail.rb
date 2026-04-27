# frozen_string_literal: true

module Candid
  module Financials
    module Types
      # Structured information about an allocation that would be overdrafted.
      # Provides entity-specific details to display in a table format.
      class AllocationOverdraftDetail < Internal::Types::Model
        field :allocation_target, -> { Candid::Financials::Types::AllocationTarget }, optional: false, nullable: false
        field :patient_paid_amount_cents, -> { Integer }, optional: false, nullable: false
        field :current_balance_cents, -> { Integer }, optional: false, nullable: false
        field :overage_amount_cents, -> { Integer }, optional: false, nullable: false
        field :error_message, -> { String }, optional: false, nullable: false
      end
    end
  end
end
