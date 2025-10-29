# frozen_string_literal: true

module Candid
  module ExpectedNetworkStatus
    module V2
      module Types
        class ComputeAllInNetworkProvidersResponse < Internal::Types::Model
          field :computed_network_status, lambda {
            Candid::ExpectedNetworkStatus::V2::Types::ComputeAllInNetworkRenderingProvidersResult
          }, optional: false, nullable: false
          field :network_status_check_id, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
