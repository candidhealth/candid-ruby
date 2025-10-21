# frozen_string_literal: true

module Candid
  module Financials
    module Types
      # Allocation targets describe whether the portion of a payment is being applied toward a specific service line,
      # claim, billing provider, or is unallocated.
      class AllocationTarget < Internal::Types::Model
        extend Candid::Internal::Types::Union

        discriminant :type

        member -> { Candid::Financials::Types::ServiceLineAllocationTarget }, key: "SERVICE_LINE"
        member -> { Candid::Financials::Types::ClaimAllocationTarget }, key: "CLAIM"
        member -> { Candid::Financials::Types::BillingProviderAllocationTarget }, key: "BILLING_PROVIDER_ID"
        member -> { Candid::Financials::Types::AppointmentAllocationTarget }, key: "APPOINTMENT"
        member -> { Object }, key: "UNATTRIBUTED"
      end
    end
  end
end
