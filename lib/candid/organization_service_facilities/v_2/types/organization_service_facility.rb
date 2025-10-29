# frozen_string_literal: true

module Candid
  module OrganizationServiceFacilities
    module V2
      module Types
        class OrganizationServiceFacility < Internal::Types::Model
          field :organization_service_facility_id, -> { String }, optional: false, nullable: false
          field :name, -> { String }, optional: false, nullable: false
          field :aliases, -> { Internal::Types::Array[String] }, optional: false, nullable: false
          field :description, -> { String }, optional: true, nullable: false
          field :external_id, -> { String }, optional: true, nullable: false
          field :npi, -> { String }, optional: true, nullable: false
          field :place_of_service_code, -> { Candid::Commons::Types::FacilityTypeCode }, optional: true, nullable: false
          field :clia_number, -> { String }, optional: true, nullable: false
          field :status, lambda {
            Candid::OrganizationServiceFacilities::V2::Types::ServiceFacilityStatus
          }, optional: true, nullable: false
          field :operational_status, lambda {
            Candid::OrganizationServiceFacilities::V2::Types::ServiceFacilityOperationalStatus
          }, optional: true, nullable: false
          field :mode, lambda {
            Candid::OrganizationServiceFacilities::V2::Types::ServiceFacilityMode
          }, optional: true, nullable: false
          field :type, lambda {
            Candid::OrganizationServiceFacilities::V2::Types::ServiceFacilityType
          }, optional: true, nullable: false
          field :physical_type, lambda {
            Candid::OrganizationServiceFacilities::V2::Types::ServiceFacilityPhysicalType
          }, optional: true, nullable: false
          field :telecoms, -> { Internal::Types::Array[String] }, optional: false, nullable: false
          field :address, -> { Candid::Commons::Types::StreetAddressLongZip }, optional: false, nullable: false
        end
      end
    end
  end
end
