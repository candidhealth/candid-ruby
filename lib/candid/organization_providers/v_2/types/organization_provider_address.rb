# frozen_string_literal: true

module Candid
  module OrganizationProviders
    module V2
      module Types
        class OrganizationProviderAddress < Internal::Types::Model
          field :address, -> { Candid::Commons::Types::StreetAddressLongZip }, optional: false, nullable: false
          field :address_type, -> { Candid::OrganizationProviders::V2::Types::AddressType }, optional: false, nullable: false

        end
      end
    end
  end
end
