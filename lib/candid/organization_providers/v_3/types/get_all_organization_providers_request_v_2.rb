
module Candid
  module OrganizationProviders
    module V3
      module Types
        class GetAllOrganizationProvidersRequestV2 < Internal::Types::Model
          field :limit, -> { Integer }, optional: true, nullable: false
          field :search_term, -> { String }, optional: true, nullable: false
          field :npi, -> { String }, optional: true, nullable: false
          field :is_rendering, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :is_billing, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :organization_provider_ids, -> { String }, optional: true, nullable: false
          field :page_token, -> { String }, optional: true, nullable: false
          field :sort, -> { Candid::OrganizationProviders::V2::Types::OrganizationProviderSortOptions }, optional: true, nullable: false

        end
      end
    end
  end
end
