# frozen_string_literal: true

module Candid
  module PreEncounter
    module OrganizationExternalProviders
      module V1
        module Types
          class OrganizationExternalProviderPage < Internal::Types::Model
            field :items, -> { Internal::Types::Array[Candid::PreEncounter::OrganizationExternalProviders::V1::Types::OrganizationExternalProvider] }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
