# frozen_string_literal: true

module Candid
  module ExpectedNetworkStatus
    module V2
      module Types
        class InNetworkRenderingProvidersDetail < Internal::Types::Model
          field :rendering_providers, -> { Internal::Types::Array[String] }, optional: false, nullable: false
          field :routed_payer_uuid, -> { String }, optional: false, nullable: false
          field :routed_billing_provider_id, -> { String }, optional: false, nullable: false

        end
      end
    end
  end
end
