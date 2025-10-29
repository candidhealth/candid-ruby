# frozen_string_literal: true

module Candid
  module FeeSchedules
    module V3
      module Types
        # Match information for rendering provider license type
        class MatchLicenseType < Internal::Types::Model
          field :value, -> { Candid::OrganizationProviders::V2::Types::LicenseType }, optional: true, nullable: false
          field :match, -> { Internal::Types::Boolean }, optional: false, nullable: false
          field :explanation, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
