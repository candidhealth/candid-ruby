# frozen_string_literal: true

module Candid
  module Contracts
    module V3
      module Types
        # A rendering provider with their credentialing spans scoped to the contract's contracting provider and payer.
        class ContractProviderCredentialing < Internal::Types::Model
          field :provider, -> { Candid::OrganizationProviders::V2::Types::OrganizationProvider }, optional: false, nullable: false
          field :credentialing_spans, -> { Internal::Types::Array[Candid::Credentialing::V2::Types::ProviderCredentialingSpan] }, optional: false, nullable: false
        end
      end
    end
  end
end
