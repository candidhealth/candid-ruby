# frozen_string_literal: true

module Candid
  module Contracts
    module V2
      module Types
        module ContractSortField
          extend Candid::Internal::Types::Enum

          CREATED_AT = "created_at"
          PAYER_NAME = "payer_name"
          PAYER_ID = "payer_id"
          BILLING_PROVIDER_NAME = "billing_provider_name"
          EFFECTIVE_DATE = "effective_date"
          CONTRACT_STATUS = "contract_status"
        end
      end
    end
  end
end
