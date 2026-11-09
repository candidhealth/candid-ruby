# frozen_string_literal: true

module Candid
  module Credentialing
    module V3
      module Types
        class ProviderCredentialingSpanPage < Internal::Types::Model
          field :items, -> { Internal::Types::Array[Candid::Credentialing::V3::Types::ProviderCredentialingSpan] }, optional: false, nullable: false
        end
      end
    end
  end
end
