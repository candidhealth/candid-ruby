# frozen_string_literal: true

module Candid
  module PreEncounter
    module Patients
      module V1
        module Types
          # An object representing patient demographics information.
          class MutablePatient < Internal::Types::Model
            field :name, -> { Candid::PreEncounter::Common::Types::HumanName }, optional: false, nullable: false
            field :other_names, -> { Internal::Types::Array[Candid::PreEncounter::Common::Types::HumanName] }, optional: false, nullable: false
            field :other_identifiers, -> { Internal::Types::Array[Candid::PreEncounter::Common::Types::ExternalIdentifier] }, optional: true, nullable: false
            field :gender, -> { Candid::PreEncounter::Common::Types::Gender }, optional: true, nullable: false
            field :birth_date, -> { String }, optional: false, nullable: false
            field :social_security_number, -> { String }, optional: true, nullable: false
            field :biological_sex, -> { Candid::PreEncounter::Common::Types::Sex }, optional: false, nullable: false
            field :sexual_orientation, -> { Candid::PreEncounter::Common::Types::SexualOrientation }, optional: true, nullable: false
            field :pronouns, -> { Internal::Types::Array[String] }, optional: true, nullable: false
            field :race, -> { Candid::PreEncounter::Common::Types::Race }, optional: true, nullable: false
            field :ethnicity, -> { Candid::PreEncounter::Common::Types::Ethnicity }, optional: true, nullable: false
            field :disability_status, -> { Candid::PreEncounter::Common::Types::DisabilityStatus }, optional: true, nullable: false
            field :marital_status, -> { Candid::PreEncounter::Patients::V1::Types::MaritalStatus }, optional: true, nullable: false
            field :deceased, -> { String }, optional: true, nullable: false
            field :multiple_birth, -> { Integer }, optional: true, nullable: false
            field :primary_address, -> { Candid::PreEncounter::Common::Types::Address }, optional: false, nullable: false
            field :other_addresses, -> { Internal::Types::Array[Candid::PreEncounter::Common::Types::Address] }, optional: false, nullable: false
            field :primary_telecom, -> { Candid::PreEncounter::Common::Types::ContactPoint }, optional: true, nullable: false
            field :other_telecoms, -> { Internal::Types::Array[Candid::PreEncounter::Common::Types::ContactPoint] }, optional: false, nullable: false
            field :email, -> { String }, optional: true, nullable: false
            field :electronic_communication_opt_in, -> { Internal::Types::Boolean }, optional: true, nullable: false
            field :photo, -> { String }, optional: true, nullable: false
            field :language, -> { String }, optional: true, nullable: false
            field :external_provenance, -> { Candid::PreEncounter::Patients::V1::Types::ExternalProvenance }, optional: true, nullable: false
            field :contacts, -> { Internal::Types::Array[Candid::PreEncounter::Patients::V1::Types::Contact] }, optional: false, nullable: false
            field :general_practitioners, -> { Internal::Types::Array[Candid::PreEncounter::Common::Types::ExternalProvider] }, optional: false, nullable: false
            field :filing_order, -> { Candid::PreEncounter::Patients::V1::Types::FilingOrder }, optional: false, nullable: false
            field :non_insurance_payers, -> { Internal::Types::Array[String] }, optional: true, nullable: false
            field :non_insurance_payer_associations, -> { Internal::Types::Array[Candid::PreEncounter::Common::Types::CanonicalNonInsurancePayerAssociation] }, optional: true, nullable: false
            field :guarantor, -> { Candid::PreEncounter::Patients::V1::Types::Guarantor }, optional: true, nullable: false
            field :self_pay, -> { Internal::Types::Boolean }, optional: true, nullable: false
            field :authorizations, -> { Internal::Types::Array[Candid::PreEncounter::Patients::V1::Types::Authorization] }, optional: true, nullable: false
            field :referrals, -> { Internal::Types::Array[Candid::PreEncounter::Patients::V1::Types::Referral] }, optional: true, nullable: false
            field :primary_service_facility_id, -> { String }, optional: true, nullable: false
            field :service_facilities, -> { Internal::Types::Array[Candid::PreEncounter::Common::Types::PatientServiceFacility] }, optional: true, nullable: false
            field :do_not_invoice_reason, -> { Candid::PreEncounter::Patients::V1::Types::DoNotInvoiceReason }, optional: true, nullable: false
            field :note_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false
            field :tag_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false
            field :origination_detail, -> { Candid::PreEncounter::Patients::V1::Types::OriginationDetail }, optional: true, nullable: false
            field :inferred_patient_metadata, -> { Candid::PreEncounter::Patients::V1::Types::InferredPatientMetadata }, optional: true, nullable: false
            field :orcon, -> { Internal::Types::Boolean }, optional: true, nullable: false

          end
        end
      end
    end
  end
end
