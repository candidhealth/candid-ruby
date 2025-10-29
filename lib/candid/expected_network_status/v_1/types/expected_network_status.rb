# frozen_string_literal: true

module Candid
  module ExpectedNetworkStatus
    module V1
      module Types
        module ExpectedNetworkStatus
          extend Candid::Internal::Types::Enum

          IN_NETWORK = "in_network"
          OUT_OF_NETWORK = "out_of_network"
          UNKNOWN = "unknown"
        end
      end
    end
  end
end
