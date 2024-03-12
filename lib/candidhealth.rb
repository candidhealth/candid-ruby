# frozen_string_literal: true

require_relative "environment"
require_relative "types_export"
require_relative "requests"
require_relative "candidhealth/auth/client"
require_relative "candidhealth/billing_notes/client"
require_relative "candidhealth/contracts/client"
require_relative "candidhealth/eligibility/client"
require_relative "candidhealth/encounters/client"
require_relative "candidhealth/expected_network_status/client"
require_relative "candidhealth/exports/client"
require_relative "candidhealth/guarantor/client"
require_relative "candidhealth/insurance_adjudications/client"
require_relative "candidhealth/insurance_payments/client"
require_relative "candidhealth/insurance_refunds/client"
require_relative "candidhealth/organization_service_facilities/client"
require_relative "candidhealth/organization_providers/client"
require_relative "candidhealth/patient_payments/client"
require_relative "candidhealth/patient_refunds/client"
require_relative "candidhealth/payers/client"
require_relative "candidhealth/tasks/client"
require_relative "candidhealth/write_offs/client"
require_relative "candidhealth/service_facility/client"

module CandidApiClient
  class Client
    attr_reader :auth, :billing_notes, :contracts, :eligibility, :encounters, :expected_network_status, :exports,
                :guarantor, :insurance_adjudications, :insurance_payments, :insurance_refunds, :organization_service_facilities, :organization_providers, :patient_payments, :patient_refunds, :payers, :tasks, :write_offs, :service_facility

    # @param environment [Environment]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param token [String]
    # @return [Client]
    def initialize(token:, environment: Environment::PRODUCTION, max_retries: nil, timeout_in_seconds: nil)
      @request_client = RequestClient.new(environment: environment, max_retries: max_retries,
                                          timeout_in_seconds: timeout_in_seconds, token: token)
      @auth = Auth::Client.new(request_client: @request_client)
      @billing_notes = BillingNotes::Client.new(request_client: @request_client)
      @contracts = Contracts::Client.new(request_client: @request_client)
      @eligibility = Eligibility::Client.new(request_client: @request_client)
      @encounters = Encounters::Client.new(request_client: @request_client)
      @expected_network_status = ExpectedNetworkStatus::Client.new(request_client: @request_client)
      @exports = Exports::Client.new(request_client: @request_client)
      @guarantor = Guarantor::Client.new(request_client: @request_client)
      @insurance_adjudications = InsuranceAdjudications::Client.new(request_client: @request_client)
      @insurance_payments = InsurancePayments::Client.new(request_client: @request_client)
      @insurance_refunds = InsuranceRefunds::Client.new(request_client: @request_client)
      @organization_service_facilities = OrganizationServiceFacilities::Client.new(request_client: @request_client)
      @organization_providers = OrganizationProviders::Client.new(request_client: @request_client)
      @patient_payments = PatientPayments::Client.new(request_client: @request_client)
      @patient_refunds = PatientRefunds::Client.new(request_client: @request_client)
      @payers = Payers::Client.new(request_client: @request_client)
      @tasks = Tasks::Client.new(request_client: @request_client)
      @write_offs = WriteOffs::Client.new(request_client: @request_client)
      @service_facility = ServiceFacilityClient.new(request_client: @request_client)
    end
  end

  class AsyncClient
    attr_reader :auth, :billing_notes, :contracts, :eligibility, :encounters, :expected_network_status, :exports,
                :guarantor, :insurance_adjudications, :insurance_payments, :insurance_refunds, :organization_service_facilities, :organization_providers, :patient_payments, :patient_refunds, :payers, :tasks, :write_offs, :service_facility

    # @param environment [Environment]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param token [String]
    # @return [AsyncClient]
    def initialize(token:, environment: Environment::PRODUCTION, max_retries: nil, timeout_in_seconds: nil)
      @async_request_client = AsyncRequestClient.new(environment: environment, max_retries: max_retries,
                                                     timeout_in_seconds: timeout_in_seconds, token: token)
      @auth = Auth::AsyncClient.new(request_client: @async_request_client)
      @billing_notes = BillingNotes::AsyncClient.new(request_client: @async_request_client)
      @contracts = Contracts::AsyncClient.new(request_client: @async_request_client)
      @eligibility = Eligibility::AsyncClient.new(request_client: @async_request_client)
      @encounters = Encounters::AsyncClient.new(request_client: @async_request_client)
      @expected_network_status = ExpectedNetworkStatus::AsyncClient.new(request_client: @async_request_client)
      @exports = Exports::AsyncClient.new(request_client: @async_request_client)
      @guarantor = Guarantor::AsyncClient.new(request_client: @async_request_client)
      @insurance_adjudications = InsuranceAdjudications::AsyncClient.new(request_client: @async_request_client)
      @insurance_payments = InsurancePayments::AsyncClient.new(request_client: @async_request_client)
      @insurance_refunds = InsuranceRefunds::AsyncClient.new(request_client: @async_request_client)
      @organization_service_facilities = OrganizationServiceFacilities::AsyncClient.new(request_client: @async_request_client)
      @organization_providers = OrganizationProviders::AsyncClient.new(request_client: @async_request_client)
      @patient_payments = PatientPayments::AsyncClient.new(request_client: @async_request_client)
      @patient_refunds = PatientRefunds::AsyncClient.new(request_client: @async_request_client)
      @payers = Payers::AsyncClient.new(request_client: @async_request_client)
      @tasks = Tasks::AsyncClient.new(request_client: @async_request_client)
      @write_offs = WriteOffs::AsyncClient.new(request_client: @async_request_client)
      @service_facility = AsyncServiceFacilityClient.new(request_client: @async_request_client)
    end
  end
end
