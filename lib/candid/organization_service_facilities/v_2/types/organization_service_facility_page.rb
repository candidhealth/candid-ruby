# frozen_string_literal: true

module Candid
  module OrganizationServiceFacilities
    module V2
      module Types
        class OrganizationServiceFacilityPage < Internal::Types::Model
          field :items, -> { Internal::Types::Array[Candid::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacility] }, optional: false, nullable: false

        end
      end
    end
  end
end
