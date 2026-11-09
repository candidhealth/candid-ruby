# frozen_string_literal: true

module Candid
  module Credentialing
    module V3
      module Types
        class FacilityCredentialingSpanPage < Internal::Types::Model
          field :items, -> { Internal::Types::Array[Candid::Credentialing::V3::Types::FacilityCredentialingSpan] }, optional: false, nullable: false
        end
      end
    end
  end
end
