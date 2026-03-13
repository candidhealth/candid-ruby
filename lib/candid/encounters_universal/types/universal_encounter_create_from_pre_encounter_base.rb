# frozen_string_literal: true

module Candid
  module EncountersUniversal
    module Types
      class UniversalEncounterCreateFromPreEncounterBase < Internal::Types::Model
        field :pre_encounter_patient_id, -> { String }, optional: false, nullable: false
        field :pre_encounter_appointment_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false
        field :billing_provider, -> { Candid::EncounterProviders::V2::Types::BillingProvider }, optional: false, nullable: false
        field :initial_referring_provider, -> { Candid::EncounterProviders::V2::Types::InitialReferringProvider }, optional: true, nullable: false
        field :supervising_provider, -> { Candid::EncounterProviders::V2::Types::SupervisingProvider }, optional: true, nullable: false
        field :service_facility, -> { Candid::ServiceFacility::Types::EncounterServiceFacilityBase }, optional: true, nullable: false
        field :clinical_notes, -> { Internal::Types::Array[Candid::Encounters::V4::Types::ClinicalNoteCategoryCreate] }, optional: true, nullable: false
        field :billing_notes, -> { Internal::Types::Array[Candid::BillingNotes::V2::Types::BillingNoteBase] }, optional: true, nullable: false
        field :patient_histories, -> { Internal::Types::Array[Candid::Encounters::V4::Types::PatientHistoryCategory] }, optional: true, nullable: false
        field :external_claim_submission, -> { Candid::ClaimSubmission::V1::Types::ExternalClaimSubmissionCreate }, optional: true, nullable: false
        field :tag_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false
        field :schema_instances, -> { Internal::Types::Array[Candid::CustomSchemas::V1::Types::SchemaInstance] }, optional: true, nullable: false
        field :related_causes_information, -> { Candid::RelatedCauses::V1::Types::RelatedCausesInformationCreate }, optional: true, nullable: false
        field :property_casualty_claim_number, -> { String }, optional: true, nullable: false
        field :accident_date, -> { String }, optional: true, nullable: false
        field :property_casualty_patient_identifier, -> { Candid::PropertyAndCasualty::V1::Types::PropertyCasualtyPatientIdentifierCreate }, optional: true, nullable: false
      end
    end
  end
end
