# frozen_string_literal: true

module Candid
  module ExpectedNetworkStatus
    module V2
      module Types
        class IndeterminateNetworkStatus < Internal::Types::Model
          field :error, -> { String }, optional: false, nullable: false
          field :explanation, lambda {
            Candid::ExpectedNetworkStatus::V2::Types::Explanation
          }, optional: false, nullable: false
          field :routed_payer_uuid, -> { String }, optional: true, nullable: false
          field :routed_billing_provider_id, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
