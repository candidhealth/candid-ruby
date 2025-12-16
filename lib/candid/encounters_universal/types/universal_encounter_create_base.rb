# frozen_string_literal: true

module Candid
  module EncountersUniversal
    module Types
      class UniversalEncounterCreateBase < Internal::Types::Model
        field :patient, -> { Candid::Individual::Types::PatientCreate }, optional: false, nullable: false
        field :referring_provider, lambda {
          Candid::EncounterProviders::V2::Types::ReferringProvider
        }, optional: true, nullable: false
        field :initial_referring_provider, lambda {
          Candid::EncounterProviders::V2::Types::InitialReferringProvider
        }, optional: true, nullable: false
        field :supervising_provider, lambda {
          Candid::EncounterProviders::V2::Types::SupervisingProvider
        }, optional: true, nullable: false
        field :service_facility, lambda {
          Candid::ServiceFacility::Types::EncounterServiceFacilityBase
        }, optional: true, nullable: false
        field :subscriber_primary, -> { Candid::Individual::Types::SubscriberCreate }, optional: true, nullable: false
        field :subscriber_secondary, -> { Candid::Individual::Types::SubscriberCreate }, optional: true, nullable: false
        field :subscriber_tertiary, -> { Candid::Individual::Types::SubscriberCreate }, optional: true, nullable: false
        field :prior_authorization_number, -> { String }, optional: true, nullable: false
        field :responsible_party, lambda {
          Candid::Encounters::V4::Types::ResponsiblePartyType
        }, optional: false, nullable: false
        field :clinical_notes, lambda {
          Internal::Types::Array[Candid::Encounters::V4::Types::ClinicalNoteCategoryCreate]
        }, optional: true, nullable: false
        field :billing_notes, lambda {
          Internal::Types::Array[Candid::BillingNotes::V2::Types::BillingNoteBase]
        }, optional: true, nullable: false
        field :patient_histories, lambda {
          Internal::Types::Array[Candid::Encounters::V4::Types::PatientHistoryCategory]
        }, optional: true, nullable: false
        field :guarantor, -> { Candid::Guarantor::V1::Types::GuarantorCreate }, optional: true, nullable: false
        field :external_claim_submission, lambda {
          Candid::ClaimSubmission::V1::Types::ExternalClaimSubmissionCreate
        }, optional: true, nullable: false
        field :tag_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false
        field :schema_instances, lambda {
          Internal::Types::Array[Candid::CustomSchemas::V1::Types::SchemaInstance]
        }, optional: true, nullable: false
        field :referral_number, -> { String }, optional: true, nullable: false
        field :epsdt_referral, -> { Candid::Encounters::V4::Types::EpsdtReferral }, optional: true, nullable: false
        field :claim_supplemental_information, lambda {
          Internal::Types::Array[Candid::Encounters::V4::Types::ClaimSupplementalInformation]
        }, optional: true, nullable: false
        field :secondary_payer_carrier_code, -> { String }, optional: true, nullable: false
        field :related_causes_information, lambda {
          Candid::RelatedCausesInformation::V1::Types::RelatedCausesInformationCreate
        }, optional: true, nullable: false
      end
    end
  end
end
