# frozen_string_literal: true

module Candid
  module Encounters
    module V4
      module Types
        class Encounter < Internal::Types::Model
          field :accident_state_or_province_code, -> { Candid::Commons::Types::State }, optional: true, nullable: false
          field :claim_creation_id, -> { String }, optional: true, nullable: false
          field :patient_control_number, -> { String }, optional: true, nullable: false
          field :encounter_id, -> { String }, optional: false, nullable: false
          field :claims, -> { Internal::Types::Array[Candid::Claims::Types::Claim] }, optional: false, nullable: false
          field :patient, -> { Candid::Individual::Types::Patient }, optional: false, nullable: false
          field :guarantor, -> { Candid::Guarantor::V1::Types::Guarantor }, optional: true, nullable: false
          field :billing_provider, -> { Candid::EncounterProviders::V2::Types::EncounterProvider }, optional: false, nullable: false
          field :rendering_provider, -> { Candid::EncounterProviders::V2::Types::EncounterProvider }, optional: false, nullable: false
          field :attending_provider, -> { Candid::EncounterProviders::V2::Types::EncounterProvider }, optional: true, nullable: false
          field :admission_hour, -> { Integer }, optional: true, nullable: false
          field :admission_type_code, -> { Candid::X12::V1::Types::TypeOfAdmissionOrVisitCode }, optional: true, nullable: false
          field :admission_source_code, -> { Candid::X12::V1::Types::PointOfOriginForAdmissionOrVisitCode }, optional: true, nullable: false
          field :discharge_hour, -> { Integer }, optional: true, nullable: false
          field :discharge_status, -> { Candid::X12::V1::Types::PatientDischargeStatusCode }, optional: true, nullable: false
          field :operating_provider, -> { Candid::EncounterProviders::V2::Types::EncounterProvider }, optional: true, nullable: false
          field :other_operating_provider, -> { Candid::EncounterProviders::V2::Types::EncounterProvider }, optional: true, nullable: false
          field :submission_expectation, -> { Candid::Encounters::V4::Types::EncounterSubmissionExpectation }, optional: true, nullable: false
          field :type_of_bill, -> { Candid::X12::V1::Types::TypeOfBillComposite }, optional: true, nullable: false
          field :referring_provider, -> { Candid::EncounterProviders::V2::Types::EncounterProvider }, optional: true, nullable: false
          field :initial_referring_provider, -> { Candid::EncounterProviders::V2::Types::EncounterProvider }, optional: true, nullable: false
          field :supervising_provider, -> { Candid::EncounterProviders::V2::Types::EncounterProvider }, optional: true, nullable: false
          field :service_facility, -> { Candid::ServiceFacility::Types::EncounterServiceFacility }, optional: false, nullable: false
          field :subscriber_primary, -> { Candid::Individual::Types::Subscriber }, optional: true, nullable: false
          field :subscriber_secondary, -> { Candid::Individual::Types::Subscriber }, optional: true, nullable: false
          field :subscriber_tertiary, -> { Candid::Individual::Types::Subscriber }, optional: true, nullable: false
          field :prior_authorization_number, -> { String }, optional: true, nullable: false
          field :responsible_party, -> { Candid::Encounters::V4::Types::ResponsiblePartyType }, optional: false, nullable: false
          field :url, -> { String }, optional: false, nullable: false
          field :diagnoses, -> { Internal::Types::Array[Candid::Diagnoses::Types::Diagnosis] }, optional: false, nullable: false
          field :clinical_notes, -> { Internal::Types::Array[Candid::Encounters::V4::Types::ClinicalNoteCategory] }, optional: false, nullable: false
          field :billing_notes, -> { Internal::Types::Array[Candid::BillingNotes::V2::Types::BillingNote] }, optional: true, nullable: false
          field :place_of_service_code, -> { Candid::Commons::Types::FacilityTypeCode }, optional: true, nullable: false
          field :place_of_service_code_as_submitted, -> { Candid::Commons::Types::FacilityTypeCode }, optional: true, nullable: false
          field :patient_histories, -> { Internal::Types::Array[Candid::Encounters::V4::Types::PatientHistoryCategory] }, optional: false, nullable: false
          field :patient_payments, -> { Internal::Types::Array[Candid::PatientPayments::V3::Types::PatientPayment] }, optional: false, nullable: false
          field :tags, -> { Internal::Types::Array[Candid::Tags::Types::Tag] }, optional: false, nullable: false
          field :coding_attribution, -> { Candid::Encounters::V4::Types::CodingAttributionType }, optional: true, nullable: false
          field :work_queue_id, -> { String }, optional: true, nullable: false
          field :work_queue_membership_activated_at, -> { String }, optional: true, nullable: false
          field :owner_of_next_action, -> { Candid::Encounters::V4::Types::EncounterOwnerOfNextActionType }, optional: false, nullable: false
          field :submission_origin, -> { Candid::Encounters::V4::Types::EncounterSubmissionOriginType }, optional: false, nullable: false
          field :schema_instances, -> { Internal::Types::Array[Candid::CustomSchemas::V1::Types::SchemaInstance] }, optional: false, nullable: false
          field :referral_number, -> { String }, optional: true, nullable: false
          field :epsdt_referral, -> { Candid::Encounters::V4::Types::EpsdtReferral }, optional: true, nullable: false
          field :claim_supplemental_information, -> { Internal::Types::Array[Candid::Encounters::V4::Types::ClaimSupplementalInformation] }, optional: true, nullable: false
          field :secondary_payer_carrier_code, -> { String }, optional: true, nullable: false
          field :last_submitted_at, -> { String }, optional: true, nullable: false
          field :created_at, -> { String }, optional: false, nullable: false
          field :next_responsible_party, -> { Candid::Commons::Types::NextResponsibleParty }, optional: true, nullable: false

        end
      end
    end
  end
end
