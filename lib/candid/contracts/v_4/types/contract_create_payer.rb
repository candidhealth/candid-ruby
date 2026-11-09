# frozen_string_literal: true

module Candid
  module Contracts
    module V4
      module Types
        # Identifies the payer under contract. Provide either a payer_uuid (an EDI payer) or a payer_group_id.
        class ContractCreatePayer < Internal::Types::Model
          extend Candid::Internal::Types::Union

          discriminant :type

          member -> { String }, key: "PAYER_UUID"
          member -> { String }, key: "PAYER_GROUP_ID"
        end
      end
    end
  end
end
