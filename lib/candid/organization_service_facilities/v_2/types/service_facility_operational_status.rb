# frozen_string_literal: true

module Candid
  module OrganizationServiceFacilities
    module V2
      module Types
        module ServiceFacilityOperationalStatus
          extend Candid::Internal::Types::Enum

          CLOSED = "C"
          HOUSEKEEPING = "H"
          ISOLATED = "I"
          CONTAMINATED = "K"
          OCCUPIED = "O"
          UNOCCUPIED = "U"
        end
      end
    end
  end
end
