# frozen_string_literal: true

module CandidApiClient
  module OrganizationServiceFacilities
    module V2
      module Types
        class ServiceFacilityOperationalStatus
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
