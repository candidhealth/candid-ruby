# frozen_string_literal: true

module Candid
  module PreEncounter
    module OrganizationExternalProviders
      module V1
        module Types
          class OrganizationExternalProviderGetMultiRequest < Internal::Types::Model
            field :limit, -> { Integer }, optional: true, nullable: false
            field :page_token, -> { String }, optional: true, nullable: false
            field :sort_field, -> { String }, optional: true, nullable: false
            field :sort_direction, -> { Candid::PreEncounter::Common::Types::SortDirection }, optional: true, nullable: false
            field :npi, -> { String }, optional: true, nullable: false
            field :type, -> { Candid::PreEncounter::OrganizationExternalProviders::V1::Types::OrganizationExternalProviderType }, optional: true, nullable: false
            field :first_name, -> { String }, optional: true, nullable: false
            field :last_name, -> { String }, optional: true, nullable: false
          end
        end
      end
    end
  end
end
