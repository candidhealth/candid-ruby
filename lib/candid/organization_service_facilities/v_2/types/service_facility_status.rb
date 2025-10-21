# frozen_string_literal: true

module Candid
  module OrganizationServiceFacilities
    module V2
      module Types
        module ServiceFacilityStatus
          extend Candid::Internal::Types::Enum
          ACTIVE = "active"
          INACTIVE = "inactive"
          SUSPENDED = "suspended"end
      end
    end
  end
end
