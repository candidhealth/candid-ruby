# frozen_string_literal: true

module Candid
  module OrganizationServiceFacilities
    module V2
      module Types
        class GetAllOrganizationServiceFacilitiesRequest < Internal::Types::Model
          field :limit, -> { Integer }, optional: true, nullable: false
          field :name, -> { String }, optional: true, nullable: false
          field :organization_service_facility_ids, -> { String }, optional: true, nullable: false
          field :external_ids, -> { String }, optional: true, nullable: false
          field :place_of_service_code, -> { Candid::Commons::Types::FacilityTypeCode }, optional: true, nullable: false
          field :page_token, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
