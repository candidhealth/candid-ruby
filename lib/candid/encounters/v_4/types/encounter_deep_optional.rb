# frozen_string_literal: true

module Candid
  module Encounters
    module V4
      module Types
        class EncounterDeepOptional < Internal::Types::Model
          field :vitals, -> { Candid::Encounters::V4::Types::VitalsUpdate }, optional: true, nullable: false
          field :diagnoses, -> { Internal::Types::Array[Candid::Diagnoses::Types::DiagnosisCreateOptional] }, optional: true, nullable: false
          field :clinical_notes, -> { Internal::Types::Array[Candid::Encounters::V4::Types::ClinicalNoteCategoryCreateOptional] }, optional: true, nullable: false
          field :claim_supplemental_information, -> { Internal::Types::Array[Candid::Encounters::V4::Types::ClaimSupplementalInformationOptional] }, optional: true, nullable: false
          field :epsdt_referral, -> { Candid::Encounters::V4::Types::EpsdtReferralOptional }, optional: true, nullable: false
          field :existing_medications, -> { Internal::Types::Array[Candid::Encounters::V4::Types::MedicationOptional] }, optional: true, nullable: false
          field :guarantor, -> { Candid::Guarantor::V1::Types::GuarantorOptional }, optional: true, nullable: false
          field :subscriber_primary, -> { Candid::Individual::Types::SubscriberCreateOptional }, optional: true, nullable: false
          field :subscriber_secondary, -> { Candid::Individual::Types::SubscriberCreateOptional }, optional: true, nullable: false
          field :subscriber_tertiary, -> { Candid::Individual::Types::SubscriberCreateOptional }, optional: true, nullable: false
          field :interventions, -> { Internal::Types::Array[Candid::Encounters::V4::Types::InterventionOptional] }, optional: true, nullable: false
          field :schema_instances, -> { Internal::Types::Array[Candid::CustomSchemas::V1::Types::SchemaInstanceOptional] }, optional: true, nullable: false
          field :external_claim_submission, -> { Candid::ClaimSubmission::V1::Types::ExternalClaimSubmissionCreateOptional }, optional: true, nullable: false
          field :service_lines, -> { Internal::Types::Array[Candid::ServiceLines::V2::Types::ServiceLineCreateOptional] }, optional: true, nullable: false
          field :patient_histories, -> { Internal::Types::Array[Candid::Encounters::V4::Types::PatientHistoryCategoryOptional] }, optional: true, nullable: false
          field :billing_notes, -> { Internal::Types::Array[Candid::BillingNotes::V2::Types::BillingNoteBaseOptional] }, optional: true, nullable: false
          field :patient, -> { Candid::Individual::Types::PatientUpdateWithOptionalAddress }, optional: true, nullable: false
          field :service_facility, -> { Candid::ServiceFacility::Types::EncounterServiceFacilityUpdateWithOptionalAddress }, optional: true, nullable: false
          field :rendering_provider, -> { Candid::EncounterProviders::V2::Types::RenderingProviderUpdateWithOptionalAddress }, optional: true, nullable: false
          field :initial_referring_provider, -> { Candid::EncounterProviders::V2::Types::InitialReferringProviderUpdateWithOptionalAddress }, optional: true, nullable: false
          field :referring_provider, -> { Candid::EncounterProviders::V2::Types::ReferringProviderUpdateWithOptionalAddress }, optional: true, nullable: false
          field :supervising_provider, -> { Candid::EncounterProviders::V2::Types::SupervisingProviderUpdateWithOptionalAddress }, optional: true, nullable: false
          field :billing_provider, -> { Candid::EncounterProviders::V2::Types::BillingProviderUpdateWithOptionalAddress }, optional: true, nullable: false
          field :pay_to_address, -> { Candid::Commons::Types::StreetAddressShortZipOptional }, optional: true, nullable: false

        end
      end
    end
  end
end
