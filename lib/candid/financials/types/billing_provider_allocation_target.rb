# frozen_string_literal: true

module Candid
  module Financials
    module Types
      class BillingProviderAllocationTarget < Internal::Types::Model
        field :billing_provider_id, -> { String }, optional: false, nullable: false

      end
    end
  end
end
