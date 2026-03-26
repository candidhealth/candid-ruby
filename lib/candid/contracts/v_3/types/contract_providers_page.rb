# frozen_string_literal: true

module Candid
  module Contracts
    module V3
      module Types
        class ContractProvidersPage < Internal::Types::Model
          field :items, -> { Internal::Types::Array[Candid::OrganizationProviders::V2::Types::OrganizationProvider] }, optional: false, nullable: false
        end
      end
    end
  end
end
