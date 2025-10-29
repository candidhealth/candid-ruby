# frozen_string_literal: true

module Candid
  module Encounters
    module V4
      module Types
        class EncounterBase < Internal::Types::Model
          field :external_id, -> { String }, optional: false, nullable: false
          field :date_of_service, -> { String }, optional: true, nullable: false
          field :end_date_of_service, -> { String }, optional: true, nullable: false
          field :patient_authorized_release, -> { Internal::Types::Boolean }, optional: false, nullable: false
          field :benefits_assigned_to_provider, -> { Internal::Types::Boolean }, optional: false, nullable: false
          field :provider_accepts_assignment, -> { Internal::Types::Boolean }, optional: false, nullable: false
          field :appointment_type, -> { String }, optional: true, nullable: false
          field :existing_medications, lambda {
            Internal::Types::Array[Candid::Encounters::V4::Types::Medication]
          }, optional: true, nullable: false
          field :interventions, lambda {
            Internal::Types::Array[Candid::Encounters::V4::Types::Intervention]
          }, optional: true, nullable: false
          field :pay_to_address, -> { Candid::Commons::Types::StreetAddressLongZip }, optional: true, nullable: false
          field :synchronicity, -> { Candid::Encounters::V4::Types::SynchronicityType }, optional: true, nullable: false
          field :vitals, -> { Candid::Encounters::V4::Types::Vitals }, optional: true, nullable: false
          field :billable_status, lambda {
            Candid::Encounters::V4::Types::BillableStatusType
          }, optional: false, nullable: false
          field :additional_information, -> { String }, optional: true, nullable: false
          field :service_authorization_exception_code, lambda {
            Candid::Encounters::V4::Types::ServiceAuthorizationExceptionCode
          }, optional: true, nullable: false
          field :admission_date, -> { String }, optional: true, nullable: false
          field :discharge_date, -> { String }, optional: true, nullable: false
          field :onset_of_current_illness_or_symptom_date, -> { String }, optional: true, nullable: false
          field :last_menstrual_period_date, -> { String }, optional: true, nullable: false
          field :delay_reason_code, -> { Candid::Commons::Types::DelayReasonCode }, optional: true, nullable: false
        end
      end
    end
  end
end
