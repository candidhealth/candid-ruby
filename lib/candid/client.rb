# frozen_string_literal: true

module Candid
  class Client
    # @return [Candid::Client]
    def initialize(base_url:)
      @raw_client = Candid::Internal::Http::RawClient.new(
        base_url: base_url,
        headers: {
          "User-Agent": "candidhealth/1.18.0",
          "X-Fern-Language": "Ruby"
        }
      )
    end

    # @return [Candid::Auth::Client]
    def auth
      @auth ||= Candid::Auth::Client.new(client: @raw_client)
    end

    # @return [Candid::BillingNotes::Client]
    def billing_notes
      @billing_notes ||= Candid::BillingNotes::Client.new(client: @raw_client)
    end

    # @return [Candid::ChargeCaptureBundles::Client]
    def charge_capture_bundles
      @charge_capture_bundles ||= Candid::ChargeCaptureBundles::Client.new(client: @raw_client)
    end

    # @return [Candid::ChargeCapture::Client]
    def charge_capture
      @charge_capture ||= Candid::ChargeCapture::Client.new(client: @raw_client)
    end

    # @return [Candid::Contracts::Client]
    def contracts
      @contracts ||= Candid::Contracts::Client.new(client: @raw_client)
    end

    # @return [Candid::Credentialing::Client]
    def credentialing
      @credentialing ||= Candid::Credentialing::Client.new(client: @raw_client)
    end

    # @return [Candid::CustomSchemas::Client]
    def custom_schemas
      @custom_schemas ||= Candid::CustomSchemas::Client.new(client: @raw_client)
    end

    # @return [Candid::Eligibility::Client]
    def eligibility
      @eligibility ||= Candid::Eligibility::Client.new(client: @raw_client)
    end

    # @return [Candid::EncounterAttachments::Client]
    def encounter_attachments
      @encounter_attachments ||= Candid::EncounterAttachments::Client.new(client: @raw_client)
    end

    # @return [Candid::EncounterProviders::Client]
    def encounter_providers
      @encounter_providers ||= Candid::EncounterProviders::Client.new(client: @raw_client)
    end

    # @return [Candid::EncounterSupplementalInformation::Client]
    def encounter_supplemental_information
      @encounter_supplemental_information ||= Candid::EncounterSupplementalInformation::Client.new(client: @raw_client)
    end

    # @return [Candid::Encounters::Client]
    def encounters
      @encounters ||= Candid::Encounters::Client.new(client: @raw_client)
    end

    # @return [Candid::Events::Client]
    def events
      @events ||= Candid::Events::Client.new(client: @raw_client)
    end

    # @return [Candid::Exports::Client]
    def exports
      @exports ||= Candid::Exports::Client.new(client: @raw_client)
    end

    # @return [Candid::ExternalPaymentAccountConfig::Client]
    def external_payment_account_config
      @external_payment_account_config ||= Candid::ExternalPaymentAccountConfig::Client.new(client: @raw_client)
    end

    # @return [Candid::FeeSchedules::Client]
    def fee_schedules
      @fee_schedules ||= Candid::FeeSchedules::Client.new(client: @raw_client)
    end

    # @return [Candid::Guarantor::Client]
    def guarantor
      @guarantor ||= Candid::Guarantor::Client.new(client: @raw_client)
    end

    # @return [Candid::HealthCareCodeInformation::Client]
    def health_care_code_information
      @health_care_code_information ||= Candid::HealthCareCodeInformation::Client.new(client: @raw_client)
    end

    # @return [Candid::ImportInvoice::Client]
    def import_invoice
      @import_invoice ||= Candid::ImportInvoice::Client.new(client: @raw_client)
    end

    # @return [Candid::InsuranceAdjudications::Client]
    def insurance_adjudications
      @insurance_adjudications ||= Candid::InsuranceAdjudications::Client.new(client: @raw_client)
    end

    # @return [Candid::InsuranceRefunds::Client]
    def insurance_refunds
      @insurance_refunds ||= Candid::InsuranceRefunds::Client.new(client: @raw_client)
    end

    # @return [Candid::MedicationDispense::Client]
    def medication_dispense
      @medication_dispense ||= Candid::MedicationDispense::Client.new(client: @raw_client)
    end

    # @return [Candid::NonInsurancePayerPayments::Client]
    def non_insurance_payer_payments
      @non_insurance_payer_payments ||= Candid::NonInsurancePayerPayments::Client.new(client: @raw_client)
    end

    # @return [Candid::NonInsurancePayerRefunds::Client]
    def non_insurance_payer_refunds
      @non_insurance_payer_refunds ||= Candid::NonInsurancePayerRefunds::Client.new(client: @raw_client)
    end

    # @return [Candid::NonInsurancePayers::Client]
    def non_insurance_payers
      @non_insurance_payers ||= Candid::NonInsurancePayers::Client.new(client: @raw_client)
    end

    # @return [Candid::OrganizationProviders::Client]
    def organization_providers
      @organization_providers ||= Candid::OrganizationProviders::Client.new(client: @raw_client)
    end

    # @return [Candid::OrganizationServiceFacilities::Client]
    def organization_service_facilities
      @organization_service_facilities ||= Candid::OrganizationServiceFacilities::Client.new(client: @raw_client)
    end

    # @return [Candid::PatientAr::Client]
    def patient_ar
      @patient_ar ||= Candid::PatientAr::Client.new(client: @raw_client)
    end

    # @return [Candid::PatientPayments::Client]
    def patient_payments
      @patient_payments ||= Candid::PatientPayments::Client.new(client: @raw_client)
    end

    # @return [Candid::PatientRefunds::Client]
    def patient_refunds
      @patient_refunds ||= Candid::PatientRefunds::Client.new(client: @raw_client)
    end

    # @return [Candid::PayerPlanGroups::Client]
    def payer_plan_groups
      @payer_plan_groups ||= Candid::PayerPlanGroups::Client.new(client: @raw_client)
    end

    # @return [Candid::Payers::Client]
    def payers
      @payers ||= Candid::Payers::Client.new(client: @raw_client)
    end

    # @return [Candid::ServiceLines::Client]
    def service_lines
      @service_lines ||= Candid::ServiceLines::Client.new(client: @raw_client)
    end

    # @return [Candid::Superbills::Client]
    def superbills
      @superbills ||= Candid::Superbills::Client.new(client: @raw_client)
    end

    # @return [Candid::Tasks::Client]
    def tasks
      @tasks ||= Candid::Tasks::Client.new(client: @raw_client)
    end

    # @return [Candid::WriteOffs::Client]
    def write_offs
      @write_offs ||= Candid::WriteOffs::Client.new(client: @raw_client)
    end

    # @return [Candid::PreEncounter::Client]
    def pre_encounter
      @pre_encounter ||= Candid::PreEncounter::Client.new(client: @raw_client)
    end

    # @return [Candid::Diagnoses::Client]
    def diagnoses
      @diagnoses ||= Candid::Diagnoses::Client.new(client: @raw_client)
    end
  end
end
