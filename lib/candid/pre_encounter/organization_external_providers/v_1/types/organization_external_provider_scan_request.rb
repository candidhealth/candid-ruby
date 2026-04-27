# frozen_string_literal: true

module Candid
  module PreEncounter
    module OrganizationExternalProviders
      module V1
        module Types
          class OrganizationExternalProviderScanRequest < Internal::Types::Model
            field :since, -> { String }, optional: false, nullable: false
            field :max_results, -> { Integer }, optional: true, nullable: false, api_name: "maxResults"
          end
        end
      end
    end
  end
end
