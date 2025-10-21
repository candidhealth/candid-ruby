# frozen_string_literal: true

module Candid
  module FeeSchedules
    module V3
      module Types
        module DimensionName
          extend Candid::Internal::Types::Enum
          PAYER_UUID = "payer_uuid"
          ORGANIZATION_BILLING_PROVIDER_ID = "organization_billing_provider_id"
          CPT_CODE = "cpt_code"end
      end
    end
  end
end
