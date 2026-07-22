# frozen_string_literal: true

module Candid
  module Financials
    module Types
      # Constrains which claims a payment's credit can be auto-allocated to. Restrictions of the same
      # restriction_type are OR'd together (any value may match); different restriction_types are AND'd
      # (every type present must match). A payment with no restrictions can be allocated to any claim.
      class AllocationRestrictionCreate < Internal::Types::Model
        field :restriction_type, -> { Candid::Financials::Types::AllocationRestrictionType }, optional: false, nullable: false
        field :restriction_value, -> { String }, optional: false, nullable: false
      end
    end
  end
end
