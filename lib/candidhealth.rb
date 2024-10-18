# frozen_string_literal: true

require_relative "environment"
require_relative "types_export"
require_relative "core/oauth"
require_relative "requests"
require_relative "candidhealth/auth/client"
require_relative "candidhealth/billing_notes/client"
require_relative "candidhealth/contracts/client"
require_relative "candidhealth/credentialing/client"
require_relative "candidhealth/custom_schemas/client"
require_relative "candidhealth/eligibility/client"
require_relative "candidhealth/encounter_providers/client"
require_relative "candidhealth/encounters/client"
require_relative "candidhealth/expected_network_status/client"
require_relative "candidhealth/exports/client"
require_relative "candidhealth/external_payment_account_config/client"
require_relative "candidhealth/fee_schedules/client"
require_relative "candidhealth/guarantor/client"
require_relative "candidhealth/import_invoice/client"
require_relative "candidhealth/insurance_adjudications/client"
require_relative "candidhealth/insurance_payments/client"
require_relative "candidhealth/insurance_refunds/client"
require_relative "candidhealth/medication_dispense/client"
require_relative "candidhealth/non_insurance_payer_payments/client"
require_relative "candidhealth/non_insurance_payer_refunds/client"
require_relative "candidhealth/non_insurance_payers/client"
require_relative "candidhealth/organization_service_facilities/client"
require_relative "candidhealth/organization_providers/client"
require_relative "candidhealth/patient_payments/client"
require_relative "candidhealth/patient_refunds/client"
require_relative "candidhealth/payers/client"
require_relative "candidhealth/service_lines/client"
require_relative "candidhealth/tasks/client"
require_relative "candidhealth/write_offs/client"
require_relative "candidhealth/pre_encounter/client"
require_relative "candidhealth/diagnoses/client"
require_relative "candidhealth/service_facility/client"

