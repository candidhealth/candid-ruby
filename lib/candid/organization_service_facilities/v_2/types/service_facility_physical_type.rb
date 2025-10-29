# frozen_string_literal: true

module Candid
  module OrganizationServiceFacilities
    module V2
      module Types
        module ServiceFacilityPhysicalType
          extend Candid::Internal::Types::Enum

          SITE = "si"
          BUILDING = "bu"
          WING = "wi"
          WARD = "wa"
          LEVEL = "lvl"
          CORRIDOR = "co"
          ROOM = "ro"
          BED = "bd"
          VEHICLE = "ve"
          HOUSE = "ho"
          CABINET = "ca"
          ROAD = "rd"
          AREA = "area"
          JURISDICTION = "jdn"
        end
      end
    end
  end
end
