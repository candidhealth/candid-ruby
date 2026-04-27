# frozen_string_literal: true

module Candid
  module Contracts
    module V3
      module Types
        class ContractProviderCredentialingPage < Internal::Types::Model
          field :items, -> { Internal::Types::Array[Candid::Contracts::V3::Types::ContractProviderCredentialing] }, optional: false, nullable: false
        end
      end
    end
  end
end
