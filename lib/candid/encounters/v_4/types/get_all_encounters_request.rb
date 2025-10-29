# frozen_string_literal: true

module Candid
  module Encounters
    module V4
      module Types
        class GetAllEncountersRequest < Internal::Types::Model
          field :limit, -> { Integer }, optional: true, nullable: false
          field :claim_status, -> { Candid::Claims::Types::ClaimStatus }, optional: true, nullable: false
          field :sort, -> { Candid::Encounters::V4::Types::EncounterSortOptions }, optional: true, nullable: false
          field :page_token, -> { String }, optional: true, nullable: false
          field :date_of_service_min, -> { String }, optional: true, nullable: false
          field :date_of_service_max, -> { String }, optional: true, nullable: false
          field :primary_payer_names, -> { String }, optional: true, nullable: false
          field :search_term, -> { String }, optional: true, nullable: false
          field :external_id, -> { String }, optional: true, nullable: false
          field :diagnoses_updated_since, -> { String }, optional: true, nullable: false
          field :tag_ids, -> { String }, optional: true, nullable: false
          field :work_queue_id, -> { String }, optional: true, nullable: false
          field :billable_status, lambda {
            Candid::Encounters::V4::Types::BillableStatusType
          }, optional: true, nullable: false
          field :responsible_party, lambda {
            Candid::Encounters::V4::Types::ResponsiblePartyType
          }, optional: true, nullable: false
          field :owner_of_next_action, lambda {
            Candid::Encounters::V4::Types::EncounterOwnerOfNextActionType
          }, optional: true, nullable: false
          field :patient_external_id, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
