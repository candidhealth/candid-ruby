# frozen_string_literal: true

module Candid
  module Credentialing
    module V2
      module Types
        class FacilityCredentialingSpan < Internal::Types::Model
          field :facility_credentialing_span_id, -> { String }, optional: false, nullable: false
          field :service_facility, lambda {
            Candid::OrganizationServiceFacilities::V2::Types::OrganizationServiceFacility
          }, optional: false, nullable: false
        end
      end
    end
  end
end
