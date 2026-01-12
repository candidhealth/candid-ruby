# frozen_string_literal: true

module Candid
  module Financials
    module Types
      # CURRENTLY UNIMPLEMENTED - Defines how a patient prepayment allocation should be earmarked for future auto-allocation.
      # When implemented, earmarks will hold the allocation until a matching encounter is created, then attempt to allocate to that encounter.
      # Only applicable for unattributed allocations.
      class AllocationEarmarkType < Internal::Types::Model
        extend Candid::Internal::Types::Union

        discriminant :type

        member -> { String }, key: "DATE_OF_SERVICE"
        member -> { String }, key: "EXTERNAL_ENCOUNTER_ID"
      end
    end
  end
end
