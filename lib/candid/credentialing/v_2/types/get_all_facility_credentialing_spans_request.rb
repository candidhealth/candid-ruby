
module Candid
  module Credentialing
    module V2
      module Types
        class GetAllFacilityCredentialingSpansRequest < Internal::Types::Model
          field :limit, -> { Integer }, optional: true, nullable: false
          field :page_token, -> { String }, optional: true, nullable: false
          field :payer_uuid, -> { String }, optional: true, nullable: false
          field :contracting_provider_id, -> { String }, optional: true, nullable: false
          field :service_facility_id, -> { String }, optional: true, nullable: false

        end
      end
    end
  end
end
