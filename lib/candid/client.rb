

module Candid
  class Client
    # @return [Candid::Client]
    def initialize(base_url:)
      @raw_client = Candid::Internal::Http::RawClient.new(
        base_url: base_url,
        headers: {
          'User-Agent':'candidhealth/1.12.1',
          'X-Fern-Language':'Ruby'
        }
      )
    end
    # @return [Candid::Auth::Client]
    def auth
      @auth ||= Candid::Auth::Client.new(client: @raw_client)
    end
    # @return [Candid::BillingNotes::Client]
    def billingNotes
      @billingNotes ||= Candid::BillingNotes::Client.new(client: @raw_client)
    end
    # @return [Candid::ChargeCaptureBundles::Client]
    def chargeCaptureBundles
      @chargeCaptureBundles ||= Candid::ChargeCaptureBundles::Client.new(client: @raw_client)
    end
    # @return [Candid::ChargeCapture::Client]
    def chargeCapture
      @chargeCapture ||= Candid::ChargeCapture::Client.new(client: @raw_client)
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
    def customSchemas
      @customSchemas ||= Candid::CustomSchemas::Client.new(client: @raw_client)
    end
    # @return [Candid::Eligibility::Client]
    def eligibility
      @eligibility ||= Candid::Eligibility::Client.new(client: @raw_client)
    end
    # @return [Candid::EncounterAttachments::Client]
    def encounterAttachments
      @encounterAttachments ||= Candid::EncounterAttachments::Client.new(client: @raw_client)
    end
    # @return [Candid::EncounterProviders::Client]
    def encounterProviders
      @encounterProviders ||= Candid::EncounterProviders::Client.new(client: @raw_client)
    end
    # @return [Candid::Encounters::Client]
    def encounters
      @encounters ||= Candid::Encounters::Client.new(client: @raw_client)
    end
    # @return [Candid::ExpectedNetworkStatus::Client]
    def expectedNetworkStatus
      @expectedNetworkStatus ||= Candid::ExpectedNetworkStatus::Client.new(client: @raw_client)
    end
    # @return [Candid::Exports::Client]
    def exports
      @exports ||= Candid::Exports::Client.new(client: @raw_client)
    end
    # @return [Candid::ExternalPaymentAccountConfig::Client]
    def externalPaymentAccountConfig
      @externalPaymentAccountConfig ||= Candid::ExternalPaymentAccountConfig::Client.new(client: @raw_client)
    end
    # @return [Candid::FeeSchedules::Client]
    def feeSchedules
      @feeSchedules ||= Candid::FeeSchedules::Client.new(client: @raw_client)
    end
    # @return [Candid::Guarantor::Client]
    def guarantor
      @guarantor ||= Candid::Guarantor::Client.new(client: @raw_client)
    end
    # @return [Candid::HealthCareCodeInformation::Client]
    def healthCareCodeInformation
      @healthCareCodeInformation ||= Candid::HealthCareCodeInformation::Client.new(client: @raw_client)
    end
    # @return [Candid::ImportInvoice::Client]
    def importInvoice
      @importInvoice ||= Candid::ImportInvoice::Client.new(client: @raw_client)
    end
    # @return [Candid::InsuranceAdjudications::Client]
    def insuranceAdjudications
      @insuranceAdjudications ||= Candid::InsuranceAdjudications::Client.new(client: @raw_client)
    end
    # @return [Candid::InsurancePayments::Client]
    def insurancePayments
      @insurancePayments ||= Candid::InsurancePayments::Client.new(client: @raw_client)
    end
    # @return [Candid::InsuranceRefunds::Client]
    def insuranceRefunds
      @insuranceRefunds ||= Candid::InsuranceRefunds::Client.new(client: @raw_client)
    end
    # @return [Candid::MedicationDispense::Client]
    def medicationDispense
      @medicationDispense ||= Candid::MedicationDispense::Client.new(client: @raw_client)
    end
    # @return [Candid::NonInsurancePayerPayments::Client]
    def nonInsurancePayerPayments
      @nonInsurancePayerPayments ||= Candid::NonInsurancePayerPayments::Client.new(client: @raw_client)
    end
    # @return [Candid::NonInsurancePayerRefunds::Client]
    def nonInsurancePayerRefunds
      @nonInsurancePayerRefunds ||= Candid::NonInsurancePayerRefunds::Client.new(client: @raw_client)
    end
    # @return [Candid::NonInsurancePayers::Client]
    def nonInsurancePayers
      @nonInsurancePayers ||= Candid::NonInsurancePayers::Client.new(client: @raw_client)
    end
    # @return [Candid::OrganizationProviders::Client]
    def organizationProviders
      @organizationProviders ||= Candid::OrganizationProviders::Client.new(client: @raw_client)
    end
    # @return [Candid::OrganizationServiceFacilities::Client]
    def organizationServiceFacilities
      @organizationServiceFacilities ||= Candid::OrganizationServiceFacilities::Client.new(client: @raw_client)
    end
    # @return [Candid::PatientAr::Client]
    def patientAr
      @patientAr ||= Candid::PatientAr::Client.new(client: @raw_client)
    end
    # @return [Candid::PatientPayments::Client]
    def patientPayments
      @patientPayments ||= Candid::PatientPayments::Client.new(client: @raw_client)
    end
    # @return [Candid::PatientRefunds::Client]
    def patientRefunds
      @patientRefunds ||= Candid::PatientRefunds::Client.new(client: @raw_client)
    end
    # @return [Candid::PayerPlanGroups::Client]
    def payerPlanGroups
      @payerPlanGroups ||= Candid::PayerPlanGroups::Client.new(client: @raw_client)
    end
    # @return [Candid::Payers::Client]
    def payers
      @payers ||= Candid::Payers::Client.new(client: @raw_client)
    end
    # @return [Candid::ServiceLines::Client]
    def serviceLines
      @serviceLines ||= Candid::ServiceLines::Client.new(client: @raw_client)
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
    def writeOffs
      @writeOffs ||= Candid::WriteOffs::Client.new(client: @raw_client)
    end
    # @return [Candid::PreEncounter::Client]
    def preEncounter
      @preEncounter ||= Candid::PreEncounter::Client.new(client: @raw_client)
    end
    # @return [Candid::Diagnoses::Client]
    def diagnoses
      @diagnoses ||= Candid::Diagnoses::Client.new(client: @raw_client)
    end
    # @return [Candid::ServiceFacility::Client]
    def serviceFacility
      @serviceFacility ||= Candid::ServiceFacility::Client.new(client: @raw_client)
    end
  end
end
