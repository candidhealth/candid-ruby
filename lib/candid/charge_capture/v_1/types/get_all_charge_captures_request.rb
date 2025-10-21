
module Candid
  module ChargeCapture
    module V1
      module Types
        class GetAllChargeCapturesRequest < Internal::Types::Model
          field :limit, -> { Integer }, optional: true, nullable: false
          field :sort, -> { Candid::ChargeCapture::V1::Types::ChargeCaptureSortField }, optional: true, nullable: false
          field :sort_direction, -> { Candid::Commons::Types::SortDirection }, optional: true, nullable: false
          field :page_token, -> { String }, optional: true, nullable: false
          field :patient_external_id, -> { String }, optional: true, nullable: false
          field :status, -> { Candid::ChargeCapture::V1::Types::ChargeCaptureStatus }, optional: true, nullable: false
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
          field :claim_creation_category, -> { String }, optional: true, nullable: false
          field :tags, -> { String }, optional: true, nullable: false
          field :primary_payer_names, -> { String }, optional: true, nullable: false
          field :patient_names, -> { String }, optional: true, nullable: false
          field :exclude_charges_linked_to_claims, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :patient_external_id_ranked_sort, -> { String }, optional: true, nullable: false
          field :status_ranked_sort, -> { Candid::ChargeCapture::V1::Types::ChargeCaptureStatus }, optional: true, nullable: false
          field :charge_external_id_ranked_sort, -> { String }, optional: true, nullable: false
          field :date_of_service_min_ranked_sort, -> { String }, optional: true, nullable: false
          field :date_of_service_max_ranked_sort, -> { String }, optional: true, nullable: false
          field :search_term, -> { String }, optional: true, nullable: false
          field :billable_status, -> { Candid::Encounters::V4::Types::BillableStatusType }, optional: true, nullable: false
          field :responsible_party, -> { Candid::Encounters::V4::Types::ResponsiblePartyType }, optional: true, nullable: false
          field :claim_ids_ranked_sort, -> { String }, optional: true, nullable: false
          field :claim_creation_ids_ranked_sort, -> { String }, optional: true, nullable: false
          field :billing_provider_npis_ranked_sort, -> { String }, optional: true, nullable: false
          field :service_facility_name_ranked_sort, -> { String }, optional: true, nullable: false
          field :primary_payer_ids_ranked_sort, -> { String }, optional: true, nullable: false
          field :rendering_provider_npis_ranked_sort, -> { String }, optional: true, nullable: false
          field :rendering_provider_names_ranked_sort, -> { String }, optional: true, nullable: false
          field :supervising_provider_npis_ranked_sort, -> { String }, optional: true, nullable: false
          field :supervising_provider_names_ranked_sort, -> { String }, optional: true, nullable: false
          field :claim_status, -> { Candid::Claims::Types::ClaimStatus }, optional: true, nullable: false
          field :claim_creation_category_ranked_sort, -> { String }, optional: true, nullable: false
          field :tags_ranked_sort, -> { String }, optional: true, nullable: false
          field :primary_payer_names_ranked_sort, -> { String }, optional: true, nullable: false
          field :patient_names_ranked_sort, -> { String }, optional: true, nullable: false

        end
      end
    end
  end
end
