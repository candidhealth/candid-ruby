# frozen_string_literal: true

module Candid
  module OrganizationProviders
    module V2
      module Types
        module OrganizationProviderSortOptions
          extend Candid::Internal::Types::Enum
          PROVIDER_NAME_ASC = "provider_name:asc"
          PROVIDER_NAME_DESC = "provider_name:desc"
          NPI_ASC = "npi:asc"
          NPI_DESC = "npi:desc"end
      end
    end
  end
end
