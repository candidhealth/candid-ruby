# frozen_string_literal: true

module Candid
  module EncountersUniversal
    module Types
      class UniversalEncounterUpdateBase < Internal::Types::Model
        field :epsdt_referral, -> { Candid::Encounters::V4::Types::EpsdtReferral }, optional: true, nullable: false
        field :clinical_notes, lambda {
          Internal::Types::Array[Candid::Encounters::V4::Types::ClinicalNoteCategoryCreate]
        }, optional: true, nullable: false
        field :claim_supplemental_information, lambda {
          Internal::Types::Array[Candid::Encounters::V4::Types::ClaimSupplementalInformation]
        }, optional: true, nullable: false
        field :schema_instances, lambda {
          Internal::Types::Array[Candid::CustomSchemas::V1::Types::SchemaInstance]
        }, optional: true, nullable: false
        field :existing_medications, lambda {
          Internal::Types::Array[Candid::Encounters::V4::Types::Medication]
        }, optional: true, nullable: false
        field :guarantor, -> { Candid::Guarantor::V1::Types::GuarantorUpdate }, optional: true, nullable: false
        field :subscriber_primary, -> { Candid::Individual::Types::SubscriberCreate }, optional: true, nullable: false
        field :subscriber_secondary, -> { Candid::Individual::Types::SubscriberCreate }, optional: true, nullable: false
        field :subscriber_tertiary, -> { Candid::Individual::Types::SubscriberCreate }, optional: true, nullable: false
        field :pay_to_address, -> { Candid::Commons::Types::StreetAddressLongZip }, optional: true, nullable: false
        field :initial_referring_provider, lambda {
          Candid::EncounterProviders::V2::Types::InitialReferringProviderUpdate
        }, optional: true, nullable: false
        field :referring_provider, lambda {
          Candid::EncounterProviders::V2::Types::ReferringProviderUpdate
        }, optional: true, nullable: false
        field :patient, -> { Candid::Individual::Types::PatientUpdate }, optional: true, nullable: false
        field :rendering_provider, lambda {
          Candid::EncounterProviders::V2::Types::RenderingProviderUpdate
        }, optional: true, nullable: false
        field :service_facility, lambda {
          Candid::ServiceFacility::Types::EncounterServiceFacilityUpdate
        }, optional: true, nullable: false
        field :supervising_provider, lambda {
          Candid::EncounterProviders::V2::Types::SupervisingProviderUpdate
        }, optional: true, nullable: false
        field :billing_provider, lambda {
          Candid::EncounterProviders::V2::Types::BillingProviderUpdate
        }, optional: true, nullable: false
        field :place_of_service_code_as_submitted, lambda {
          Candid::Commons::Types::FacilityTypeCode
        }, optional: true, nullable: false
        field :related_causes_information, lambda {
          Candid::RelatedCausesInformation::V1::Types::RelatedCausesInformationUpdate
        }, optional: true, nullable: false
      end
    end
  end
end
