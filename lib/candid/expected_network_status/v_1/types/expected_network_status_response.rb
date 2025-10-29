# frozen_string_literal: true

module Candid
  module ExpectedNetworkStatus
    module V1
      module Types
        class ExpectedNetworkStatusResponse < Internal::Types::Model
          field :expected_network_status, lambda {
            Candid::ExpectedNetworkStatus::V1::Types::ExpectedNetworkStatus
          }, optional: false, nullable: false
          field :explanation, -> { String }, optional: false, nullable: false
          field :contract_id, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
