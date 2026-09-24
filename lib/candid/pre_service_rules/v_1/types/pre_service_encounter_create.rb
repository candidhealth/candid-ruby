# frozen_string_literal: true

module Candid
  module PreServiceRules
    module V1
      module Types
        # The encounter to run pre-service rules against. This should represent the state of the encounter/claim in the
        # source system.
        # In an Electronic Health Record (EHR) system, this might be a claim, billing note, or other entity. A client
        # should transform
        # the source system entity into this encounter shape in order to run Candid rules.
        class PreServiceEncounterCreate < Internal::Types::Model
          field :external_id, -> { String }, optional: false, nullable: false
          field :patient_authorized_release, -> { Internal::Types::Boolean }, optional: false, nullable: false
          field :benefits_assigned_to_provider, -> { Internal::Types::Boolean }, optional: false, nullable: false
          field :provider_accepts_assignment, -> { Internal::Types::Boolean }, optional: false, nullable: false
          field :patient, -> { Candid::Individual::Types::PatientCreate }, optional: false, nullable: false
          field :responsible_party, -> { Candid::Encounters::V4::Types::ResponsiblePartyType }, optional: false, nullable: false
          field :billing_provider, -> { Candid::EncounterProviders::V2::Types::BillingProvider }, optional: false, nullable: false
          field :submission_expectation, -> { Candid::Encounters::V4::Types::EncounterSubmissionExpectation }, optional: false, nullable: false
          field :date_of_service, -> { String }, optional: true, nullable: false
          field :end_date_of_service, -> { String }, optional: true, nullable: false
          field :pay_to_address, -> { Candid::Commons::Types::StreetAddressLongZip }, optional: true, nullable: false
          field :referring_provider, -> { Candid::EncounterProviders::V2::Types::ReferringProvider }, optional: true, nullable: false
          field :supervising_provider, -> { Candid::EncounterProviders::V2::Types::SupervisingProvider }, optional: true, nullable: false
          field :service_facility, -> { Candid::ServiceFacility::Types::EncounterServiceFacilityBase }, optional: true, nullable: false
          field :subscriber_primary, -> { Candid::Individual::Types::SubscriberCreate }, optional: true, nullable: false
          field :subscriber_secondary, -> { Candid::Individual::Types::SubscriberCreate }, optional: true, nullable: false
          field :prior_authorization_number, -> { String }, optional: true, nullable: false
          field :schema_instances, -> { Internal::Types::Array[Candid::CustomSchemas::V1::Types::SchemaInstance] }, optional: true, nullable: false
          field :place_of_service_code, -> { Candid::Commons::Types::FacilityTypeCode }, optional: true, nullable: false
          field :rendering_provider, -> { Candid::EncounterProviders::V2::Types::RenderingProvider }, optional: true, nullable: false
          field :service_lines, -> { Internal::Types::Array[Candid::ServiceLines::V2::Types::UniversalServiceLineCreate] }, optional: true, nullable: false
          field :health_care_code_information, -> { Candid::HealthCareCodeInformation::V1::Types::HealthCareCodeInformationCreate }, optional: true, nullable: false
          field :attending_provider, -> { Candid::EncounterProviders::V2::Types::RenderingProvider }, optional: true, nullable: false
          field :initial_referring_provider, -> { Candid::EncounterProviders::V2::Types::InitialReferringProvider }, optional: true, nullable: false
          field :treating_provider, -> { Candid::EncounterProviders::V2::Types::TreatingProvider }, optional: true, nullable: false
          field :operating_provider, -> { Candid::EncounterProviders::V2::Types::RenderingProvider }, optional: true, nullable: false
          field :other_operating_provider, -> { Candid::EncounterProviders::V2::Types::RenderingProvider }, optional: true, nullable: false
          field :service_facility_id, -> { String }, optional: true, nullable: false
          field :subscriber_tertiary, -> { Candid::Individual::Types::SubscriberCreate }, optional: true, nullable: false
          field :guarantor, -> { Candid::Guarantor::V1::Types::GuarantorCreate }, optional: true, nullable: false
          field :clinical_notes, -> { Internal::Types::Array[Candid::Encounters::V4::Types::ClinicalNoteCategoryCreate] }, optional: true, nullable: false
          field :billing_notes, -> { Internal::Types::Array[Candid::BillingNotes::V2::Types::BillingNoteBase] }, optional: true, nullable: false
          field :patient_histories, -> { Internal::Types::Array[Candid::Encounters::V4::Types::PatientHistoryCategory] }, optional: true, nullable: false
          field :tag_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false
          field :external_claim_submission, -> { Candid::ClaimSubmission::V1::Types::ExternalClaimSubmissionCreate }, optional: true, nullable: false
          field :referral_number, -> { String }, optional: true, nullable: false
          field :epsdt_referral, -> { Candid::Encounters::V4::Types::EpsdtReferral }, optional: true, nullable: false
          field :claim_supplemental_information, -> { Internal::Types::Array[Candid::Encounters::V4::Types::ClaimSupplementalInformation] }, optional: true, nullable: false
          field :secondary_payer_carrier_code, -> { String }, optional: true, nullable: false
          field :related_causes_information, -> { Candid::RelatedCauses::V1::Types::RelatedCausesInformationCreate }, optional: true, nullable: false
          field :property_casualty_claim_number, -> { String }, optional: true, nullable: false
          field :accident_date, -> { String }, optional: true, nullable: false
          field :initial_treatment_date, -> { String }, optional: true, nullable: false
          field :property_casualty_patient_identifier, -> { Candid::PropertyAndCasualty::V1::Types::PropertyCasualtyPatientIdentifierCreate }, optional: true, nullable: false
          field :admission_hour, -> { Integer }, optional: true, nullable: false
          field :admission_type_code, -> { Candid::X12::V1::Types::TypeOfAdmissionOrVisitCode }, optional: true, nullable: false
          field :admission_source_code, -> { Candid::X12::V1::Types::PointOfOriginForAdmissionOrVisitCode }, optional: true, nullable: false
          field :discharge_hour, -> { Integer }, optional: true, nullable: false
          field :discharge_status, -> { Candid::X12::V1::Types::PatientDischargeStatusCode }, optional: true, nullable: false
          field :type_of_bill, -> { Candid::X12::V1::Types::TypeOfBillCompositeUpdate }, optional: true, nullable: false
          field :accident_state_or_province_code, -> { Candid::Commons::Types::State }, optional: true, nullable: false
        end
      end
    end
  end
end
