# frozen_string_literal: true

module Candid
  module Credentialing
    module V2
      module Types
        class ProviderCredentialingSpanPage < Internal::Types::Model
          field :items, lambda {
            Internal::Types::Array[Candid::Credentialing::V2::Types::ProviderCredentialingSpan]
          }, optional: false, nullable: false
        end
      end
    end
  end
end
