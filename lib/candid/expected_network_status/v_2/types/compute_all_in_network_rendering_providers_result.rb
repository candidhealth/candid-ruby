# frozen_string_literal: true

module Candid
  module ExpectedNetworkStatus
    module V2
      module Types
        class ComputeAllInNetworkRenderingProvidersResult < Internal::Types::Model
          extend Candid::Internal::Types::Union

          discriminant :type

          member -> { Candid::ExpectedNetworkStatus::V2::Types::InNetworkRenderingProvidersDetail }, key: "RENDERING_PROVIDERS"
          member -> { Candid::ExpectedNetworkStatus::V2::Types::IndeterminateNetworkStatus }, key: "INDETERMINATE"
          member -> { Candid::ExpectedNetworkStatus::V2::Types::OutOfNetworkStatus }, key: "OUT_OF_NETWORK"
        end
      end
    end
  end
end
