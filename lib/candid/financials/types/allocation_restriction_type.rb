# frozen_string_literal: true

module Candid
  module Financials
    module Types
      module AllocationRestrictionType
        extend Candid::Internal::Types::Enum

        BILLING_PROVIDER_NPI = "billing_provider_npi"
        SERVICE_FACILITY_ID = "service_facility_id"
      end
    end
  end
end
