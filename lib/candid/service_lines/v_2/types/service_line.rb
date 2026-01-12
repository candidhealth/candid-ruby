# frozen_string_literal: true

module Candid
  module ServiceLines
    module V2
      module Types
        class ServiceLine < Internal::Types::Model
          field :created_at, -> { String }, optional: false, nullable: false
          field :modifiers, lambda {
            Internal::Types::Array[Candid::Commons::Types::ProcedureModifier]
          }, optional: true, nullable: false
          field :charge_amount_cents, -> { Integer }, optional: true, nullable: false
          field :allowed_amount_cents, -> { Integer }, optional: true, nullable: false
          field :insurance_balance_cents, -> { Integer }, optional: true, nullable: false
          field :patient_balance_cents, -> { Integer }, optional: true, nullable: false
          field :paid_amount_cents, -> { Integer }, optional: true, nullable: false
          field :primary_paid_amount_cents, -> { Integer }, optional: true, nullable: false
          field :secondary_paid_amount_cents, -> { Integer }, optional: true, nullable: false
          field :tertiary_paid_amount_cents, -> { Integer }, optional: true, nullable: false
          field :patient_responsibility_cents, -> { Integer }, optional: true, nullable: false
          field :copay_cents, -> { Integer }, optional: true, nullable: false
          field :coinsurance_cents, -> { Integer }, optional: true, nullable: false
          field :deductible_cents, -> { Integer }, optional: true, nullable: false
          field :diagnosis_id_zero, -> { String }, optional: true, nullable: false
          field :diagnosis_id_one, -> { String }, optional: true, nullable: false
          field :diagnosis_id_two, -> { String }, optional: true, nullable: false
          field :diagnosis_id_three, -> { String }, optional: true, nullable: false
          field :drug_identification, lambda {
            Candid::ServiceLines::V2::Types::DrugIdentification
          }, optional: true, nullable: false
          field :service_line_era_data, lambda {
            Candid::ServiceLines::V2::Types::ServiceLineEraData
          }, optional: true, nullable: false
          field :service_line_manual_adjustments, lambda {
            Internal::Types::Array[Candid::ServiceLines::V2::Types::ServiceLineAdjustment]
          }, optional: true, nullable: false
          field :related_invoices, lambda {
            Internal::Types::Array[Candid::Invoices::Types::Invoice]
          }, optional: true, nullable: false
          field :related_invoice_info, lambda {
            Internal::Types::Array[Candid::Invoices::V2::Types::InvoiceInfo]
          }, optional: true, nullable: false
          field :denial_reason, lambda {
            Candid::ServiceLines::V2::Types::ServiceLineDenialReason
          }, optional: true, nullable: false
          field :place_of_service_code, -> { Candid::Commons::Types::FacilityTypeCode }, optional: true, nullable: false
          field :place_of_service_code_as_submitted, lambda {
            Candid::Commons::Types::FacilityTypeCode
          }, optional: true, nullable: false
          field :service_line_id, -> { String }, optional: false, nullable: false
          field :procedure_code, -> { String }, optional: false, nullable: false
          field :ordering_provider, lambda {
            Candid::EncounterProviders::V2::Types::EncounterProvider
          }, optional: true, nullable: false
          field :revenue_code, -> { String }, optional: true, nullable: false
          field :quantity, -> { String }, optional: false, nullable: false
          field :units, -> { Candid::Commons::Types::ServiceLineUnits }, optional: false, nullable: false
          field :claim_id, -> { String }, optional: false, nullable: false
          field :date_of_service_range, lambda {
            Candid::Commons::Types::DateRangeOptionalEnd
          }, optional: false, nullable: false
          field :description, -> { String }, optional: true, nullable: false
          field :date_of_service, -> { String }, optional: false, nullable: false
          field :end_date_of_service, -> { String }, optional: true, nullable: false
          field :test_results, lambda {
            Internal::Types::Array[Candid::ServiceLines::V2::Types::TestResult]
          }, optional: true, nullable: false
          field :has_epsdt_indicator, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :has_family_planning_indicator, -> { Internal::Types::Boolean }, optional: true, nullable: false
          field :note, -> { String }, optional: true, nullable: false
          field :prior_authorization_number, -> { String }, optional: true, nullable: false
          field :external_id, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
