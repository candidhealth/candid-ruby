# frozen_string_literal: true

require_relative "../../../requests"
require_relative "types/charge_capture_data"
require_relative "types/charge_capture_status"
require_relative "types/charge_capture"
require_relative "types/charge_capture_sort_field"
require_relative "../../commons/types/sort_direction"
require "date"
require_relative "../../encounters/v_4/types/billable_status_type"
require_relative "../../encounters/v_4/types/responsible_party_type"
require_relative "types/charge_capture_page"
require_relative "types/charge_capture_post_billed_change"
require "json"
require "async"

module CandidApiClient
  module ChargeCapture
    module V1
      class V1Client
        # @return [CandidApiClient::RequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::RequestClient]
        # @return [CandidApiClient::ChargeCapture::V1::V1Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # @param data [Hash] Charge Capture data contains all the fields needed to create an encounter, but
        #  listed as optional. Candid will use this data when attempting to bundle multiple
        #  Charge Captures into a single encounter.Request of type CandidApiClient::ChargeCapture::V1::Types::ChargeCaptureData, as a Hash
        #   * :vitals (Hash)
        #     * :height_in (Integer)
        #     * :weight_lbs (Integer)
        #     * :blood_pressure_systolic_mmhg (Integer)
        #     * :blood_pressure_diastolic_mmhg (Integer)
        #     * :body_temperature_f (Float)
        #     * :hemoglobin_gdl (Float)
        #     * :hematocrit_pct (Float)
        #   * :diagnoses (Array<CandidApiClient::Diagnoses::Types::DiagnosisCreateOptional>)
        #   * :clinical_notes (Array<CandidApiClient::Encounters::V4::Types::ClinicalNoteCategoryCreateOptional>)
        #   * :claim_supplemental_information (Array<CandidApiClient::Encounters::V4::Types::ClaimSupplementalInformationOptional>)
        #   * :epsdt_referral (Hash)
        #     * :condition_indicator_1 (CandidApiClient::Commons::Types::EpsdtReferralConditionIndicatorCode)
        #     * :condition_indicator_2 (CandidApiClient::Commons::Types::EpsdtReferralConditionIndicatorCode)
        #     * :condition_indicator_3 (CandidApiClient::Commons::Types::EpsdtReferralConditionIndicatorCode)
        #   * :existing_medications (Array<CandidApiClient::Encounters::V4::Types::MedicationOptional>)
        #   * :guarantor (Hash)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :external_id (String)
        #     * :date_of_birth (Date)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :phone_numbers (Array<CandidApiClient::Commons::Types::PhoneNumberOptional>)
        #     * :phone_consent (Boolean)
        #     * :email (String)
        #     * :email_consent (Boolean)
        #   * :subscriber_primary (Hash)
        #     * :insurance_card (Hash)
        #       * :member_id (String)
        #       * :payer_name (String)
        #       * :payer_id (String)
        #       * :rx_bin (String)
        #       * :rx_pcn (String)
        #       * :image_url_front (String)
        #       * :image_url_back (String)
        #       * :emr_payer_crosswalk (CandidApiClient::Commons::Types::EmrPayerCrosswalk)
        #       * :group_number (String)
        #       * :plan_name (String)
        #       * :plan_type (CandidApiClient::Commons::Types::SourceOfPaymentCode)
        #       * :insurance_type (CandidApiClient::Commons::Types::InsuranceTypeCode)
        #       * :payer_plan_group_id (String)
        #     * :patient_relationship_to_subscriber_code (CandidApiClient::Commons::Types::PatientRelationshipToInsuredCodeAll)
        #     * :date_of_birth (Date)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :gender (CandidApiClient::Individual::Types::Gender)
        #   * :subscriber_secondary (Hash)
        #     * :insurance_card (Hash)
        #       * :member_id (String)
        #       * :payer_name (String)
        #       * :payer_id (String)
        #       * :rx_bin (String)
        #       * :rx_pcn (String)
        #       * :image_url_front (String)
        #       * :image_url_back (String)
        #       * :emr_payer_crosswalk (CandidApiClient::Commons::Types::EmrPayerCrosswalk)
        #       * :group_number (String)
        #       * :plan_name (String)
        #       * :plan_type (CandidApiClient::Commons::Types::SourceOfPaymentCode)
        #       * :insurance_type (CandidApiClient::Commons::Types::InsuranceTypeCode)
        #       * :payer_plan_group_id (String)
        #     * :patient_relationship_to_subscriber_code (CandidApiClient::Commons::Types::PatientRelationshipToInsuredCodeAll)
        #     * :date_of_birth (Date)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :gender (CandidApiClient::Individual::Types::Gender)
        #   * :subscriber_tertiary (Hash)
        #     * :insurance_card (Hash)
        #       * :member_id (String)
        #       * :payer_name (String)
        #       * :payer_id (String)
        #       * :rx_bin (String)
        #       * :rx_pcn (String)
        #       * :image_url_front (String)
        #       * :image_url_back (String)
        #       * :emr_payer_crosswalk (CandidApiClient::Commons::Types::EmrPayerCrosswalk)
        #       * :group_number (String)
        #       * :plan_name (String)
        #       * :plan_type (CandidApiClient::Commons::Types::SourceOfPaymentCode)
        #       * :insurance_type (CandidApiClient::Commons::Types::InsuranceTypeCode)
        #       * :payer_plan_group_id (String)
        #     * :patient_relationship_to_subscriber_code (CandidApiClient::Commons::Types::PatientRelationshipToInsuredCodeAll)
        #     * :date_of_birth (Date)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :gender (CandidApiClient::Individual::Types::Gender)
        #   * :interventions (Array<CandidApiClient::Encounters::V4::Types::InterventionOptional>)
        #   * :schema_instances (Array<CandidApiClient::CustomSchemas::V1::Types::SchemaInstanceOptional>)
        #   * :external_claim_submission (Hash)
        #     * :claim_created_at (DateTime)
        #     * :patient_control_number (String)
        #     * :submission_records (Array<CandidApiClient::ClaimSubmission::V1::Types::ClaimSubmissionRecordCreateOptional>)
        #   * :service_lines (Array<CandidApiClient::ServiceLines::V2::Types::ServiceLineCreateOptional>)
        #   * :patient_histories (Array<CandidApiClient::Encounters::V4::Types::PatientHistoryCategoryOptional>)
        #   * :billing_notes (Array<CandidApiClient::BillingNotes::V2::Types::BillingNoteBaseOptional>)
        #   * :patient (Hash)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :gender (CandidApiClient::Individual::Types::Gender)
        #     * :external_id (String)
        #     * :date_of_birth (Date)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :phone_numbers (Array<CandidApiClient::Commons::Types::PhoneNumberOptional>)
        #     * :phone_consent (Boolean)
        #     * :email (String)
        #     * :email_consent (Boolean)
        #     * :non_insurance_payers (Array<String>)
        #     * :non_insurance_payers_info (Array<CandidApiClient::Individual::Types::PatientNonInsurancePayerInfoCreateOptional>)
        #   * :service_facility (Hash)
        #     * :organization_name (String)
        #     * :npi (String)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :secondary_identification (String)
        #   * :rendering_provider (Hash)
        #     * :npi (String)
        #     * :taxonomy_code (String)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :organization_name (String)
        #   * :initial_referring_provider (Hash)
        #     * :npi (String)
        #     * :taxonomy_code (String)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :qualifier (CandidApiClient::Commons::Types::QualifierCode)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :organization_name (String)
        #   * :referring_provider (Hash)
        #     * :npi (String)
        #     * :taxonomy_code (String)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :organization_name (String)
        #   * :supervising_provider (Hash)
        #     * :npi (String)
        #     * :taxonomy_code (String)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :organization_name (String)
        #   * :billing_provider (Hash)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :tax_id (String)
        #     * :npi (String)
        #     * :taxonomy_code (String)
        #     * :provider_commercial_license_type (CandidApiClient::Commons::Types::BillingProviderCommercialLicenseType)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :organization_name (String)
        #   * :pay_to_address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :benefits_assigned_to_provider (Boolean)
        #   * :prior_authorization_number (String)
        #   * :external_id (String)
        #   * :date_of_service (Date)
        #   * :tag_ids (Array<String>)
        #   * :billable_status (CandidApiClient::Encounters::V4::Types::BillableStatusType)
        #   * :responsible_party (CandidApiClient::Encounters::V4::Types::ResponsiblePartyType)
        #   * :provider_accepts_assignment (Boolean)
        #   * :synchronicity (CandidApiClient::Encounters::V4::Types::SynchronicityType)
        #   * :place_of_service_code (CandidApiClient::Commons::Types::FacilityTypeCode)
        #   * :appointment_type (String)
        #   * :end_date_of_service (Date)
        #   * :additional_information (String)
        #   * :service_authorization_exception_code (CandidApiClient::Encounters::V4::Types::ServiceAuthorizationExceptionCode)
        #   * :admission_date (Date)
        #   * :discharge_date (Date)
        #   * :onset_of_current_illness_or_symptom_date (Date)
        #   * :last_menstrual_period_date (Date)
        #   * :delay_reason_code (CandidApiClient::Commons::Types::DelayReasonCode)
        #   * :patient_authorized_release (Boolean)
        #   * :referral_number (String)
        #   * :secondary_payer_carrier_code (String)
        # @param charge_external_id [String] A client-specified unique ID to associate with this encounter; for example, your
        #  internal encounter ID or a Dr. Chrono encounter ID. This field should not
        #  contain PHI.
        # @param originating_system [String] An optional string field denoting the originating system of the charge.
        # @param claim_creation_category [String] An optional string field denoting the user defined category of the claim
        #  creation.
        # @param ehr_source_url [String] External URL reference that links to Charge Capture details within the external
        #  system (e.g. the EHR visit page). Send full URL format for the external link
        #  (e.g. https://emr_charge_capture_url.com/123).
        # @param patient_external_id [String] The patient ID from the external EMR platform for the patient
        # @param status [CandidApiClient::ChargeCapture::V1::Types::ChargeCaptureStatus] the status of the charge capture
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ChargeCapture::V1::Types::ChargeCapture]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.charge_capture.v_1.create(
        #    data: {  },
        #    charge_external_id: "charge_external_id",
        #    patient_external_id: "patient_external_id",
        #    status: PLANNED
        #  )
        def create(data:, charge_external_id:, patient_external_id:, status:, originating_system: nil, claim_creation_category: nil,
                   ehr_source_url: nil, request_options: nil)
          response = @request_client.conn.post do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.body = {
              **(request_options&.additional_body_parameters || {}),
              data: data,
              charge_external_id: charge_external_id,
              originating_system: originating_system,
              claim_creation_category: claim_creation_category,
              ehr_source_url: ehr_source_url,
              patient_external_id: patient_external_id,
              status: status
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/charge_captures/v1"
          end
          CandidApiClient::ChargeCapture::V1::Types::ChargeCapture.from_json(json_object: response.body)
        end

        # Create a Charge Capture from a pre-encounter patient and appointment. This
        #  endpoint is intended to be used by consumers who are managing
        #  patients and appointments in the pre-encounter service and is currently under
        #  development. Consumers who are not taking advantage
        #  of the pre-encounter service should use the standard create endpoint.
        #  At encounter creation time, information from the provided patient and
        #  appointment objects will be populated
        #  where applicable. In particular, the following fields are populated from the
        #  patient and appointment objects:
        #  - Patient
        #  - Referring Provider
        #  - Subscriber Primary
        #  - Subscriber Secondary
        #  - Referral Number
        #  - Responsible Party
        #  - Guarantor
        #  Note that these fields should not be populated in the ChargeCaptureData property
        #  of this endpoint, as they will be overwritten at encounter creation time.
        #  Utilizing this endpoint opts you into automatic updating of the encounter when
        #  the patient or appointment is updated, assuming the
        #  encounter has not already been submitted or adjudicated.
        #
        # @param data [Hash] Charge Capture data contains all the fields needed to create an encounter, but
        #  listed as optional. Candid will use this data when attempting to bundle multiple
        #  Charge Captures into a single encounter.Request of type CandidApiClient::ChargeCapture::V1::Types::ChargeCaptureData, as a Hash
        #   * :vitals (Hash)
        #     * :height_in (Integer)
        #     * :weight_lbs (Integer)
        #     * :blood_pressure_systolic_mmhg (Integer)
        #     * :blood_pressure_diastolic_mmhg (Integer)
        #     * :body_temperature_f (Float)
        #     * :hemoglobin_gdl (Float)
        #     * :hematocrit_pct (Float)
        #   * :diagnoses (Array<CandidApiClient::Diagnoses::Types::DiagnosisCreateOptional>)
        #   * :clinical_notes (Array<CandidApiClient::Encounters::V4::Types::ClinicalNoteCategoryCreateOptional>)
        #   * :claim_supplemental_information (Array<CandidApiClient::Encounters::V4::Types::ClaimSupplementalInformationOptional>)
        #   * :epsdt_referral (Hash)
        #     * :condition_indicator_1 (CandidApiClient::Commons::Types::EpsdtReferralConditionIndicatorCode)
        #     * :condition_indicator_2 (CandidApiClient::Commons::Types::EpsdtReferralConditionIndicatorCode)
        #     * :condition_indicator_3 (CandidApiClient::Commons::Types::EpsdtReferralConditionIndicatorCode)
        #   * :existing_medications (Array<CandidApiClient::Encounters::V4::Types::MedicationOptional>)
        #   * :guarantor (Hash)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :external_id (String)
        #     * :date_of_birth (Date)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :phone_numbers (Array<CandidApiClient::Commons::Types::PhoneNumberOptional>)
        #     * :phone_consent (Boolean)
        #     * :email (String)
        #     * :email_consent (Boolean)
        #   * :subscriber_primary (Hash)
        #     * :insurance_card (Hash)
        #       * :member_id (String)
        #       * :payer_name (String)
        #       * :payer_id (String)
        #       * :rx_bin (String)
        #       * :rx_pcn (String)
        #       * :image_url_front (String)
        #       * :image_url_back (String)
        #       * :emr_payer_crosswalk (CandidApiClient::Commons::Types::EmrPayerCrosswalk)
        #       * :group_number (String)
        #       * :plan_name (String)
        #       * :plan_type (CandidApiClient::Commons::Types::SourceOfPaymentCode)
        #       * :insurance_type (CandidApiClient::Commons::Types::InsuranceTypeCode)
        #       * :payer_plan_group_id (String)
        #     * :patient_relationship_to_subscriber_code (CandidApiClient::Commons::Types::PatientRelationshipToInsuredCodeAll)
        #     * :date_of_birth (Date)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :gender (CandidApiClient::Individual::Types::Gender)
        #   * :subscriber_secondary (Hash)
        #     * :insurance_card (Hash)
        #       * :member_id (String)
        #       * :payer_name (String)
        #       * :payer_id (String)
        #       * :rx_bin (String)
        #       * :rx_pcn (String)
        #       * :image_url_front (String)
        #       * :image_url_back (String)
        #       * :emr_payer_crosswalk (CandidApiClient::Commons::Types::EmrPayerCrosswalk)
        #       * :group_number (String)
        #       * :plan_name (String)
        #       * :plan_type (CandidApiClient::Commons::Types::SourceOfPaymentCode)
        #       * :insurance_type (CandidApiClient::Commons::Types::InsuranceTypeCode)
        #       * :payer_plan_group_id (String)
        #     * :patient_relationship_to_subscriber_code (CandidApiClient::Commons::Types::PatientRelationshipToInsuredCodeAll)
        #     * :date_of_birth (Date)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :gender (CandidApiClient::Individual::Types::Gender)
        #   * :subscriber_tertiary (Hash)
        #     * :insurance_card (Hash)
        #       * :member_id (String)
        #       * :payer_name (String)
        #       * :payer_id (String)
        #       * :rx_bin (String)
        #       * :rx_pcn (String)
        #       * :image_url_front (String)
        #       * :image_url_back (String)
        #       * :emr_payer_crosswalk (CandidApiClient::Commons::Types::EmrPayerCrosswalk)
        #       * :group_number (String)
        #       * :plan_name (String)
        #       * :plan_type (CandidApiClient::Commons::Types::SourceOfPaymentCode)
        #       * :insurance_type (CandidApiClient::Commons::Types::InsuranceTypeCode)
        #       * :payer_plan_group_id (String)
        #     * :patient_relationship_to_subscriber_code (CandidApiClient::Commons::Types::PatientRelationshipToInsuredCodeAll)
        #     * :date_of_birth (Date)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :gender (CandidApiClient::Individual::Types::Gender)
        #   * :interventions (Array<CandidApiClient::Encounters::V4::Types::InterventionOptional>)
        #   * :schema_instances (Array<CandidApiClient::CustomSchemas::V1::Types::SchemaInstanceOptional>)
        #   * :external_claim_submission (Hash)
        #     * :claim_created_at (DateTime)
        #     * :patient_control_number (String)
        #     * :submission_records (Array<CandidApiClient::ClaimSubmission::V1::Types::ClaimSubmissionRecordCreateOptional>)
        #   * :service_lines (Array<CandidApiClient::ServiceLines::V2::Types::ServiceLineCreateOptional>)
        #   * :patient_histories (Array<CandidApiClient::Encounters::V4::Types::PatientHistoryCategoryOptional>)
        #   * :billing_notes (Array<CandidApiClient::BillingNotes::V2::Types::BillingNoteBaseOptional>)
        #   * :patient (Hash)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :gender (CandidApiClient::Individual::Types::Gender)
        #     * :external_id (String)
        #     * :date_of_birth (Date)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :phone_numbers (Array<CandidApiClient::Commons::Types::PhoneNumberOptional>)
        #     * :phone_consent (Boolean)
        #     * :email (String)
        #     * :email_consent (Boolean)
        #     * :non_insurance_payers (Array<String>)
        #     * :non_insurance_payers_info (Array<CandidApiClient::Individual::Types::PatientNonInsurancePayerInfoCreateOptional>)
        #   * :service_facility (Hash)
        #     * :organization_name (String)
        #     * :npi (String)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :secondary_identification (String)
        #   * :rendering_provider (Hash)
        #     * :npi (String)
        #     * :taxonomy_code (String)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :organization_name (String)
        #   * :initial_referring_provider (Hash)
        #     * :npi (String)
        #     * :taxonomy_code (String)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :qualifier (CandidApiClient::Commons::Types::QualifierCode)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :organization_name (String)
        #   * :referring_provider (Hash)
        #     * :npi (String)
        #     * :taxonomy_code (String)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :organization_name (String)
        #   * :supervising_provider (Hash)
        #     * :npi (String)
        #     * :taxonomy_code (String)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :organization_name (String)
        #   * :billing_provider (Hash)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :tax_id (String)
        #     * :npi (String)
        #     * :taxonomy_code (String)
        #     * :provider_commercial_license_type (CandidApiClient::Commons::Types::BillingProviderCommercialLicenseType)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :organization_name (String)
        #   * :pay_to_address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :benefits_assigned_to_provider (Boolean)
        #   * :prior_authorization_number (String)
        #   * :external_id (String)
        #   * :date_of_service (Date)
        #   * :tag_ids (Array<String>)
        #   * :billable_status (CandidApiClient::Encounters::V4::Types::BillableStatusType)
        #   * :responsible_party (CandidApiClient::Encounters::V4::Types::ResponsiblePartyType)
        #   * :provider_accepts_assignment (Boolean)
        #   * :synchronicity (CandidApiClient::Encounters::V4::Types::SynchronicityType)
        #   * :place_of_service_code (CandidApiClient::Commons::Types::FacilityTypeCode)
        #   * :appointment_type (String)
        #   * :end_date_of_service (Date)
        #   * :additional_information (String)
        #   * :service_authorization_exception_code (CandidApiClient::Encounters::V4::Types::ServiceAuthorizationExceptionCode)
        #   * :admission_date (Date)
        #   * :discharge_date (Date)
        #   * :onset_of_current_illness_or_symptom_date (Date)
        #   * :last_menstrual_period_date (Date)
        #   * :delay_reason_code (CandidApiClient::Commons::Types::DelayReasonCode)
        #   * :patient_authorized_release (Boolean)
        #   * :referral_number (String)
        #   * :secondary_payer_carrier_code (String)
        # @param charge_external_id [String] A client-specified unique ID to associate with this encounter; for example, your
        #  internal encounter ID or a Dr. Chrono encounter ID. This field should not
        #  contain PHI.
        # @param pre_encounter_patient_id [String]
        # @param pre_encounter_appointment_ids [Array<String>]
        # @param originating_system [String] An optional string field denoting the originating system of the charge.
        # @param claim_creation_category [String] An optional string field denoting the user defined category of the claim
        #  creation.
        # @param ehr_source_url [String] External URL reference that links to Charge Capture details within the external
        #  system (e.g. the EHR visit page). Send full URL format for the external link
        #  (e.g. https://emr_charge_capture_url.com/123).
        # @param status [CandidApiClient::ChargeCapture::V1::Types::ChargeCaptureStatus] the status of the charge capture
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ChargeCapture::V1::Types::ChargeCapture]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.charge_capture.v_1.create_from_pre_encounter_patient(
        #    data: {  },
        #    charge_external_id: "charge_external_id",
        #    pre_encounter_patient_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    pre_encounter_appointment_ids: ["d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32"],
        #    status: PLANNED
        #  )
        def create_from_pre_encounter_patient(data:, charge_external_id:, pre_encounter_patient_id:,
                                              pre_encounter_appointment_ids:, status:, originating_system: nil, claim_creation_category: nil, ehr_source_url: nil, request_options: nil)
          response = @request_client.conn.post do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.body = {
              **(request_options&.additional_body_parameters || {}),
              data: data,
              charge_external_id: charge_external_id,
              pre_encounter_patient_id: pre_encounter_patient_id,
              pre_encounter_appointment_ids: pre_encounter_appointment_ids,
              originating_system: originating_system,
              claim_creation_category: claim_creation_category,
              ehr_source_url: ehr_source_url,
              status: status
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/charge_captures/v1/create-from-pre-encounter"
          end
          CandidApiClient::ChargeCapture::V1::Types::ChargeCapture.from_json(json_object: response.body)
        end

        # @param charge_capture_id [String]
        # @param data [Hash] Request of type CandidApiClient::ChargeCapture::V1::Types::ChargeCaptureData, as a Hash
        #   * :vitals (Hash)
        #     * :height_in (Integer)
        #     * :weight_lbs (Integer)
        #     * :blood_pressure_systolic_mmhg (Integer)
        #     * :blood_pressure_diastolic_mmhg (Integer)
        #     * :body_temperature_f (Float)
        #     * :hemoglobin_gdl (Float)
        #     * :hematocrit_pct (Float)
        #   * :diagnoses (Array<CandidApiClient::Diagnoses::Types::DiagnosisCreateOptional>)
        #   * :clinical_notes (Array<CandidApiClient::Encounters::V4::Types::ClinicalNoteCategoryCreateOptional>)
        #   * :claim_supplemental_information (Array<CandidApiClient::Encounters::V4::Types::ClaimSupplementalInformationOptional>)
        #   * :epsdt_referral (Hash)
        #     * :condition_indicator_1 (CandidApiClient::Commons::Types::EpsdtReferralConditionIndicatorCode)
        #     * :condition_indicator_2 (CandidApiClient::Commons::Types::EpsdtReferralConditionIndicatorCode)
        #     * :condition_indicator_3 (CandidApiClient::Commons::Types::EpsdtReferralConditionIndicatorCode)
        #   * :existing_medications (Array<CandidApiClient::Encounters::V4::Types::MedicationOptional>)
        #   * :guarantor (Hash)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :external_id (String)
        #     * :date_of_birth (Date)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :phone_numbers (Array<CandidApiClient::Commons::Types::PhoneNumberOptional>)
        #     * :phone_consent (Boolean)
        #     * :email (String)
        #     * :email_consent (Boolean)
        #   * :subscriber_primary (Hash)
        #     * :insurance_card (Hash)
        #       * :member_id (String)
        #       * :payer_name (String)
        #       * :payer_id (String)
        #       * :rx_bin (String)
        #       * :rx_pcn (String)
        #       * :image_url_front (String)
        #       * :image_url_back (String)
        #       * :emr_payer_crosswalk (CandidApiClient::Commons::Types::EmrPayerCrosswalk)
        #       * :group_number (String)
        #       * :plan_name (String)
        #       * :plan_type (CandidApiClient::Commons::Types::SourceOfPaymentCode)
        #       * :insurance_type (CandidApiClient::Commons::Types::InsuranceTypeCode)
        #       * :payer_plan_group_id (String)
        #     * :patient_relationship_to_subscriber_code (CandidApiClient::Commons::Types::PatientRelationshipToInsuredCodeAll)
        #     * :date_of_birth (Date)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :gender (CandidApiClient::Individual::Types::Gender)
        #   * :subscriber_secondary (Hash)
        #     * :insurance_card (Hash)
        #       * :member_id (String)
        #       * :payer_name (String)
        #       * :payer_id (String)
        #       * :rx_bin (String)
        #       * :rx_pcn (String)
        #       * :image_url_front (String)
        #       * :image_url_back (String)
        #       * :emr_payer_crosswalk (CandidApiClient::Commons::Types::EmrPayerCrosswalk)
        #       * :group_number (String)
        #       * :plan_name (String)
        #       * :plan_type (CandidApiClient::Commons::Types::SourceOfPaymentCode)
        #       * :insurance_type (CandidApiClient::Commons::Types::InsuranceTypeCode)
        #       * :payer_plan_group_id (String)
        #     * :patient_relationship_to_subscriber_code (CandidApiClient::Commons::Types::PatientRelationshipToInsuredCodeAll)
        #     * :date_of_birth (Date)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :gender (CandidApiClient::Individual::Types::Gender)
        #   * :subscriber_tertiary (Hash)
        #     * :insurance_card (Hash)
        #       * :member_id (String)
        #       * :payer_name (String)
        #       * :payer_id (String)
        #       * :rx_bin (String)
        #       * :rx_pcn (String)
        #       * :image_url_front (String)
        #       * :image_url_back (String)
        #       * :emr_payer_crosswalk (CandidApiClient::Commons::Types::EmrPayerCrosswalk)
        #       * :group_number (String)
        #       * :plan_name (String)
        #       * :plan_type (CandidApiClient::Commons::Types::SourceOfPaymentCode)
        #       * :insurance_type (CandidApiClient::Commons::Types::InsuranceTypeCode)
        #       * :payer_plan_group_id (String)
        #     * :patient_relationship_to_subscriber_code (CandidApiClient::Commons::Types::PatientRelationshipToInsuredCodeAll)
        #     * :date_of_birth (Date)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :gender (CandidApiClient::Individual::Types::Gender)
        #   * :interventions (Array<CandidApiClient::Encounters::V4::Types::InterventionOptional>)
        #   * :schema_instances (Array<CandidApiClient::CustomSchemas::V1::Types::SchemaInstanceOptional>)
        #   * :external_claim_submission (Hash)
        #     * :claim_created_at (DateTime)
        #     * :patient_control_number (String)
        #     * :submission_records (Array<CandidApiClient::ClaimSubmission::V1::Types::ClaimSubmissionRecordCreateOptional>)
        #   * :service_lines (Array<CandidApiClient::ServiceLines::V2::Types::ServiceLineCreateOptional>)
        #   * :patient_histories (Array<CandidApiClient::Encounters::V4::Types::PatientHistoryCategoryOptional>)
        #   * :billing_notes (Array<CandidApiClient::BillingNotes::V2::Types::BillingNoteBaseOptional>)
        #   * :patient (Hash)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :gender (CandidApiClient::Individual::Types::Gender)
        #     * :external_id (String)
        #     * :date_of_birth (Date)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :phone_numbers (Array<CandidApiClient::Commons::Types::PhoneNumberOptional>)
        #     * :phone_consent (Boolean)
        #     * :email (String)
        #     * :email_consent (Boolean)
        #     * :non_insurance_payers (Array<String>)
        #     * :non_insurance_payers_info (Array<CandidApiClient::Individual::Types::PatientNonInsurancePayerInfoCreateOptional>)
        #   * :service_facility (Hash)
        #     * :organization_name (String)
        #     * :npi (String)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :secondary_identification (String)
        #   * :rendering_provider (Hash)
        #     * :npi (String)
        #     * :taxonomy_code (String)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :organization_name (String)
        #   * :initial_referring_provider (Hash)
        #     * :npi (String)
        #     * :taxonomy_code (String)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :qualifier (CandidApiClient::Commons::Types::QualifierCode)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :organization_name (String)
        #   * :referring_provider (Hash)
        #     * :npi (String)
        #     * :taxonomy_code (String)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :organization_name (String)
        #   * :supervising_provider (Hash)
        #     * :npi (String)
        #     * :taxonomy_code (String)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :organization_name (String)
        #   * :billing_provider (Hash)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :tax_id (String)
        #     * :npi (String)
        #     * :taxonomy_code (String)
        #     * :provider_commercial_license_type (CandidApiClient::Commons::Types::BillingProviderCommercialLicenseType)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :organization_name (String)
        #   * :pay_to_address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :benefits_assigned_to_provider (Boolean)
        #   * :prior_authorization_number (String)
        #   * :external_id (String)
        #   * :date_of_service (Date)
        #   * :tag_ids (Array<String>)
        #   * :billable_status (CandidApiClient::Encounters::V4::Types::BillableStatusType)
        #   * :responsible_party (CandidApiClient::Encounters::V4::Types::ResponsiblePartyType)
        #   * :provider_accepts_assignment (Boolean)
        #   * :synchronicity (CandidApiClient::Encounters::V4::Types::SynchronicityType)
        #   * :place_of_service_code (CandidApiClient::Commons::Types::FacilityTypeCode)
        #   * :appointment_type (String)
        #   * :end_date_of_service (Date)
        #   * :additional_information (String)
        #   * :service_authorization_exception_code (CandidApiClient::Encounters::V4::Types::ServiceAuthorizationExceptionCode)
        #   * :admission_date (Date)
        #   * :discharge_date (Date)
        #   * :onset_of_current_illness_or_symptom_date (Date)
        #   * :last_menstrual_period_date (Date)
        #   * :delay_reason_code (CandidApiClient::Commons::Types::DelayReasonCode)
        #   * :patient_authorized_release (Boolean)
        #   * :referral_number (String)
        #   * :secondary_payer_carrier_code (String)
        # @param charge_external_id [String] A client-specified unique ID to associate with this encounter;
        #  for example, your internal encounter ID or a Dr. Chrono encounter ID.
        #  This field should not contain PHI.
        # @param ehr_source_url [String] External URL reference that links to Charge Capture details within the external
        #  system (e.g. the EHR visit page).
        #  Send full URL format for the external link (e.g.
        #  https://emr_charge_capture_url.com/123).
        # @param originating_system [String] An optional string field denoting the originating system of the charge.
        # @param claim_creation_category [String] An optional string field denoting the user defined category of the claim
        #  creation.
        # @param patient_external_id [String] The patient ID from the external EMR platform for the patient
        # @param status [CandidApiClient::ChargeCapture::V1::Types::ChargeCaptureStatus] the status of the charge capture
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ChargeCapture::V1::Types::ChargeCapture]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.charge_capture.v_1.update(charge_capture_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def update(charge_capture_id:, data: nil, charge_external_id: nil, ehr_source_url: nil,
                   originating_system: nil, claim_creation_category: nil, patient_external_id: nil, status: nil, request_options: nil)
          response = @request_client.conn.patch do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.body = {
              **(request_options&.additional_body_parameters || {}),
              data: data,
              charge_external_id: charge_external_id,
              ehr_source_url: ehr_source_url,
              originating_system: originating_system,
              claim_creation_category: claim_creation_category,
              patient_external_id: patient_external_id,
              status: status
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/charge_captures/v1/#{charge_capture_id}"
          end
          CandidApiClient::ChargeCapture::V1::Types::ChargeCapture.from_json(json_object: response.body)
        end

        # @param charge_capture_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ChargeCapture::V1::Types::ChargeCapture]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.charge_capture.v_1.get(charge_capture_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get(charge_capture_id:, request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/charge_captures/v1/#{charge_capture_id}"
          end
          CandidApiClient::ChargeCapture::V1::Types::ChargeCapture.from_json(json_object: response.body)
        end

        # @param limit [Integer] Maximum number of entities per page, defaults to 100.
        # @param sort [CandidApiClient::ChargeCapture::V1::Types::ChargeCaptureSortField] Defaults to created_at
        # @param sort_direction [CandidApiClient::Commons::Types::SortDirection] Sort direction. Defaults to descending order if not provided.
        # @param page_token [String]
        # @param patient_external_id [String] The patient ID from the external EMR platform for the patient
        # @param status [CandidApiClient::ChargeCapture::V1::Types::ChargeCaptureStatus] the status of the charge captures
        # @param charge_external_id [String] A client-specified unique ID to associate with this encounter;
        #  for example, your internal encounter ID or a Dr. Chrono encounter ID.
        #  This field should not contain PHI.
        # @param date_of_service_min [Date] Date formatted as YYYY-MM-DD; eg: 2019-08-24.
        #  This date must be the local date in the timezone where the service occurred.
        # @param date_of_service_max [Date] Date formatted as YYYY-MM-DD; eg: 2019-08-24.
        #  This date must be the local date in the timezone where the service occurred.
        # @param claim_ids [String] A list of claim IDs to filter by. This will return all charge captures that have
        #  a resulting claim with one of the IDs in this list.
        # @param claim_creation_ids [String] A list of Claim Creation IDs to filter by.
        # @param billing_provider_npis [String] A list of billing provider NPIs to filter by. This will return all charge
        #  captures with one of the NPIs in this list.
        # @param service_facility_name [String] A string to filter by. This will return all charge captures with this service
        #  facility name.
        # @param primary_payer_ids [String] A list of primary payer IDs to filter by. This will return all charge captures
        #  with one of the primary payer IDs in this list.
        # @param rendering_provider_npis [String] A list of rendering provider NPIs to filter by. This will return all charge
        #  captures with one of the NPIs in this list.
        # @param rendering_provider_names [String] A list of rendering provider names to filter by. This will return all charge
        #  captures with one of the names in this list.
        # @param supervising_provider_npis [String] A list of supervising provider NPIs to filter by. This will return all charge
        #  captures with one of the NPIs in this list.
        # @param supervising_provider_names [String] A list of supervising provider names to filter by. This will return all charge
        #  captures with one of the names in this list.
        # @param exclude_charges_linked_to_claims [Boolean] Whether to exclude charge captures which are part of a claim creation.
        # @param patient_external_id_ranked_sort [String] The patient ID from the external EMR platform for the patient
        # @param status_ranked_sort [CandidApiClient::ChargeCapture::V1::Types::ChargeCaptureStatus] The charge capture status to show first
        # @param charge_external_id_ranked_sort [String] A client-specified unique ID to associate with this encounter;
        #  for example, your internal encounter ID or a Dr. Chrono encounter ID.
        #  This field should not contain PHI.
        # @param date_of_service_min_ranked_sort [Date] Date formatted as YYYY-MM-DD; eg: 2019-08-24.
        #  This date must be the local date in the timezone where the service occurred.
        # @param date_of_service_max_ranked_sort [Date] Date formatted as YYYY-MM-DD; eg: 2019-08-24.
        #  This date must be the local date in the timezone where the service occurred.
        # @param search_term [String] Filter by any of the following fields: charge_id, claim_id, patient external_id,
        #  patient date of birth, patient first name, patient last name,
        #  or charge external id.
        # @param billable_status [CandidApiClient::Encounters::V4::Types::BillableStatusType] Defines if the Encounter is to be billed by Candid to the responsible_party.
        #  Examples for when this should be set to NOT_BILLABLE include if the Encounter
        #  has not occurred yet or if there is no intention of ever billing the
        #  responsible_party.
        # @param responsible_party [CandidApiClient::Encounters::V4::Types::ResponsiblePartyType] Defines the party to be billed with the initial balance owed on the claim. Use
        #  SELF_PAY if you intend to bill self pay/cash pay.
        # @param claim_ids_ranked_sort [String] A list of claim IDs to show first. This will return all charge captures that
        #  have a resulting claim with one of the IDs in this list.
        # @param claim_creation_ids_ranked_sort [String] A list of Claim Creation IDs to show first.
        # @param billing_provider_npis_ranked_sort [String] A list of billing provider NPIs to show first. This will return all charge
        #  captures with one of the NPIs in this list.
        # @param service_facility_name_ranked_sort [String] A string to show first. This will return all charge captures with this service
        #  facility name.
        # @param primary_payer_ids_ranked_sort [String] A list of primary payer IDs to show first. This will return all charge captures
        #  with one of the primary payer IDs in this list.
        # @param rendering_provider_npis_ranked_sort [String] A list of rendering provider NPIs to show first. This will return all charge
        #  captures with one of the NPIs in this list.
        # @param rendering_provider_names_ranked_sort [String] A list of rendering provider names to show first. This will return all charge
        #  captures with one of the names in this list.
        # @param supervising_provider_npis_ranked_sort [String] A list of supervising provider NPIs to show first. This will return all charge
        #  captures with one of the NPIs in this list.
        # @param supervising_provider_names_ranked_sort [String] A list of supervising provider names to show first. This will return all charge
        #  captures with one of the names in this list.
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ChargeCapture::V1::Types::ChargeCapturePage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.charge_capture.v_1.get_all
        def get_all(limit: nil, sort: nil, sort_direction: nil, page_token: nil, patient_external_id: nil, status: nil,
                    charge_external_id: nil, date_of_service_min: nil, date_of_service_max: nil, claim_ids: nil, claim_creation_ids: nil, billing_provider_npis: nil, service_facility_name: nil, primary_payer_ids: nil, rendering_provider_npis: nil, rendering_provider_names: nil, supervising_provider_npis: nil, supervising_provider_names: nil, exclude_charges_linked_to_claims: nil, patient_external_id_ranked_sort: nil, status_ranked_sort: nil, charge_external_id_ranked_sort: nil, date_of_service_min_ranked_sort: nil, date_of_service_max_ranked_sort: nil, search_term: nil, billable_status: nil, responsible_party: nil, claim_ids_ranked_sort: nil, claim_creation_ids_ranked_sort: nil, billing_provider_npis_ranked_sort: nil, service_facility_name_ranked_sort: nil, primary_payer_ids_ranked_sort: nil, rendering_provider_npis_ranked_sort: nil, rendering_provider_names_ranked_sort: nil, supervising_provider_npis_ranked_sort: nil, supervising_provider_names_ranked_sort: nil, request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.params = {
              **(request_options&.additional_query_parameters || {}),
              "limit": limit,
              "sort": sort,
              "sort_direction": sort_direction,
              "page_token": page_token,
              "patient_external_id": patient_external_id,
              "status": status,
              "charge_external_id": charge_external_id,
              "date_of_service_min": date_of_service_min,
              "date_of_service_max": date_of_service_max,
              "claim_ids": claim_ids,
              "claim_creation_ids": claim_creation_ids,
              "billing_provider_npis": billing_provider_npis,
              "service_facility_name": service_facility_name,
              "primary_payer_ids": primary_payer_ids,
              "rendering_provider_npis": rendering_provider_npis,
              "rendering_provider_names": rendering_provider_names,
              "supervising_provider_npis": supervising_provider_npis,
              "supervising_provider_names": supervising_provider_names,
              "exclude_charges_linked_to_claims": exclude_charges_linked_to_claims,
              "patient_external_id_ranked_sort": patient_external_id_ranked_sort,
              "status_ranked_sort": status_ranked_sort,
              "charge_external_id_ranked_sort": charge_external_id_ranked_sort,
              "date_of_service_min_ranked_sort": date_of_service_min_ranked_sort,
              "date_of_service_max_ranked_sort": date_of_service_max_ranked_sort,
              "search_term": search_term,
              "billable_status": billable_status,
              "responsible_party": responsible_party,
              "claim_ids_ranked_sort": claim_ids_ranked_sort,
              "claim_creation_ids_ranked_sort": claim_creation_ids_ranked_sort,
              "billing_provider_npis_ranked_sort": billing_provider_npis_ranked_sort,
              "service_facility_name_ranked_sort": service_facility_name_ranked_sort,
              "primary_payer_ids_ranked_sort": primary_payer_ids_ranked_sort,
              "rendering_provider_npis_ranked_sort": rendering_provider_npis_ranked_sort,
              "rendering_provider_names_ranked_sort": rendering_provider_names_ranked_sort,
              "supervising_provider_npis_ranked_sort": supervising_provider_npis_ranked_sort,
              "supervising_provider_names_ranked_sort": supervising_provider_names_ranked_sort
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/charge_captures/v1"
          end
          CandidApiClient::ChargeCapture::V1::Types::ChargeCapturePage.from_json(json_object: response.body)
        end

        # @param charge_capture_change_ids [Array<String>] A list of UUIDs corresponding to ChargeCapturePostBilledChanges.
        #  All of the charges sent will be marked as resolved
        # @param resolved [Boolean] Whether the change has been resolved. If true, the change will be marked as
        #  resolved.
        #  If false, the change will be marked as unresolved.
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Array<CandidApiClient::ChargeCapture::V1::Types::ChargeCapturePostBilledChange>]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.charge_capture.v_1.update_post_billed_changes(charge_capture_change_ids: ["d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32"], resolved: true)
        def update_post_billed_changes(charge_capture_change_ids:, resolved:, request_options: nil)
          response = @request_client.conn.patch do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.body = {
              **(request_options&.additional_body_parameters || {}),
              charge_capture_change_ids: charge_capture_change_ids,
              resolved: resolved
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/charge_captures/v1/changes"
          end
          parsed_json = JSON.parse(response.body)
          parsed_json&.map do |item|
            item = item.to_json
            CandidApiClient::ChargeCapture::V1::Types::ChargeCapturePostBilledChange.from_json(json_object: item)
          end
        end
      end

      class AsyncV1Client
        # @return [CandidApiClient::AsyncRequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::AsyncRequestClient]
        # @return [CandidApiClient::ChargeCapture::V1::AsyncV1Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # @param data [Hash] Charge Capture data contains all the fields needed to create an encounter, but
        #  listed as optional. Candid will use this data when attempting to bundle multiple
        #  Charge Captures into a single encounter.Request of type CandidApiClient::ChargeCapture::V1::Types::ChargeCaptureData, as a Hash
        #   * :vitals (Hash)
        #     * :height_in (Integer)
        #     * :weight_lbs (Integer)
        #     * :blood_pressure_systolic_mmhg (Integer)
        #     * :blood_pressure_diastolic_mmhg (Integer)
        #     * :body_temperature_f (Float)
        #     * :hemoglobin_gdl (Float)
        #     * :hematocrit_pct (Float)
        #   * :diagnoses (Array<CandidApiClient::Diagnoses::Types::DiagnosisCreateOptional>)
        #   * :clinical_notes (Array<CandidApiClient::Encounters::V4::Types::ClinicalNoteCategoryCreateOptional>)
        #   * :claim_supplemental_information (Array<CandidApiClient::Encounters::V4::Types::ClaimSupplementalInformationOptional>)
        #   * :epsdt_referral (Hash)
        #     * :condition_indicator_1 (CandidApiClient::Commons::Types::EpsdtReferralConditionIndicatorCode)
        #     * :condition_indicator_2 (CandidApiClient::Commons::Types::EpsdtReferralConditionIndicatorCode)
        #     * :condition_indicator_3 (CandidApiClient::Commons::Types::EpsdtReferralConditionIndicatorCode)
        #   * :existing_medications (Array<CandidApiClient::Encounters::V4::Types::MedicationOptional>)
        #   * :guarantor (Hash)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :external_id (String)
        #     * :date_of_birth (Date)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :phone_numbers (Array<CandidApiClient::Commons::Types::PhoneNumberOptional>)
        #     * :phone_consent (Boolean)
        #     * :email (String)
        #     * :email_consent (Boolean)
        #   * :subscriber_primary (Hash)
        #     * :insurance_card (Hash)
        #       * :member_id (String)
        #       * :payer_name (String)
        #       * :payer_id (String)
        #       * :rx_bin (String)
        #       * :rx_pcn (String)
        #       * :image_url_front (String)
        #       * :image_url_back (String)
        #       * :emr_payer_crosswalk (CandidApiClient::Commons::Types::EmrPayerCrosswalk)
        #       * :group_number (String)
        #       * :plan_name (String)
        #       * :plan_type (CandidApiClient::Commons::Types::SourceOfPaymentCode)
        #       * :insurance_type (CandidApiClient::Commons::Types::InsuranceTypeCode)
        #       * :payer_plan_group_id (String)
        #     * :patient_relationship_to_subscriber_code (CandidApiClient::Commons::Types::PatientRelationshipToInsuredCodeAll)
        #     * :date_of_birth (Date)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :gender (CandidApiClient::Individual::Types::Gender)
        #   * :subscriber_secondary (Hash)
        #     * :insurance_card (Hash)
        #       * :member_id (String)
        #       * :payer_name (String)
        #       * :payer_id (String)
        #       * :rx_bin (String)
        #       * :rx_pcn (String)
        #       * :image_url_front (String)
        #       * :image_url_back (String)
        #       * :emr_payer_crosswalk (CandidApiClient::Commons::Types::EmrPayerCrosswalk)
        #       * :group_number (String)
        #       * :plan_name (String)
        #       * :plan_type (CandidApiClient::Commons::Types::SourceOfPaymentCode)
        #       * :insurance_type (CandidApiClient::Commons::Types::InsuranceTypeCode)
        #       * :payer_plan_group_id (String)
        #     * :patient_relationship_to_subscriber_code (CandidApiClient::Commons::Types::PatientRelationshipToInsuredCodeAll)
        #     * :date_of_birth (Date)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :gender (CandidApiClient::Individual::Types::Gender)
        #   * :subscriber_tertiary (Hash)
        #     * :insurance_card (Hash)
        #       * :member_id (String)
        #       * :payer_name (String)
        #       * :payer_id (String)
        #       * :rx_bin (String)
        #       * :rx_pcn (String)
        #       * :image_url_front (String)
        #       * :image_url_back (String)
        #       * :emr_payer_crosswalk (CandidApiClient::Commons::Types::EmrPayerCrosswalk)
        #       * :group_number (String)
        #       * :plan_name (String)
        #       * :plan_type (CandidApiClient::Commons::Types::SourceOfPaymentCode)
        #       * :insurance_type (CandidApiClient::Commons::Types::InsuranceTypeCode)
        #       * :payer_plan_group_id (String)
        #     * :patient_relationship_to_subscriber_code (CandidApiClient::Commons::Types::PatientRelationshipToInsuredCodeAll)
        #     * :date_of_birth (Date)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :gender (CandidApiClient::Individual::Types::Gender)
        #   * :interventions (Array<CandidApiClient::Encounters::V4::Types::InterventionOptional>)
        #   * :schema_instances (Array<CandidApiClient::CustomSchemas::V1::Types::SchemaInstanceOptional>)
        #   * :external_claim_submission (Hash)
        #     * :claim_created_at (DateTime)
        #     * :patient_control_number (String)
        #     * :submission_records (Array<CandidApiClient::ClaimSubmission::V1::Types::ClaimSubmissionRecordCreateOptional>)
        #   * :service_lines (Array<CandidApiClient::ServiceLines::V2::Types::ServiceLineCreateOptional>)
        #   * :patient_histories (Array<CandidApiClient::Encounters::V4::Types::PatientHistoryCategoryOptional>)
        #   * :billing_notes (Array<CandidApiClient::BillingNotes::V2::Types::BillingNoteBaseOptional>)
        #   * :patient (Hash)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :gender (CandidApiClient::Individual::Types::Gender)
        #     * :external_id (String)
        #     * :date_of_birth (Date)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :phone_numbers (Array<CandidApiClient::Commons::Types::PhoneNumberOptional>)
        #     * :phone_consent (Boolean)
        #     * :email (String)
        #     * :email_consent (Boolean)
        #     * :non_insurance_payers (Array<String>)
        #     * :non_insurance_payers_info (Array<CandidApiClient::Individual::Types::PatientNonInsurancePayerInfoCreateOptional>)
        #   * :service_facility (Hash)
        #     * :organization_name (String)
        #     * :npi (String)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :secondary_identification (String)
        #   * :rendering_provider (Hash)
        #     * :npi (String)
        #     * :taxonomy_code (String)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :organization_name (String)
        #   * :initial_referring_provider (Hash)
        #     * :npi (String)
        #     * :taxonomy_code (String)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :qualifier (CandidApiClient::Commons::Types::QualifierCode)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :organization_name (String)
        #   * :referring_provider (Hash)
        #     * :npi (String)
        #     * :taxonomy_code (String)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :organization_name (String)
        #   * :supervising_provider (Hash)
        #     * :npi (String)
        #     * :taxonomy_code (String)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :organization_name (String)
        #   * :billing_provider (Hash)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :tax_id (String)
        #     * :npi (String)
        #     * :taxonomy_code (String)
        #     * :provider_commercial_license_type (CandidApiClient::Commons::Types::BillingProviderCommercialLicenseType)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :organization_name (String)
        #   * :pay_to_address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :benefits_assigned_to_provider (Boolean)
        #   * :prior_authorization_number (String)
        #   * :external_id (String)
        #   * :date_of_service (Date)
        #   * :tag_ids (Array<String>)
        #   * :billable_status (CandidApiClient::Encounters::V4::Types::BillableStatusType)
        #   * :responsible_party (CandidApiClient::Encounters::V4::Types::ResponsiblePartyType)
        #   * :provider_accepts_assignment (Boolean)
        #   * :synchronicity (CandidApiClient::Encounters::V4::Types::SynchronicityType)
        #   * :place_of_service_code (CandidApiClient::Commons::Types::FacilityTypeCode)
        #   * :appointment_type (String)
        #   * :end_date_of_service (Date)
        #   * :additional_information (String)
        #   * :service_authorization_exception_code (CandidApiClient::Encounters::V4::Types::ServiceAuthorizationExceptionCode)
        #   * :admission_date (Date)
        #   * :discharge_date (Date)
        #   * :onset_of_current_illness_or_symptom_date (Date)
        #   * :last_menstrual_period_date (Date)
        #   * :delay_reason_code (CandidApiClient::Commons::Types::DelayReasonCode)
        #   * :patient_authorized_release (Boolean)
        #   * :referral_number (String)
        #   * :secondary_payer_carrier_code (String)
        # @param charge_external_id [String] A client-specified unique ID to associate with this encounter; for example, your
        #  internal encounter ID or a Dr. Chrono encounter ID. This field should not
        #  contain PHI.
        # @param originating_system [String] An optional string field denoting the originating system of the charge.
        # @param claim_creation_category [String] An optional string field denoting the user defined category of the claim
        #  creation.
        # @param ehr_source_url [String] External URL reference that links to Charge Capture details within the external
        #  system (e.g. the EHR visit page). Send full URL format for the external link
        #  (e.g. https://emr_charge_capture_url.com/123).
        # @param patient_external_id [String] The patient ID from the external EMR platform for the patient
        # @param status [CandidApiClient::ChargeCapture::V1::Types::ChargeCaptureStatus] the status of the charge capture
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ChargeCapture::V1::Types::ChargeCapture]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.charge_capture.v_1.create(
        #    data: {  },
        #    charge_external_id: "charge_external_id",
        #    patient_external_id: "patient_external_id",
        #    status: PLANNED
        #  )
        def create(data:, charge_external_id:, patient_external_id:, status:, originating_system: nil, claim_creation_category: nil,
                   ehr_source_url: nil, request_options: nil)
          Async do
            response = @request_client.conn.post do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = {
                **(request_options&.additional_body_parameters || {}),
                data: data,
                charge_external_id: charge_external_id,
                originating_system: originating_system,
                claim_creation_category: claim_creation_category,
                ehr_source_url: ehr_source_url,
                patient_external_id: patient_external_id,
                status: status
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/charge_captures/v1"
            end
            CandidApiClient::ChargeCapture::V1::Types::ChargeCapture.from_json(json_object: response.body)
          end
        end

        # Create a Charge Capture from a pre-encounter patient and appointment. This
        #  endpoint is intended to be used by consumers who are managing
        #  patients and appointments in the pre-encounter service and is currently under
        #  development. Consumers who are not taking advantage
        #  of the pre-encounter service should use the standard create endpoint.
        #  At encounter creation time, information from the provided patient and
        #  appointment objects will be populated
        #  where applicable. In particular, the following fields are populated from the
        #  patient and appointment objects:
        #  - Patient
        #  - Referring Provider
        #  - Subscriber Primary
        #  - Subscriber Secondary
        #  - Referral Number
        #  - Responsible Party
        #  - Guarantor
        #  Note that these fields should not be populated in the ChargeCaptureData property
        #  of this endpoint, as they will be overwritten at encounter creation time.
        #  Utilizing this endpoint opts you into automatic updating of the encounter when
        #  the patient or appointment is updated, assuming the
        #  encounter has not already been submitted or adjudicated.
        #
        # @param data [Hash] Charge Capture data contains all the fields needed to create an encounter, but
        #  listed as optional. Candid will use this data when attempting to bundle multiple
        #  Charge Captures into a single encounter.Request of type CandidApiClient::ChargeCapture::V1::Types::ChargeCaptureData, as a Hash
        #   * :vitals (Hash)
        #     * :height_in (Integer)
        #     * :weight_lbs (Integer)
        #     * :blood_pressure_systolic_mmhg (Integer)
        #     * :blood_pressure_diastolic_mmhg (Integer)
        #     * :body_temperature_f (Float)
        #     * :hemoglobin_gdl (Float)
        #     * :hematocrit_pct (Float)
        #   * :diagnoses (Array<CandidApiClient::Diagnoses::Types::DiagnosisCreateOptional>)
        #   * :clinical_notes (Array<CandidApiClient::Encounters::V4::Types::ClinicalNoteCategoryCreateOptional>)
        #   * :claim_supplemental_information (Array<CandidApiClient::Encounters::V4::Types::ClaimSupplementalInformationOptional>)
        #   * :epsdt_referral (Hash)
        #     * :condition_indicator_1 (CandidApiClient::Commons::Types::EpsdtReferralConditionIndicatorCode)
        #     * :condition_indicator_2 (CandidApiClient::Commons::Types::EpsdtReferralConditionIndicatorCode)
        #     * :condition_indicator_3 (CandidApiClient::Commons::Types::EpsdtReferralConditionIndicatorCode)
        #   * :existing_medications (Array<CandidApiClient::Encounters::V4::Types::MedicationOptional>)
        #   * :guarantor (Hash)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :external_id (String)
        #     * :date_of_birth (Date)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :phone_numbers (Array<CandidApiClient::Commons::Types::PhoneNumberOptional>)
        #     * :phone_consent (Boolean)
        #     * :email (String)
        #     * :email_consent (Boolean)
        #   * :subscriber_primary (Hash)
        #     * :insurance_card (Hash)
        #       * :member_id (String)
        #       * :payer_name (String)
        #       * :payer_id (String)
        #       * :rx_bin (String)
        #       * :rx_pcn (String)
        #       * :image_url_front (String)
        #       * :image_url_back (String)
        #       * :emr_payer_crosswalk (CandidApiClient::Commons::Types::EmrPayerCrosswalk)
        #       * :group_number (String)
        #       * :plan_name (String)
        #       * :plan_type (CandidApiClient::Commons::Types::SourceOfPaymentCode)
        #       * :insurance_type (CandidApiClient::Commons::Types::InsuranceTypeCode)
        #       * :payer_plan_group_id (String)
        #     * :patient_relationship_to_subscriber_code (CandidApiClient::Commons::Types::PatientRelationshipToInsuredCodeAll)
        #     * :date_of_birth (Date)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :gender (CandidApiClient::Individual::Types::Gender)
        #   * :subscriber_secondary (Hash)
        #     * :insurance_card (Hash)
        #       * :member_id (String)
        #       * :payer_name (String)
        #       * :payer_id (String)
        #       * :rx_bin (String)
        #       * :rx_pcn (String)
        #       * :image_url_front (String)
        #       * :image_url_back (String)
        #       * :emr_payer_crosswalk (CandidApiClient::Commons::Types::EmrPayerCrosswalk)
        #       * :group_number (String)
        #       * :plan_name (String)
        #       * :plan_type (CandidApiClient::Commons::Types::SourceOfPaymentCode)
        #       * :insurance_type (CandidApiClient::Commons::Types::InsuranceTypeCode)
        #       * :payer_plan_group_id (String)
        #     * :patient_relationship_to_subscriber_code (CandidApiClient::Commons::Types::PatientRelationshipToInsuredCodeAll)
        #     * :date_of_birth (Date)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :gender (CandidApiClient::Individual::Types::Gender)
        #   * :subscriber_tertiary (Hash)
        #     * :insurance_card (Hash)
        #       * :member_id (String)
        #       * :payer_name (String)
        #       * :payer_id (String)
        #       * :rx_bin (String)
        #       * :rx_pcn (String)
        #       * :image_url_front (String)
        #       * :image_url_back (String)
        #       * :emr_payer_crosswalk (CandidApiClient::Commons::Types::EmrPayerCrosswalk)
        #       * :group_number (String)
        #       * :plan_name (String)
        #       * :plan_type (CandidApiClient::Commons::Types::SourceOfPaymentCode)
        #       * :insurance_type (CandidApiClient::Commons::Types::InsuranceTypeCode)
        #       * :payer_plan_group_id (String)
        #     * :patient_relationship_to_subscriber_code (CandidApiClient::Commons::Types::PatientRelationshipToInsuredCodeAll)
        #     * :date_of_birth (Date)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :gender (CandidApiClient::Individual::Types::Gender)
        #   * :interventions (Array<CandidApiClient::Encounters::V4::Types::InterventionOptional>)
        #   * :schema_instances (Array<CandidApiClient::CustomSchemas::V1::Types::SchemaInstanceOptional>)
        #   * :external_claim_submission (Hash)
        #     * :claim_created_at (DateTime)
        #     * :patient_control_number (String)
        #     * :submission_records (Array<CandidApiClient::ClaimSubmission::V1::Types::ClaimSubmissionRecordCreateOptional>)
        #   * :service_lines (Array<CandidApiClient::ServiceLines::V2::Types::ServiceLineCreateOptional>)
        #   * :patient_histories (Array<CandidApiClient::Encounters::V4::Types::PatientHistoryCategoryOptional>)
        #   * :billing_notes (Array<CandidApiClient::BillingNotes::V2::Types::BillingNoteBaseOptional>)
        #   * :patient (Hash)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :gender (CandidApiClient::Individual::Types::Gender)
        #     * :external_id (String)
        #     * :date_of_birth (Date)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :phone_numbers (Array<CandidApiClient::Commons::Types::PhoneNumberOptional>)
        #     * :phone_consent (Boolean)
        #     * :email (String)
        #     * :email_consent (Boolean)
        #     * :non_insurance_payers (Array<String>)
        #     * :non_insurance_payers_info (Array<CandidApiClient::Individual::Types::PatientNonInsurancePayerInfoCreateOptional>)
        #   * :service_facility (Hash)
        #     * :organization_name (String)
        #     * :npi (String)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :secondary_identification (String)
        #   * :rendering_provider (Hash)
        #     * :npi (String)
        #     * :taxonomy_code (String)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :organization_name (String)
        #   * :initial_referring_provider (Hash)
        #     * :npi (String)
        #     * :taxonomy_code (String)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :qualifier (CandidApiClient::Commons::Types::QualifierCode)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :organization_name (String)
        #   * :referring_provider (Hash)
        #     * :npi (String)
        #     * :taxonomy_code (String)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :organization_name (String)
        #   * :supervising_provider (Hash)
        #     * :npi (String)
        #     * :taxonomy_code (String)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :organization_name (String)
        #   * :billing_provider (Hash)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :tax_id (String)
        #     * :npi (String)
        #     * :taxonomy_code (String)
        #     * :provider_commercial_license_type (CandidApiClient::Commons::Types::BillingProviderCommercialLicenseType)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :organization_name (String)
        #   * :pay_to_address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :benefits_assigned_to_provider (Boolean)
        #   * :prior_authorization_number (String)
        #   * :external_id (String)
        #   * :date_of_service (Date)
        #   * :tag_ids (Array<String>)
        #   * :billable_status (CandidApiClient::Encounters::V4::Types::BillableStatusType)
        #   * :responsible_party (CandidApiClient::Encounters::V4::Types::ResponsiblePartyType)
        #   * :provider_accepts_assignment (Boolean)
        #   * :synchronicity (CandidApiClient::Encounters::V4::Types::SynchronicityType)
        #   * :place_of_service_code (CandidApiClient::Commons::Types::FacilityTypeCode)
        #   * :appointment_type (String)
        #   * :end_date_of_service (Date)
        #   * :additional_information (String)
        #   * :service_authorization_exception_code (CandidApiClient::Encounters::V4::Types::ServiceAuthorizationExceptionCode)
        #   * :admission_date (Date)
        #   * :discharge_date (Date)
        #   * :onset_of_current_illness_or_symptom_date (Date)
        #   * :last_menstrual_period_date (Date)
        #   * :delay_reason_code (CandidApiClient::Commons::Types::DelayReasonCode)
        #   * :patient_authorized_release (Boolean)
        #   * :referral_number (String)
        #   * :secondary_payer_carrier_code (String)
        # @param charge_external_id [String] A client-specified unique ID to associate with this encounter; for example, your
        #  internal encounter ID or a Dr. Chrono encounter ID. This field should not
        #  contain PHI.
        # @param pre_encounter_patient_id [String]
        # @param pre_encounter_appointment_ids [Array<String>]
        # @param originating_system [String] An optional string field denoting the originating system of the charge.
        # @param claim_creation_category [String] An optional string field denoting the user defined category of the claim
        #  creation.
        # @param ehr_source_url [String] External URL reference that links to Charge Capture details within the external
        #  system (e.g. the EHR visit page). Send full URL format for the external link
        #  (e.g. https://emr_charge_capture_url.com/123).
        # @param status [CandidApiClient::ChargeCapture::V1::Types::ChargeCaptureStatus] the status of the charge capture
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ChargeCapture::V1::Types::ChargeCapture]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.charge_capture.v_1.create_from_pre_encounter_patient(
        #    data: {  },
        #    charge_external_id: "charge_external_id",
        #    pre_encounter_patient_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    pre_encounter_appointment_ids: ["d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32"],
        #    status: PLANNED
        #  )
        def create_from_pre_encounter_patient(data:, charge_external_id:, pre_encounter_patient_id:,
                                              pre_encounter_appointment_ids:, status:, originating_system: nil, claim_creation_category: nil, ehr_source_url: nil, request_options: nil)
          Async do
            response = @request_client.conn.post do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = {
                **(request_options&.additional_body_parameters || {}),
                data: data,
                charge_external_id: charge_external_id,
                pre_encounter_patient_id: pre_encounter_patient_id,
                pre_encounter_appointment_ids: pre_encounter_appointment_ids,
                originating_system: originating_system,
                claim_creation_category: claim_creation_category,
                ehr_source_url: ehr_source_url,
                status: status
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/charge_captures/v1/create-from-pre-encounter"
            end
            CandidApiClient::ChargeCapture::V1::Types::ChargeCapture.from_json(json_object: response.body)
          end
        end

        # @param charge_capture_id [String]
        # @param data [Hash] Request of type CandidApiClient::ChargeCapture::V1::Types::ChargeCaptureData, as a Hash
        #   * :vitals (Hash)
        #     * :height_in (Integer)
        #     * :weight_lbs (Integer)
        #     * :blood_pressure_systolic_mmhg (Integer)
        #     * :blood_pressure_diastolic_mmhg (Integer)
        #     * :body_temperature_f (Float)
        #     * :hemoglobin_gdl (Float)
        #     * :hematocrit_pct (Float)
        #   * :diagnoses (Array<CandidApiClient::Diagnoses::Types::DiagnosisCreateOptional>)
        #   * :clinical_notes (Array<CandidApiClient::Encounters::V4::Types::ClinicalNoteCategoryCreateOptional>)
        #   * :claim_supplemental_information (Array<CandidApiClient::Encounters::V4::Types::ClaimSupplementalInformationOptional>)
        #   * :epsdt_referral (Hash)
        #     * :condition_indicator_1 (CandidApiClient::Commons::Types::EpsdtReferralConditionIndicatorCode)
        #     * :condition_indicator_2 (CandidApiClient::Commons::Types::EpsdtReferralConditionIndicatorCode)
        #     * :condition_indicator_3 (CandidApiClient::Commons::Types::EpsdtReferralConditionIndicatorCode)
        #   * :existing_medications (Array<CandidApiClient::Encounters::V4::Types::MedicationOptional>)
        #   * :guarantor (Hash)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :external_id (String)
        #     * :date_of_birth (Date)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :phone_numbers (Array<CandidApiClient::Commons::Types::PhoneNumberOptional>)
        #     * :phone_consent (Boolean)
        #     * :email (String)
        #     * :email_consent (Boolean)
        #   * :subscriber_primary (Hash)
        #     * :insurance_card (Hash)
        #       * :member_id (String)
        #       * :payer_name (String)
        #       * :payer_id (String)
        #       * :rx_bin (String)
        #       * :rx_pcn (String)
        #       * :image_url_front (String)
        #       * :image_url_back (String)
        #       * :emr_payer_crosswalk (CandidApiClient::Commons::Types::EmrPayerCrosswalk)
        #       * :group_number (String)
        #       * :plan_name (String)
        #       * :plan_type (CandidApiClient::Commons::Types::SourceOfPaymentCode)
        #       * :insurance_type (CandidApiClient::Commons::Types::InsuranceTypeCode)
        #       * :payer_plan_group_id (String)
        #     * :patient_relationship_to_subscriber_code (CandidApiClient::Commons::Types::PatientRelationshipToInsuredCodeAll)
        #     * :date_of_birth (Date)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :gender (CandidApiClient::Individual::Types::Gender)
        #   * :subscriber_secondary (Hash)
        #     * :insurance_card (Hash)
        #       * :member_id (String)
        #       * :payer_name (String)
        #       * :payer_id (String)
        #       * :rx_bin (String)
        #       * :rx_pcn (String)
        #       * :image_url_front (String)
        #       * :image_url_back (String)
        #       * :emr_payer_crosswalk (CandidApiClient::Commons::Types::EmrPayerCrosswalk)
        #       * :group_number (String)
        #       * :plan_name (String)
        #       * :plan_type (CandidApiClient::Commons::Types::SourceOfPaymentCode)
        #       * :insurance_type (CandidApiClient::Commons::Types::InsuranceTypeCode)
        #       * :payer_plan_group_id (String)
        #     * :patient_relationship_to_subscriber_code (CandidApiClient::Commons::Types::PatientRelationshipToInsuredCodeAll)
        #     * :date_of_birth (Date)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :gender (CandidApiClient::Individual::Types::Gender)
        #   * :subscriber_tertiary (Hash)
        #     * :insurance_card (Hash)
        #       * :member_id (String)
        #       * :payer_name (String)
        #       * :payer_id (String)
        #       * :rx_bin (String)
        #       * :rx_pcn (String)
        #       * :image_url_front (String)
        #       * :image_url_back (String)
        #       * :emr_payer_crosswalk (CandidApiClient::Commons::Types::EmrPayerCrosswalk)
        #       * :group_number (String)
        #       * :plan_name (String)
        #       * :plan_type (CandidApiClient::Commons::Types::SourceOfPaymentCode)
        #       * :insurance_type (CandidApiClient::Commons::Types::InsuranceTypeCode)
        #       * :payer_plan_group_id (String)
        #     * :patient_relationship_to_subscriber_code (CandidApiClient::Commons::Types::PatientRelationshipToInsuredCodeAll)
        #     * :date_of_birth (Date)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :gender (CandidApiClient::Individual::Types::Gender)
        #   * :interventions (Array<CandidApiClient::Encounters::V4::Types::InterventionOptional>)
        #   * :schema_instances (Array<CandidApiClient::CustomSchemas::V1::Types::SchemaInstanceOptional>)
        #   * :external_claim_submission (Hash)
        #     * :claim_created_at (DateTime)
        #     * :patient_control_number (String)
        #     * :submission_records (Array<CandidApiClient::ClaimSubmission::V1::Types::ClaimSubmissionRecordCreateOptional>)
        #   * :service_lines (Array<CandidApiClient::ServiceLines::V2::Types::ServiceLineCreateOptional>)
        #   * :patient_histories (Array<CandidApiClient::Encounters::V4::Types::PatientHistoryCategoryOptional>)
        #   * :billing_notes (Array<CandidApiClient::BillingNotes::V2::Types::BillingNoteBaseOptional>)
        #   * :patient (Hash)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :gender (CandidApiClient::Individual::Types::Gender)
        #     * :external_id (String)
        #     * :date_of_birth (Date)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :phone_numbers (Array<CandidApiClient::Commons::Types::PhoneNumberOptional>)
        #     * :phone_consent (Boolean)
        #     * :email (String)
        #     * :email_consent (Boolean)
        #     * :non_insurance_payers (Array<String>)
        #     * :non_insurance_payers_info (Array<CandidApiClient::Individual::Types::PatientNonInsurancePayerInfoCreateOptional>)
        #   * :service_facility (Hash)
        #     * :organization_name (String)
        #     * :npi (String)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :secondary_identification (String)
        #   * :rendering_provider (Hash)
        #     * :npi (String)
        #     * :taxonomy_code (String)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :organization_name (String)
        #   * :initial_referring_provider (Hash)
        #     * :npi (String)
        #     * :taxonomy_code (String)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :qualifier (CandidApiClient::Commons::Types::QualifierCode)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :organization_name (String)
        #   * :referring_provider (Hash)
        #     * :npi (String)
        #     * :taxonomy_code (String)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :organization_name (String)
        #   * :supervising_provider (Hash)
        #     * :npi (String)
        #     * :taxonomy_code (String)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :organization_name (String)
        #   * :billing_provider (Hash)
        #     * :address (Hash)
        #       * :zip_plus_four_code (String)
        #       * :address_1 (String)
        #       * :address_2 (String)
        #       * :city (String)
        #       * :state (CandidApiClient::Commons::Types::State)
        #       * :zip_code (String)
        #     * :tax_id (String)
        #     * :npi (String)
        #     * :taxonomy_code (String)
        #     * :provider_commercial_license_type (CandidApiClient::Commons::Types::BillingProviderCommercialLicenseType)
        #     * :first_name (String)
        #     * :last_name (String)
        #     * :organization_name (String)
        #   * :pay_to_address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :benefits_assigned_to_provider (Boolean)
        #   * :prior_authorization_number (String)
        #   * :external_id (String)
        #   * :date_of_service (Date)
        #   * :tag_ids (Array<String>)
        #   * :billable_status (CandidApiClient::Encounters::V4::Types::BillableStatusType)
        #   * :responsible_party (CandidApiClient::Encounters::V4::Types::ResponsiblePartyType)
        #   * :provider_accepts_assignment (Boolean)
        #   * :synchronicity (CandidApiClient::Encounters::V4::Types::SynchronicityType)
        #   * :place_of_service_code (CandidApiClient::Commons::Types::FacilityTypeCode)
        #   * :appointment_type (String)
        #   * :end_date_of_service (Date)
        #   * :additional_information (String)
        #   * :service_authorization_exception_code (CandidApiClient::Encounters::V4::Types::ServiceAuthorizationExceptionCode)
        #   * :admission_date (Date)
        #   * :discharge_date (Date)
        #   * :onset_of_current_illness_or_symptom_date (Date)
        #   * :last_menstrual_period_date (Date)
        #   * :delay_reason_code (CandidApiClient::Commons::Types::DelayReasonCode)
        #   * :patient_authorized_release (Boolean)
        #   * :referral_number (String)
        #   * :secondary_payer_carrier_code (String)
        # @param charge_external_id [String] A client-specified unique ID to associate with this encounter;
        #  for example, your internal encounter ID or a Dr. Chrono encounter ID.
        #  This field should not contain PHI.
        # @param ehr_source_url [String] External URL reference that links to Charge Capture details within the external
        #  system (e.g. the EHR visit page).
        #  Send full URL format for the external link (e.g.
        #  https://emr_charge_capture_url.com/123).
        # @param originating_system [String] An optional string field denoting the originating system of the charge.
        # @param claim_creation_category [String] An optional string field denoting the user defined category of the claim
        #  creation.
        # @param patient_external_id [String] The patient ID from the external EMR platform for the patient
        # @param status [CandidApiClient::ChargeCapture::V1::Types::ChargeCaptureStatus] the status of the charge capture
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ChargeCapture::V1::Types::ChargeCapture]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.charge_capture.v_1.update(charge_capture_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def update(charge_capture_id:, data: nil, charge_external_id: nil, ehr_source_url: nil,
                   originating_system: nil, claim_creation_category: nil, patient_external_id: nil, status: nil, request_options: nil)
          Async do
            response = @request_client.conn.patch do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = {
                **(request_options&.additional_body_parameters || {}),
                data: data,
                charge_external_id: charge_external_id,
                ehr_source_url: ehr_source_url,
                originating_system: originating_system,
                claim_creation_category: claim_creation_category,
                patient_external_id: patient_external_id,
                status: status
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/charge_captures/v1/#{charge_capture_id}"
            end
            CandidApiClient::ChargeCapture::V1::Types::ChargeCapture.from_json(json_object: response.body)
          end
        end

        # @param charge_capture_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ChargeCapture::V1::Types::ChargeCapture]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.charge_capture.v_1.get(charge_capture_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get(charge_capture_id:, request_options: nil)
          Async do
            response = @request_client.conn.get do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/charge_captures/v1/#{charge_capture_id}"
            end
            CandidApiClient::ChargeCapture::V1::Types::ChargeCapture.from_json(json_object: response.body)
          end
        end

        # @param limit [Integer] Maximum number of entities per page, defaults to 100.
        # @param sort [CandidApiClient::ChargeCapture::V1::Types::ChargeCaptureSortField] Defaults to created_at
        # @param sort_direction [CandidApiClient::Commons::Types::SortDirection] Sort direction. Defaults to descending order if not provided.
        # @param page_token [String]
        # @param patient_external_id [String] The patient ID from the external EMR platform for the patient
        # @param status [CandidApiClient::ChargeCapture::V1::Types::ChargeCaptureStatus] the status of the charge captures
        # @param charge_external_id [String] A client-specified unique ID to associate with this encounter;
        #  for example, your internal encounter ID or a Dr. Chrono encounter ID.
        #  This field should not contain PHI.
        # @param date_of_service_min [Date] Date formatted as YYYY-MM-DD; eg: 2019-08-24.
        #  This date must be the local date in the timezone where the service occurred.
        # @param date_of_service_max [Date] Date formatted as YYYY-MM-DD; eg: 2019-08-24.
        #  This date must be the local date in the timezone where the service occurred.
        # @param claim_ids [String] A list of claim IDs to filter by. This will return all charge captures that have
        #  a resulting claim with one of the IDs in this list.
        # @param claim_creation_ids [String] A list of Claim Creation IDs to filter by.
        # @param billing_provider_npis [String] A list of billing provider NPIs to filter by. This will return all charge
        #  captures with one of the NPIs in this list.
        # @param service_facility_name [String] A string to filter by. This will return all charge captures with this service
        #  facility name.
        # @param primary_payer_ids [String] A list of primary payer IDs to filter by. This will return all charge captures
        #  with one of the primary payer IDs in this list.
        # @param rendering_provider_npis [String] A list of rendering provider NPIs to filter by. This will return all charge
        #  captures with one of the NPIs in this list.
        # @param rendering_provider_names [String] A list of rendering provider names to filter by. This will return all charge
        #  captures with one of the names in this list.
        # @param supervising_provider_npis [String] A list of supervising provider NPIs to filter by. This will return all charge
        #  captures with one of the NPIs in this list.
        # @param supervising_provider_names [String] A list of supervising provider names to filter by. This will return all charge
        #  captures with one of the names in this list.
        # @param exclude_charges_linked_to_claims [Boolean] Whether to exclude charge captures which are part of a claim creation.
        # @param patient_external_id_ranked_sort [String] The patient ID from the external EMR platform for the patient
        # @param status_ranked_sort [CandidApiClient::ChargeCapture::V1::Types::ChargeCaptureStatus] The charge capture status to show first
        # @param charge_external_id_ranked_sort [String] A client-specified unique ID to associate with this encounter;
        #  for example, your internal encounter ID or a Dr. Chrono encounter ID.
        #  This field should not contain PHI.
        # @param date_of_service_min_ranked_sort [Date] Date formatted as YYYY-MM-DD; eg: 2019-08-24.
        #  This date must be the local date in the timezone where the service occurred.
        # @param date_of_service_max_ranked_sort [Date] Date formatted as YYYY-MM-DD; eg: 2019-08-24.
        #  This date must be the local date in the timezone where the service occurred.
        # @param search_term [String] Filter by any of the following fields: charge_id, claim_id, patient external_id,
        #  patient date of birth, patient first name, patient last name,
        #  or charge external id.
        # @param billable_status [CandidApiClient::Encounters::V4::Types::BillableStatusType] Defines if the Encounter is to be billed by Candid to the responsible_party.
        #  Examples for when this should be set to NOT_BILLABLE include if the Encounter
        #  has not occurred yet or if there is no intention of ever billing the
        #  responsible_party.
        # @param responsible_party [CandidApiClient::Encounters::V4::Types::ResponsiblePartyType] Defines the party to be billed with the initial balance owed on the claim. Use
        #  SELF_PAY if you intend to bill self pay/cash pay.
        # @param claim_ids_ranked_sort [String] A list of claim IDs to show first. This will return all charge captures that
        #  have a resulting claim with one of the IDs in this list.
        # @param claim_creation_ids_ranked_sort [String] A list of Claim Creation IDs to show first.
        # @param billing_provider_npis_ranked_sort [String] A list of billing provider NPIs to show first. This will return all charge
        #  captures with one of the NPIs in this list.
        # @param service_facility_name_ranked_sort [String] A string to show first. This will return all charge captures with this service
        #  facility name.
        # @param primary_payer_ids_ranked_sort [String] A list of primary payer IDs to show first. This will return all charge captures
        #  with one of the primary payer IDs in this list.
        # @param rendering_provider_npis_ranked_sort [String] A list of rendering provider NPIs to show first. This will return all charge
        #  captures with one of the NPIs in this list.
        # @param rendering_provider_names_ranked_sort [String] A list of rendering provider names to show first. This will return all charge
        #  captures with one of the names in this list.
        # @param supervising_provider_npis_ranked_sort [String] A list of supervising provider NPIs to show first. This will return all charge
        #  captures with one of the NPIs in this list.
        # @param supervising_provider_names_ranked_sort [String] A list of supervising provider names to show first. This will return all charge
        #  captures with one of the names in this list.
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::ChargeCapture::V1::Types::ChargeCapturePage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.charge_capture.v_1.get_all
        def get_all(limit: nil, sort: nil, sort_direction: nil, page_token: nil, patient_external_id: nil, status: nil,
                    charge_external_id: nil, date_of_service_min: nil, date_of_service_max: nil, claim_ids: nil, claim_creation_ids: nil, billing_provider_npis: nil, service_facility_name: nil, primary_payer_ids: nil, rendering_provider_npis: nil, rendering_provider_names: nil, supervising_provider_npis: nil, supervising_provider_names: nil, exclude_charges_linked_to_claims: nil, patient_external_id_ranked_sort: nil, status_ranked_sort: nil, charge_external_id_ranked_sort: nil, date_of_service_min_ranked_sort: nil, date_of_service_max_ranked_sort: nil, search_term: nil, billable_status: nil, responsible_party: nil, claim_ids_ranked_sort: nil, claim_creation_ids_ranked_sort: nil, billing_provider_npis_ranked_sort: nil, service_facility_name_ranked_sort: nil, primary_payer_ids_ranked_sort: nil, rendering_provider_npis_ranked_sort: nil, rendering_provider_names_ranked_sort: nil, supervising_provider_npis_ranked_sort: nil, supervising_provider_names_ranked_sort: nil, request_options: nil)
          Async do
            response = @request_client.conn.get do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.params = {
                **(request_options&.additional_query_parameters || {}),
                "limit": limit,
                "sort": sort,
                "sort_direction": sort_direction,
                "page_token": page_token,
                "patient_external_id": patient_external_id,
                "status": status,
                "charge_external_id": charge_external_id,
                "date_of_service_min": date_of_service_min,
                "date_of_service_max": date_of_service_max,
                "claim_ids": claim_ids,
                "claim_creation_ids": claim_creation_ids,
                "billing_provider_npis": billing_provider_npis,
                "service_facility_name": service_facility_name,
                "primary_payer_ids": primary_payer_ids,
                "rendering_provider_npis": rendering_provider_npis,
                "rendering_provider_names": rendering_provider_names,
                "supervising_provider_npis": supervising_provider_npis,
                "supervising_provider_names": supervising_provider_names,
                "exclude_charges_linked_to_claims": exclude_charges_linked_to_claims,
                "patient_external_id_ranked_sort": patient_external_id_ranked_sort,
                "status_ranked_sort": status_ranked_sort,
                "charge_external_id_ranked_sort": charge_external_id_ranked_sort,
                "date_of_service_min_ranked_sort": date_of_service_min_ranked_sort,
                "date_of_service_max_ranked_sort": date_of_service_max_ranked_sort,
                "search_term": search_term,
                "billable_status": billable_status,
                "responsible_party": responsible_party,
                "claim_ids_ranked_sort": claim_ids_ranked_sort,
                "claim_creation_ids_ranked_sort": claim_creation_ids_ranked_sort,
                "billing_provider_npis_ranked_sort": billing_provider_npis_ranked_sort,
                "service_facility_name_ranked_sort": service_facility_name_ranked_sort,
                "primary_payer_ids_ranked_sort": primary_payer_ids_ranked_sort,
                "rendering_provider_npis_ranked_sort": rendering_provider_npis_ranked_sort,
                "rendering_provider_names_ranked_sort": rendering_provider_names_ranked_sort,
                "supervising_provider_npis_ranked_sort": supervising_provider_npis_ranked_sort,
                "supervising_provider_names_ranked_sort": supervising_provider_names_ranked_sort
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/charge_captures/v1"
            end
            CandidApiClient::ChargeCapture::V1::Types::ChargeCapturePage.from_json(json_object: response.body)
          end
        end

        # @param charge_capture_change_ids [Array<String>] A list of UUIDs corresponding to ChargeCapturePostBilledChanges.
        #  All of the charges sent will be marked as resolved
        # @param resolved [Boolean] Whether the change has been resolved. If true, the change will be marked as
        #  resolved.
        #  If false, the change will be marked as unresolved.
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [Array<CandidApiClient::ChargeCapture::V1::Types::ChargeCapturePostBilledChange>]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.charge_capture.v_1.update_post_billed_changes(charge_capture_change_ids: ["d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32"], resolved: true)
        def update_post_billed_changes(charge_capture_change_ids:, resolved:, request_options: nil)
          Async do
            response = @request_client.conn.patch do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = {
                **(request_options&.additional_body_parameters || {}),
                charge_capture_change_ids: charge_capture_change_ids,
                resolved: resolved
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/charge_captures/v1/changes"
            end
            parsed_json = JSON.parse(response.body)
            parsed_json&.map do |item|
              item = item.to_json
              CandidApiClient::ChargeCapture::V1::Types::ChargeCapturePostBilledChange.from_json(json_object: item)
            end
          end
        end
      end
    end
  end
end
