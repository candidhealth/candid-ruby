# frozen_string_literal: true

module Candid
  module Credentialing
    module V2
      module Types
        class FacilityCredentialingSpanPage < Internal::Types::Model
          field :items, lambda {
            Internal::Types::Array[Candid::Credentialing::V2::Types::FacilityCredentialingSpan]
          }, optional: false, nullable: false
        end
      end
    end
  end
end
