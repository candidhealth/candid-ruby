# frozen_string_literal: true

module Candid
  module Encounters
    module V4
      module Types
        class EncounterOptional < Internal::Types::Model
          field :benefits_assigned_to_provider, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :prior_authorization_number, -> { String }, optional: true, nullable: false
          field :external_id, -> { String }, optional: true, nullable: false
          field :date_of_service, -> { String }, optional: true, nullable: false
          field :tag_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false
          field :billable_status, -> { Candid::Encounters::V4::Types::BillableStatusType }, optional: true, nullable: false
          field :responsible_party, -> { Candid::Encounters::V4::Types::ResponsiblePartyType }, optional: true, nullable: false
          field :provider_accepts_assignment, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :synchronicity, -> { Candid::Encounters::V4::Types::SynchronicityType }, optional: true, nullable: false
          field :place_of_service_code, -> { Candid::Commons::Types::FacilityTypeCode }, optional: true, nullable: false
          field :appointment_type, -> { String }, optional: true, nullable: false
          field :end_date_of_service, -> { String }, optional: true, nullable: false
          field :additional_information, -> { String }, optional: true, nullable: false
          field :service_authorization_exception_code, -> { Candid::Encounters::V4::Types::ServiceAuthorizationExceptionCode }, optional: true, nullable: false
          field :admission_date, -> { String }, optional: true, nullable: false
          field :discharge_date, -> { String }, optional: true, nullable: false
          field :onset_of_current_illness_or_symptom_date, -> { String }, optional: true, nullable: false
          field :last_menstrual_period_date, -> { String }, optional: true, nullable: false
          field :delay_reason_code, -> { Candid::Commons::Types::DelayReasonCode }, optional: true, nullable: false
          field :patient_authorized_release, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :referral_number, -> { String }, optional: true, nullable: false
          field :secondary_payer_carrier_code, -> { String }, optional: true, nullable: false

        end
      end
    end
  end
end
