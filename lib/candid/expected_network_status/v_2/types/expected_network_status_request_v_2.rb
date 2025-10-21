# frozen_string_literal: true

module Candid
  module ExpectedNetworkStatus
    module V2
      module Types
        class ExpectedNetworkStatusRequestV2 < Internal::Types::Model
          field :service_type, -> { Candid::ExpectedNetworkStatus::V2::Types::ServiceType }, optional: false, nullable: false
          field :place_of_service_code, -> { Candid::Commons::Types::FacilityTypeCode }, optional: false, nullable: false
          field :subscriber_information, -> { Candid::ExpectedNetworkStatus::V2::Types::ExpectedNetworkStatusSubscriberInformation }, optional: false, nullable: false
          field :patient_address, -> { Candid::Commons::Types::StreetAddressShortZip }, optional: false, nullable: false
          field :billing_provider_id, -> { String }, optional: false, nullable: false
          field :organization_service_facility_id, -> { String }, optional: false, nullable: false
          field :date_of_service, -> { String }, optional: false, nullable: false

        end
      end
    end
  end
end
