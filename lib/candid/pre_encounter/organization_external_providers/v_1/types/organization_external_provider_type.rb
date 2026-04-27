# frozen_string_literal: true

module Candid
  module PreEncounter
    module OrganizationExternalProviders
      module V1
        module Types
          module OrganizationExternalProviderType
            extend Candid::Internal::Types::Enum

            REFERRING = "REFERRING"
            PRIMARY = "PRIMARY"
            TREATING = "TREATING"
          end
        end
      end
    end
  end
end
