# frozen_string_literal: true

module Candid
  module ExpectedNetworkStatus
    module V2
      module Types
        class ExpectedNetworkStatusV2 < Internal::Types::Model
          extend Candid::Internal::Types::Union

          discriminant :type

          member -> { Candid::ExpectedNetworkStatus::V2::Types::InNetworkStatus }, key: "IN_NETWORK"
          member -> { Candid::ExpectedNetworkStatus::V2::Types::OutOfNetworkStatus }, key: "OUT_OF_NETWORK"
          member -> { Candid::ExpectedNetworkStatus::V2::Types::IndeterminateNetworkStatus }, key: "INDETERMINATE"
        end
      end
    end
  end
end
