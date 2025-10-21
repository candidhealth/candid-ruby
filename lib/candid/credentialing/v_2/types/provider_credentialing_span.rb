# frozen_string_literal: true

module Candid
  module Credentialing
    module V2
      module Types
        class ProviderCredentialingSpan < Internal::Types::Model
          field :provider_credentialing_span_id, -> { String }, optional: false, nullable: false
          field :rendering_provider, -> { Candid::OrganizationProviders::V3::Types::OrganizationProviderV2 }, optional: false, nullable: false
          field :regions, -> { Candid::Commons::Types::Regions }, optional: false, nullable: false
          field :medallion_payer_enrollment_id, -> { String }, optional: true, nullable: false
          field :source, -> { String }, optional: false, nullable: false

        end
      end
    end
  end
end
