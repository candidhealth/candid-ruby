# frozen_string_literal: true

module Candid
  module OrganizationProviders
    module V3
      module Types
        class OrganizationProviderPageV2 < Internal::Types::Model
          field :items, -> { Internal::Types::Array[Candid::OrganizationProviders::V3::Types::OrganizationProviderV2] }, optional: false, nullable: false

        end
      end
    end
  end
end
