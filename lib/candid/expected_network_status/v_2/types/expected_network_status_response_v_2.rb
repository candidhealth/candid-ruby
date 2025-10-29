# frozen_string_literal: true

module Candid
  module ExpectedNetworkStatus
    module V2
      module Types
        class ExpectedNetworkStatusResponseV2 < Internal::Types::Model
          field :network_status_check_id, -> { String }, optional: false, nullable: false
          field :network_status, lambda {
            Candid::ExpectedNetworkStatus::V2::Types::ExpectedNetworkStatusV2
          }, optional: false, nullable: false
        end
      end
    end
  end
end
