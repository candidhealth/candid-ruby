
module Candid
  module ChargeCaptureBundles
    module V1
      module Types
        class GetAllChargeCaptureClaimCreationsRequest < Internal::Types::Model
          field :limit, -> { Integer }, optional: true, nullable: false
          field :sort, -> { Candid::ChargeCaptureBundles::V1::Types::ChargeCaptureClaimCreationSortField }, optional: true, nullable: false
          field :sort_direction, -> { Candid::Commons::Types::SortDirection }, optional: true, nullable: false
          field :page_token, -> { String }, optional: true, nullable: false
          field :patient_external_id, -> { String }, optional: true, nullable: false
          field :claim_creation_status, -> { Candid::ChargeCaptureBundles::V1::Types::ChargeCaptureClaimCreationStatus }, optional: true, nullable: false
          field :charge_status, -> { Candid::ChargeCapture::V1::Types::ChargeCaptureStatus }, optional: true, nullable: false
          field :charge_external_id, -> { String }, optional: true, nullable: false
          field :date_of_service_min, -> { String }, optional: true, nullable: false
          field :date_of_service_max, -> { String }, optional: true, nullable: false
          field :claim_ids, -> { String }, optional: true, nullable: false
          field :claim_creation_ids, -> { String }, optional: true, nullable: false
          field :billing_provider_npis, -> { String }, optional: true, nullable: false
          field :service_facility_name, -> { String }, optional: true, nullable: false
          field :primary_payer_ids, -> { String }, optional: true, nullable: false
          field :rendering_provider_npis, -> { String }, optional: true, nullable: false
          field :rendering_provider_names, -> { String }, optional: true, nullable: false
          field :supervising_provider_npis, -> { String }, optional: true, nullable: false
          field :supervising_provider_names, -> { String }, optional: true, nullable: false
          field :claim_status, -> { Candid::Claims::Types::ClaimStatus }, optional: true, nullable: false
          field :claim_creation_category, -> { String }, optional: true, nullable: false
          field :tags, -> { String }, optional: true, nullable: false
          field :primary_payer_names, -> { String }, optional: true, nullable: false
          field :patient_names, -> { String }, optional: true, nullable: false
          field :has_charge_capture_updates, -> { Internal::Types::Boolean }, optional: true, nullable: false

        end
      end
    end
  end
end
