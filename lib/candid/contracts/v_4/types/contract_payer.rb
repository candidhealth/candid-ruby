# frozen_string_literal: true

module Candid
  module Contracts
    module V4
      module Types
        # The payer under contract. Either an EDI payer or a payer group.
        class ContractPayer < Internal::Types::Model
          extend Candid::Internal::Types::Union

          discriminant :type

          member -> { Candid::Payers::V4::Types::Payer }, key: "PAYER"
          member -> { Candid::PayerGroups::V1::Types::PayerGroup }, key: "PAYER_GROUP"
        end
      end
    end
  end
end