module CandidApiClient
  class Client
    # @return [CandidApiClient::Auth::Client]
    attr_reader :auth
    # @return [CandidApiClient::BillingNotes::Client]
    attr_reader :billing_notes
    # @return [CandidApiClient::Contracts::Client]
    attr_reader :contracts
    # @return [CandidApiClient::Credentialing::Client]
    attr_reader :credentialing
    # @return [CandidApiClient::CustomSchemas::Client]
    attr_reader :custom_schemas
    # @return [CandidApiClient::Eligibility::Client]
    attr_reader :eligibility
    # @return [CandidApiClient::EncounterProviders::Client]
    attr_reader :encounter_providers
    # @return [CandidApiClient::Encounters::Client]
    attr_reader :encounters
    # @return [CandidApiClient::ExpectedNetworkStatus::Client]
    attr_reader :expected_network_status
    # @return [CandidApiClient::Exports::Client]
    attr_reader :exports
    # @return [CandidApiClient::ExternalPaymentAccountConfig::Client]
    attr_reader :external_payment_account_config
    # @return [CandidApiClient::FeeSchedules::Client]
    attr_reader :fee_schedules
    # @return [CandidApiClient::Guarantor::Client]
    attr_reader :guarantor
    # @return [CandidApiClient::ImportInvoice::Client]
    attr_reader :import_invoice
    # @return [CandidApiClient::InsuranceAdjudications::Client]
    attr_reader :insurance_adjudications
    # @return [CandidApiClient::InsurancePayments::Client]
    attr_reader :insurance_payments
    # @return [CandidApiClient::InsuranceRefunds::Client]
    attr_reader :insurance_refunds
    # @return [CandidApiClient::MedicationDispense::Client]
    attr_reader :medication_dispense
    # @return [CandidApiClient::NonInsurancePayerPayments::Client]
    attr_reader :non_insurance_payer_payments
    # @return [CandidApiClient::NonInsurancePayerRefunds::Client]
    attr_reader :non_insurance_payer_refunds
    # @return [CandidApiClient::NonInsurancePayers::Client]
    attr_reader :non_insurance_payers
    # @return [CandidApiClient::OrganizationServiceFacilities::Client]
    attr_reader :organization_service_facilities
    # @return [CandidApiClient::OrganizationProviders::Client]
    attr_reader :organization_providers
    # @return [CandidApiClient::PatientPayments::Client]
    attr_reader :patient_payments
    # @return [CandidApiClient::PatientRefunds::Client]
    attr_reader :patient_refunds
    # @return [CandidApiClient::Payers::Client]
    attr_reader :payers
    # @return [CandidApiClient::ServiceLines::Client]
    attr_reader :service_lines
    # @return [CandidApiClient::Tasks::Client]
    attr_reader :tasks
    # @return [CandidApiClient::WriteOffs::Client]
    attr_reader :write_offs
    # @return [CandidApiClient::PreEncounter::Client]
    attr_reader :pre_encounter
    # @return [CandidApiClient::DiagnosesClient]
    attr_reader :diagnoses
    # @return [CandidApiClient::ServiceFacilityClient]
    attr_reader :service_facility

    # @param base_url [String]
    # @param environment [CandidApiClient::Environment]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param client_id [String]
    # @param client_secret [String]
    # @return [CandidApiClient::Client]
    def initialize(client_id:, client_secret:, base_url: nil, environment: CandidApiClient::Environment::PRODUCTION, max_retries: nil,
                   timeout_in_seconds: nil)
      @oauth_provider = CandidApiClient::OauthTokenProvider.new(
        client_id: client_id,
        client_secret: client_secret,
        request_client: CandidApiClient::RequestClient.new(
          base_url: base_url,
          environment: environment,
          max_retries: max_retries,
          timeout_in_seconds: timeout_in_seconds
        )
      )
      @request_client = CandidApiClient::RequestClient.new(
        base_url: base_url,
        environment: environment,
        max_retries: max_retries,
        timeout_in_seconds: timeout_in_seconds,
        token: @oauth_provider.method(:token)
      )
      @auth = CandidApiClient::Auth::Client.new(request_client: @request_client)
      @billing_notes = CandidApiClient::BillingNotes::Client.new(request_client: @request_client)
      @contracts = CandidApiClient::Contracts::Client.new(request_client: @request_client)
      @credentialing = CandidApiClient::Credentialing::Client.new(request_client: @request_client)
      @custom_schemas = CandidApiClient::CustomSchemas::Client.new(request_client: @request_client)
      @eligibility = CandidApiClient::Eligibility::Client.new(request_client: @request_client)
      @encounter_providers = CandidApiClient::EncounterProviders::Client.new(request_client: @request_client)
      @encounters = CandidApiClient::Encounters::Client.new(request_client: @request_client)
      @expected_network_status = CandidApiClient::ExpectedNetworkStatus::Client.new(request_client: @request_client)
      @exports = CandidApiClient::Exports::Client.new(request_client: @request_client)
      @external_payment_account_config = CandidApiClient::ExternalPaymentAccountConfig::Client.new(request_client: @request_client)
      @fee_schedules = CandidApiClient::FeeSchedules::Client.new(request_client: @request_client)
      @guarantor = CandidApiClient::Guarantor::Client.new(request_client: @request_client)
      @import_invoice = CandidApiClient::ImportInvoice::Client.new(request_client: @request_client)
      @insurance_adjudications = CandidApiClient::InsuranceAdjudications::Client.new(request_client: @request_client)
      @insurance_payments = CandidApiClient::InsurancePayments::Client.new(request_client: @request_client)
      @insurance_refunds = CandidApiClient::InsuranceRefunds::Client.new(request_client: @request_client)
      @medication_dispense = CandidApiClient::MedicationDispense::Client.new(request_client: @request_client)
      @non_insurance_payer_payments = CandidApiClient::NonInsurancePayerPayments::Client.new(request_client: @request_client)
      @non_insurance_payer_refunds = CandidApiClient::NonInsurancePayerRefunds::Client.new(request_client: @request_client)
      @non_insurance_payers = CandidApiClient::NonInsurancePayers::Client.new(request_client: @request_client)
      @organization_service_facilities = CandidApiClient::OrganizationServiceFacilities::Client.new(request_client: @request_client)
      @organization_providers = CandidApiClient::OrganizationProviders::Client.new(request_client: @request_client)
      @patient_payments = CandidApiClient::PatientPayments::Client.new(request_client: @request_client)
      @patient_refunds = CandidApiClient::PatientRefunds::Client.new(request_client: @request_client)
      @payers = CandidApiClient::Payers::Client.new(request_client: @request_client)
      @service_lines = CandidApiClient::ServiceLines::Client.new(request_client: @request_client)
      @tasks = CandidApiClient::Tasks::Client.new(request_client: @request_client)
      @write_offs = CandidApiClient::WriteOffs::Client.new(request_client: @request_client)
      @pre_encounter = CandidApiClient::PreEncounter::Client.new(request_client: @request_client)
      @diagnoses = CandidApiClient::DiagnosesClient.new(request_client: @request_client)
      @service_facility = CandidApiClient::ServiceFacilityClient.new(request_client: @request_client)
    end
  end

  class AsyncClient
    # @return [CandidApiClient::Auth::AsyncClient]
    attr_reader :auth
    # @return [CandidApiClient::BillingNotes::AsyncClient]
    attr_reader :billing_notes
    # @return [CandidApiClient::Contracts::AsyncClient]
    attr_reader :contracts
    # @return [CandidApiClient::Credentialing::AsyncClient]
    attr_reader :credentialing
    # @return [CandidApiClient::CustomSchemas::AsyncClient]
    attr_reader :custom_schemas
    # @return [CandidApiClient::Eligibility::AsyncClient]
    attr_reader :eligibility
    # @return [CandidApiClient::EncounterProviders::AsyncClient]
    attr_reader :encounter_providers
    # @return [CandidApiClient::Encounters::AsyncClient]
    attr_reader :encounters
    # @return [CandidApiClient::ExpectedNetworkStatus::AsyncClient]
    attr_reader :expected_network_status
    # @return [CandidApiClient::Exports::AsyncClient]
    attr_reader :exports
    # @return [CandidApiClient::ExternalPaymentAccountConfig::AsyncClient]
    attr_reader :external_payment_account_config
    # @return [CandidApiClient::FeeSchedules::AsyncClient]
    attr_reader :fee_schedules
    # @return [CandidApiClient::Guarantor::AsyncClient]
    attr_reader :guarantor
    # @return [CandidApiClient::ImportInvoice::AsyncClient]
    attr_reader :import_invoice
    # @return [CandidApiClient::InsuranceAdjudications::AsyncClient]
    attr_reader :insurance_adjudications
    # @return [CandidApiClient::InsurancePayments::AsyncClient]
    attr_reader :insurance_payments
    # @return [CandidApiClient::InsuranceRefunds::AsyncClient]
    attr_reader :insurance_refunds
    # @return [CandidApiClient::MedicationDispense::AsyncClient]
    attr_reader :medication_dispense
    # @return [CandidApiClient::NonInsurancePayerPayments::AsyncClient]
    attr_reader :non_insurance_payer_payments
    # @return [CandidApiClient::NonInsurancePayerRefunds::AsyncClient]
    attr_reader :non_insurance_payer_refunds
    # @return [CandidApiClient::NonInsurancePayers::AsyncClient]
    attr_reader :non_insurance_payers
    # @return [CandidApiClient::OrganizationServiceFacilities::AsyncClient]
    attr_reader :organization_service_facilities
    # @return [CandidApiClient::OrganizationProviders::AsyncClient]
    attr_reader :organization_providers
    # @return [CandidApiClient::PatientPayments::AsyncClient]
    attr_reader :patient_payments
    # @return [CandidApiClient::PatientRefunds::AsyncClient]
    attr_reader :patient_refunds
    # @return [CandidApiClient::Payers::AsyncClient]
    attr_reader :payers
    # @return [CandidApiClient::ServiceLines::AsyncClient]
    attr_reader :service_lines
    # @return [CandidApiClient::Tasks::AsyncClient]
    attr_reader :tasks
    # @return [CandidApiClient::WriteOffs::AsyncClient]
    attr_reader :write_offs
    # @return [CandidApiClient::PreEncounter::AsyncClient]
    attr_reader :pre_encounter
    # @return [CandidApiClient::AsyncDiagnosesClient]
    attr_reader :diagnoses
    # @return [CandidApiClient::AsyncServiceFacilityClient]
    attr_reader :service_facility

    # @param base_url [String]
    # @param environment [CandidApiClient::Environment]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param client_id [String]
    # @param client_secret [String]
    # @return [CandidApiClient::AsyncClient]
    def initialize(client_id:, client_secret:, base_url: nil, environment: CandidApiClient::Environment::PRODUCTION, max_retries: nil,
                   timeout_in_seconds: nil)
      @oauth_provider = CandidApiClient::OauthTokenProvider.new(
        client_id: client_id,
        client_secret: client_secret,
        request_client: CandidApiClient::RequestClient.new(
          base_url: base_url,
          environment: environment,
          max_retries: max_retries,
          timeout_in_seconds: timeout_in_seconds
        )
      )
      @async_request_client = CandidApiClient::AsyncRequestClient.new(
        base_url: base_url,
        environment: environment,
        max_retries: max_retries,
        timeout_in_seconds: timeout_in_seconds,
        token: token
      )
      @auth = CandidApiClient::Auth::AsyncClient.new(request_client: @async_request_client)
      @billing_notes = CandidApiClient::BillingNotes::AsyncClient.new(request_client: @async_request_client)
      @contracts = CandidApiClient::Contracts::AsyncClient.new(request_client: @async_request_client)
      @credentialing = CandidApiClient::Credentialing::AsyncClient.new(request_client: @async_request_client)
      @custom_schemas = CandidApiClient::CustomSchemas::AsyncClient.new(request_client: @async_request_client)
      @eligibility = CandidApiClient::Eligibility::AsyncClient.new(request_client: @async_request_client)
      @encounter_providers = CandidApiClient::EncounterProviders::AsyncClient.new(request_client: @async_request_client)
      @encounters = CandidApiClient::Encounters::AsyncClient.new(request_client: @async_request_client)
      @expected_network_status = CandidApiClient::ExpectedNetworkStatus::AsyncClient.new(request_client: @async_request_client)
      @exports = CandidApiClient::Exports::AsyncClient.new(request_client: @async_request_client)
      @external_payment_account_config = CandidApiClient::ExternalPaymentAccountConfig::AsyncClient.new(request_client: @async_request_client)
      @fee_schedules = CandidApiClient::FeeSchedules::AsyncClient.new(request_client: @async_request_client)
      @guarantor = CandidApiClient::Guarantor::AsyncClient.new(request_client: @async_request_client)
      @import_invoice = CandidApiClient::ImportInvoice::AsyncClient.new(request_client: @async_request_client)
      @insurance_adjudications = CandidApiClient::InsuranceAdjudications::AsyncClient.new(request_client: @async_request_client)
      @insurance_payments = CandidApiClient::InsurancePayments::AsyncClient.new(request_client: @async_request_client)
      @insurance_refunds = CandidApiClient::InsuranceRefunds::AsyncClient.new(request_client: @async_request_client)
      @medication_dispense = CandidApiClient::MedicationDispense::AsyncClient.new(request_client: @async_request_client)
      @non_insurance_payer_payments = CandidApiClient::NonInsurancePayerPayments::AsyncClient.new(request_client: @async_request_client)
      @non_insurance_payer_refunds = CandidApiClient::NonInsurancePayerRefunds::AsyncClient.new(request_client: @async_request_client)
      @non_insurance_payers = CandidApiClient::NonInsurancePayers::AsyncClient.new(request_client: @async_request_client)
      @organization_service_facilities = CandidApiClient::OrganizationServiceFacilities::AsyncClient.new(request_client: @async_request_client)
      @organization_providers = CandidApiClient::OrganizationProviders::AsyncClient.new(request_client: @async_request_client)
      @patient_payments = CandidApiClient::PatientPayments::AsyncClient.new(request_client: @async_request_client)
      @patient_refunds = CandidApiClient::PatientRefunds::AsyncClient.new(request_client: @async_request_client)
      @payers = CandidApiClient::Payers::AsyncClient.new(request_client: @async_request_client)
      @service_lines = CandidApiClient::ServiceLines::AsyncClient.new(request_client: @async_request_client)
      @tasks = CandidApiClient::Tasks::AsyncClient.new(request_client: @async_request_client)
      @write_offs = CandidApiClient::WriteOffs::AsyncClient.new(request_client: @async_request_client)
      @pre_encounter = CandidApiClient::PreEncounter::AsyncClient.new(request_client: @async_request_client)
      @diagnoses = CandidApiClient::AsyncDiagnosesClient.new(request_client: @async_request_client)
      @service_facility = CandidApiClient::AsyncServiceFacilityClient.new(request_client: @async_request_client)
    end
  end
end
