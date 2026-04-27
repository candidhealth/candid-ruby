# frozen_string_literal: true

module Candid
  module PreEncounter
    module OrganizationExternalProviders
      module V1
        module Types
          # An OrganizationExternalProvider object with immutable server-owned properties.
          class OrganizationExternalProvider < Internal::Types::Model
            field :id, -> { String }, optional: false, nullable: false
          end
        end
      end
    end
  end
end
