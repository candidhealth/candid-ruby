# frozen_string_literal: true

module Candid
  module Contracts
    module V4
      module Types
        class ContractUnion < Internal::Types::Model
          extend Candid::Internal::Types::Union

          discriminant :type

          member -> { Candid::Contracts::V4::Types::Contract }, key: "PROFESSIONAL"
          member -> { Candid::Contracts::V4::Types::Contract }, key: "INSTITUTIONAL"
        end
      end
    end
  end
end
