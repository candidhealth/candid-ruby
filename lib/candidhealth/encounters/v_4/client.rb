# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../../claims/types/claim_status"
require_relative "types/encounter_sort_options"
require "date"
require_relative "types/billable_status_type"
require_relative "types/responsible_party_type"
require_relative "types/encounter_owner_of_next_action_type"
require_relative "types/encounter_page"
require_relative "types/encounter"
require_relative "types/encounter_create"
require_relative "types/encounter_create_from_pre_encounter"
require_relative "types/encounter_update"
require "async"

module CandidApiClient
  module Encounters
    module V4
      class V4Client
        # @return [CandidApiClient::RequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::RequestClient]
        # @return [CandidApiClient::Encounters::V4::V4Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # @param limit [Integer] Maximum number of entities per page, defaults to 100.
        # @param claim_status [CandidApiClient::Claims::Types::ClaimStatus] Indicates the current status of an insurance claim within the billing process.
        # @param sort [CandidApiClient::Encounters::V4::Types::EncounterSortOptions] Defaults to created_at:desc.
        # @param page_token [String]
        # @param date_of_service_min [Date] Date formatted as YYYY-MM-DD; eg: 2019-08-25.
        # @param date_of_service_max [Date] Date formatted as YYYY-MM-DD; eg: 2019-08-25.
        # @param primary_payer_names [String] Comma delimited string.
        # @param search_term [String] Filter by any of the following fields: encounter_id, claim_id, patient
        #  external_id,
        #  patient date of birth, patient first name, patient last name,
        #  or encounter external id.
        # @param external_id [String] Filter to an exact match on encounter external_id, if one exists.
        # @param diagnoses_updated_since [DateTime] ISO 8601 timestamp; ideally in UTC (although not required):
        #  2019-08-24T14:15:22Z.
        # @param tag_ids [String] Filter by name of tags on encounters.
        # @param work_queue_id [String]
        # @param billable_status [CandidApiClient::Encounters::V4::Types::BillableStatusType] Defines if the Encounter is to be billed by Candid to the responsible_party.
        #  Examples for when this should be set to NOT_BILLABLE include if the Encounter
        #  has not occurred yet or if there is no intention of ever billing the
        #  responsible_party.
        # @param responsible_party [CandidApiClient::Encounters::V4::Types::ResponsiblePartyType] Defines the party to be billed with the initial balance owed on the claim. Use
        #  SELF_PAY if you intend to bill self pay/cash pay.
        # @param owner_of_next_action [CandidApiClient::Encounters::V4::Types::EncounterOwnerOfNextActionType] The party who is responsible for taking the next action on an Encounter, as
        #  defined by ownership of open Tasks.
        # @param patient_external_id [String] The patient ID from the external EMR platform for the patient
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Encounters::V4::Types::EncounterPage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.encounters.v_4.get_all(
        #    limit: 100,
        #    claim_status: BILLER_RECEIVED,
        #    sort: CREATED_AT_ASC,
        #    page_token: "eyJ0b2tlbiI6IjEiLCJwYWdlX3Rva2VuIjoiMiJ9",
        #    date_of_service_min: DateTime.parse(2019-08-24),
        #    date_of_service_max: DateTime.parse(2019-08-25),
        #    primary_payer_names: "Medicare,Medicaid",
        #    search_term: "doe",
        #    external_id: "123456",
        #    diagnoses_updated_since: DateTime.parse(2019-08-24T14:15:22.000Z)
        #  )
        def get_all(limit: nil, claim_status: nil, sort: nil, page_token: nil, date_of_service_min: nil,
                    date_of_service_max: nil, primary_payer_names: nil, search_term: nil, external_id: nil, diagnoses_updated_since: nil, tag_ids: nil, work_queue_id: nil, billable_status: nil, responsible_party: nil, owner_of_next_action: nil, patient_external_id: nil, request_options: nil)
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
              "claim_status": claim_status,
              "sort": sort,
              "page_token": page_token,
              "date_of_service_min": date_of_service_min,
              "date_of_service_max": date_of_service_max,
              "primary_payer_names": primary_payer_names,
              "search_term": search_term,
              "external_id": external_id,
              "diagnoses_updated_since": diagnoses_updated_since,
              "tag_ids": tag_ids,
              "work_queue_id": work_queue_id,
              "billable_status": billable_status,
              "responsible_party": responsible_party,
              "owner_of_next_action": owner_of_next_action,
              "patient_external_id": patient_external_id
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/encounters/v4"
          end
          CandidApiClient::Encounters::V4::Types::EncounterPage.from_json(json_object: response.body)
        end

        # @param encounter_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Encounters::V4::Types::Encounter]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.encounters.v_4.get(encounter_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get(encounter_id:, request_options: nil)
          response = @request_client.conn.get do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/encounters/v4/#{encounter_id}"
          end
          CandidApiClient::Encounters::V4::Types::Encounter.from_json(json_object: response.body)
        end

        # @param request [Hash] Request of type CandidApiClient::Encounters::V4::Types::EncounterCreate, as a Hash
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
        #   * :diagnoses (Array<CandidApiClient::Diagnoses::Types::DiagnosisCreate>)
        #   * :place_of_service_code (CandidApiClient::Commons::Types::FacilityTypeCode)
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
        #   * :service_lines (Array<CandidApiClient::ServiceLines::V2::Types::ServiceLineCreate>)
        #   * :patient (Hash)
        #     * :phone_numbers (Array<CandidApiClient::Commons::Types::PhoneNumber>)
        #     * :phone_consent (Boolean)
        #     * :email (String)
        #     * :non_insurance_payers (Array<String>)
        #     * :non_insurance_payers_info (Array<CandidApiClient::Individual::Types::PatientNonInsurancePayerInfoCreate>)
        #     * :email_consent (Boolean)
        #     * :auto_charge_consent (Boolean)
        #     * :external_id (String)
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
        #   * :prior_authorization_number (String)
        #   * :responsible_party (CandidApiClient::Encounters::V4::Types::ResponsiblePartyType)
        #   * :clinical_notes (Array<CandidApiClient::Encounters::V4::Types::ClinicalNoteCategoryCreate>)
        #   * :billing_notes (Array<CandidApiClient::BillingNotes::V2::Types::BillingNoteBase>)
        #   * :patient_histories (Array<CandidApiClient::Encounters::V4::Types::PatientHistoryCategory>)
        #   * :guarantor (Hash)
        #     * :phone_numbers (Array<CandidApiClient::Commons::Types::PhoneNumber>)
        #     * :phone_consent (Boolean)
        #     * :email (String)
        #     * :email_consent (Boolean)
        #     * :auto_charge_consent (Boolean)
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
        #   * :external_claim_submission (Hash)
        #     * :claim_created_at (DateTime)
        #     * :patient_control_number (String)
        #     * :submission_records (Array<CandidApiClient::ClaimSubmission::V1::Types::ClaimSubmissionRecordCreate>)
        #   * :tag_ids (Array<String>)
        #   * :schema_instances (Array<CandidApiClient::CustomSchemas::V1::Types::SchemaInstance>)
        #   * :referral_number (String)
        #   * :epsdt_referral (Hash)
        #     * :condition_indicator_1 (CandidApiClient::Commons::Types::EpsdtReferralConditionIndicatorCode)
        #     * :condition_indicator_2 (CandidApiClient::Commons::Types::EpsdtReferralConditionIndicatorCode)
        #     * :condition_indicator_3 (CandidApiClient::Commons::Types::EpsdtReferralConditionIndicatorCode)
        #   * :claim_supplemental_information (Array<CandidApiClient::Encounters::V4::Types::ClaimSupplementalInformation>)
        #   * :secondary_payer_carrier_code (String)
        #   * :external_id (String)
        #   * :date_of_service (Date)
        #   * :end_date_of_service (Date)
        #   * :patient_authorized_release (Boolean)
        #   * :benefits_assigned_to_provider (Boolean)
        #   * :provider_accepts_assignment (Boolean)
        #   * :appointment_type (String)
        #   * :existing_medications (Array<CandidApiClient::Encounters::V4::Types::Medication>)
        #   * :interventions (Array<CandidApiClient::Encounters::V4::Types::Intervention>)
        #   * :pay_to_address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :synchronicity (CandidApiClient::Encounters::V4::Types::SynchronicityType)
        #   * :vitals (Hash)
        #     * :height_in (Integer)
        #     * :weight_lbs (Integer)
        #     * :blood_pressure_systolic_mmhg (Integer)
        #     * :blood_pressure_diastolic_mmhg (Integer)
        #     * :body_temperature_f (Float)
        #     * :hemoglobin_gdl (Float)
        #     * :hematocrit_pct (Float)
        #   * :billable_status (CandidApiClient::Encounters::V4::Types::BillableStatusType)
        #   * :additional_information (String)
        #   * :service_authorization_exception_code (CandidApiClient::Encounters::V4::Types::ServiceAuthorizationExceptionCode)
        #   * :admission_date (Date)
        #   * :discharge_date (Date)
        #   * :onset_of_current_illness_or_symptom_date (Date)
        #   * :last_menstrual_period_date (Date)
        #   * :delay_reason_code (CandidApiClient::Commons::Types::DelayReasonCode)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Encounters::V4::Types::Encounter]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.encounters.v_4.create(request: { billing_provider: { address: { zip_plus_four_code: "zip_plus_four_code", address_1: "address1", city: "city", state: AA, zip_code: "zip_code" }, tax_id: "tax_id", npi: "npi" }, diagnoses: [{ code_type: ABF, code: "code" }, { code_type: ABF, code: "code" }], place_of_service_code: PHARMACY, rendering_provider: { npi: "npi" }, patient: { external_id: "external_id", date_of_birth: DateTime.parse(2023-01-15), address: { address_1: "address1", city: "city", state: AA, zip_code: "zip_code" }, first_name: "first_name", last_name: "last_name", gender: MALE }, responsible_party: INSURANCE_PAY, external_id: "external_id", patient_authorized_release: true, benefits_assigned_to_provider: true, provider_accepts_assignment: true, billable_status: BILLABLE })
        def create(request:, request_options: nil)
          response = @request_client.conn.post do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/encounters/v4"
          end
          CandidApiClient::Encounters::V4::Types::Encounter.from_json(json_object: response.body)
        end

        # Create an encounter from a pre-encounter patient and appointment. This endpoint
        #  is intended to be used by consumers who are managing
        #  patients and appointments in the pre-encounter service and is currently under
        #  development. Consumers who are not taking advantage
        #  of the pre-encounter service should use the standard create endpoint.
        #  The endpoint will create an encounter from the provided fields, pulling
        #  information from the provided patient and appointment objects
        #  where applicable. In particular, the following fields are populated from the
        #  patient and appointment objects:
        #  - Patient
        #  - Referring Provider
        #  - Subscriber Primary
        #  - Subscriber Secondary
        #  - Referral Number
        #  - Responsible Party
        #  - Guarantor
        #  Utilizing this endpoint opts you into automatic updating of the encounter when
        #  the patient or appointment is updated, assuming the
        #  encounter has not already been submitted or adjudicated.
        #
        # @param request [Hash] Request of type CandidApiClient::Encounters::V4::Types::EncounterCreateFromPreEncounter, as a Hash
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
        #   * :place_of_service_code (CandidApiClient::Commons::Types::FacilityTypeCode)
        #   * :diagnoses (Array<CandidApiClient::Diagnoses::Types::DiagnosisCreate>)
        #   * :service_lines (Array<CandidApiClient::ServiceLines::V2::Types::ServiceLineCreate>)
        #   * :pre_encounter_patient_id (String)
        #   * :pre_encounter_appointment_ids (Array<String>)
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
        #   * :clinical_notes (Array<CandidApiClient::Encounters::V4::Types::ClinicalNoteCategoryCreate>)
        #   * :billing_notes (Array<CandidApiClient::BillingNotes::V2::Types::BillingNoteBase>)
        #   * :patient_histories (Array<CandidApiClient::Encounters::V4::Types::PatientHistoryCategory>)
        #   * :external_claim_submission (Hash)
        #     * :claim_created_at (DateTime)
        #     * :patient_control_number (String)
        #     * :submission_records (Array<CandidApiClient::ClaimSubmission::V1::Types::ClaimSubmissionRecordCreate>)
        #   * :tag_ids (Array<String>)
        #   * :schema_instances (Array<CandidApiClient::CustomSchemas::V1::Types::SchemaInstance>)
        #   * :external_id (String)
        #   * :date_of_service (Date)
        #   * :end_date_of_service (Date)
        #   * :patient_authorized_release (Boolean)
        #   * :benefits_assigned_to_provider (Boolean)
        #   * :provider_accepts_assignment (Boolean)
        #   * :appointment_type (String)
        #   * :existing_medications (Array<CandidApiClient::Encounters::V4::Types::Medication>)
        #   * :interventions (Array<CandidApiClient::Encounters::V4::Types::Intervention>)
        #   * :pay_to_address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :synchronicity (CandidApiClient::Encounters::V4::Types::SynchronicityType)
        #   * :vitals (Hash)
        #     * :height_in (Integer)
        #     * :weight_lbs (Integer)
        #     * :blood_pressure_systolic_mmhg (Integer)
        #     * :blood_pressure_diastolic_mmhg (Integer)
        #     * :body_temperature_f (Float)
        #     * :hemoglobin_gdl (Float)
        #     * :hematocrit_pct (Float)
        #   * :billable_status (CandidApiClient::Encounters::V4::Types::BillableStatusType)
        #   * :additional_information (String)
        #   * :service_authorization_exception_code (CandidApiClient::Encounters::V4::Types::ServiceAuthorizationExceptionCode)
        #   * :admission_date (Date)
        #   * :discharge_date (Date)
        #   * :onset_of_current_illness_or_symptom_date (Date)
        #   * :last_menstrual_period_date (Date)
        #   * :delay_reason_code (CandidApiClient::Commons::Types::DelayReasonCode)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Encounters::V4::Types::Encounter]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.encounters.v_4.create_from_pre_encounter_patient(request: { rendering_provider: { npi: "npi" }, place_of_service_code: PHARMACY, diagnoses: [{ code_type: ABF, code: "code" }, { code_type: ABF, code: "code" }], pre_encounter_patient_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", pre_encounter_appointment_ids: ["d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32"], billing_provider: { address: { zip_plus_four_code: "zip_plus_four_code", address_1: "address1", city: "city", state: AA, zip_code: "zip_code" }, tax_id: "tax_id", npi: "npi" }, external_id: "external_id", patient_authorized_release: true, benefits_assigned_to_provider: true, provider_accepts_assignment: true, billable_status: BILLABLE })
        def create_from_pre_encounter_patient(request:, request_options: nil)
          response = @request_client.conn.post do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/encounters/v4/create-from-pre-encounter"
          end
          CandidApiClient::Encounters::V4::Types::Encounter.from_json(json_object: response.body)
        end

        # @param encounter_id [String]
        # @param request [Hash] Request of type CandidApiClient::Encounters::V4::Types::EncounterUpdate, as a Hash
        #   * :vitals (Hash)
        #     * :height_in (Integer)
        #     * :weight_lbs (Integer)
        #     * :blood_pressure_systolic_mmhg (Integer)
        #     * :blood_pressure_diastolic_mmhg (Integer)
        #     * :body_temperature_f (Float)
        #     * :hemoglobin_gdl (Float)
        #     * :hematocrit_pct (Float)
        #   * :diagnosis_ids (Array<String>)
        #   * :epsdt_referral (Hash)
        #     * :condition_indicator_1 (CandidApiClient::Commons::Types::EpsdtReferralConditionIndicatorCode)
        #     * :condition_indicator_2 (CandidApiClient::Commons::Types::EpsdtReferralConditionIndicatorCode)
        #     * :condition_indicator_3 (CandidApiClient::Commons::Types::EpsdtReferralConditionIndicatorCode)
        #   * :clinical_notes (Array<CandidApiClient::Encounters::V4::Types::ClinicalNoteCategoryCreate>)
        #   * :claim_supplemental_information (Array<CandidApiClient::Encounters::V4::Types::ClaimSupplementalInformation>)
        #   * :schema_instances (Array<CandidApiClient::CustomSchemas::V1::Types::SchemaInstance>)
        #   * :existing_medications (Array<CandidApiClient::Encounters::V4::Types::Medication>)
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
        #     * :phone_numbers (Array<CandidApiClient::Commons::Types::PhoneNumber>)
        #     * :phone_consent (Boolean)
        #     * :email (String)
        #     * :email_consent (Boolean)
        #     * :auto_charge_consent (Boolean)
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
        #   * :pay_to_address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
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
        #     * :phone_numbers (Array<CandidApiClient::Commons::Types::PhoneNumber>)
        #     * :phone_consent (Boolean)
        #     * :email (String)
        #     * :email_consent (Boolean)
        #     * :auto_charge_consent (Boolean)
        #     * :non_insurance_payers (Array<String>)
        #     * :non_insurance_payers_info (Array<CandidApiClient::Individual::Types::PatientNonInsurancePayerInfoCreate>)
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
        #   * :place_of_service_code_as_submitted (CandidApiClient::Commons::Types::FacilityTypeCode)
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
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Encounters::V4::Types::Encounter]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.encounters.v_4.update(encounter_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: {  })
        def update(encounter_id:, request:, request_options: nil)
          response = @request_client.conn.patch do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = {
          **(req.headers || {}),
          **@request_client.get_headers,
          **(request_options&.additional_headers || {})
            }.compact
            req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/encounters/v4/#{encounter_id}"
          end
          CandidApiClient::Encounters::V4::Types::Encounter.from_json(json_object: response.body)
        end
      end

      class AsyncV4Client
        # @return [CandidApiClient::AsyncRequestClient]
        attr_reader :request_client

        # @param request_client [CandidApiClient::AsyncRequestClient]
        # @return [CandidApiClient::Encounters::V4::AsyncV4Client]
        def initialize(request_client:)
          @request_client = request_client
        end

        # @param limit [Integer] Maximum number of entities per page, defaults to 100.
        # @param claim_status [CandidApiClient::Claims::Types::ClaimStatus] Indicates the current status of an insurance claim within the billing process.
        # @param sort [CandidApiClient::Encounters::V4::Types::EncounterSortOptions] Defaults to created_at:desc.
        # @param page_token [String]
        # @param date_of_service_min [Date] Date formatted as YYYY-MM-DD; eg: 2019-08-25.
        # @param date_of_service_max [Date] Date formatted as YYYY-MM-DD; eg: 2019-08-25.
        # @param primary_payer_names [String] Comma delimited string.
        # @param search_term [String] Filter by any of the following fields: encounter_id, claim_id, patient
        #  external_id,
        #  patient date of birth, patient first name, patient last name,
        #  or encounter external id.
        # @param external_id [String] Filter to an exact match on encounter external_id, if one exists.
        # @param diagnoses_updated_since [DateTime] ISO 8601 timestamp; ideally in UTC (although not required):
        #  2019-08-24T14:15:22Z.
        # @param tag_ids [String] Filter by name of tags on encounters.
        # @param work_queue_id [String]
        # @param billable_status [CandidApiClient::Encounters::V4::Types::BillableStatusType] Defines if the Encounter is to be billed by Candid to the responsible_party.
        #  Examples for when this should be set to NOT_BILLABLE include if the Encounter
        #  has not occurred yet or if there is no intention of ever billing the
        #  responsible_party.
        # @param responsible_party [CandidApiClient::Encounters::V4::Types::ResponsiblePartyType] Defines the party to be billed with the initial balance owed on the claim. Use
        #  SELF_PAY if you intend to bill self pay/cash pay.
        # @param owner_of_next_action [CandidApiClient::Encounters::V4::Types::EncounterOwnerOfNextActionType] The party who is responsible for taking the next action on an Encounter, as
        #  defined by ownership of open Tasks.
        # @param patient_external_id [String] The patient ID from the external EMR platform for the patient
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Encounters::V4::Types::EncounterPage]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.encounters.v_4.get_all(
        #    limit: 100,
        #    claim_status: BILLER_RECEIVED,
        #    sort: CREATED_AT_ASC,
        #    page_token: "eyJ0b2tlbiI6IjEiLCJwYWdlX3Rva2VuIjoiMiJ9",
        #    date_of_service_min: DateTime.parse(2019-08-24),
        #    date_of_service_max: DateTime.parse(2019-08-25),
        #    primary_payer_names: "Medicare,Medicaid",
        #    search_term: "doe",
        #    external_id: "123456",
        #    diagnoses_updated_since: DateTime.parse(2019-08-24T14:15:22.000Z)
        #  )
        def get_all(limit: nil, claim_status: nil, sort: nil, page_token: nil, date_of_service_min: nil,
                    date_of_service_max: nil, primary_payer_names: nil, search_term: nil, external_id: nil, diagnoses_updated_since: nil, tag_ids: nil, work_queue_id: nil, billable_status: nil, responsible_party: nil, owner_of_next_action: nil, patient_external_id: nil, request_options: nil)
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
                "claim_status": claim_status,
                "sort": sort,
                "page_token": page_token,
                "date_of_service_min": date_of_service_min,
                "date_of_service_max": date_of_service_max,
                "primary_payer_names": primary_payer_names,
                "search_term": search_term,
                "external_id": external_id,
                "diagnoses_updated_since": diagnoses_updated_since,
                "tag_ids": tag_ids,
                "work_queue_id": work_queue_id,
                "billable_status": billable_status,
                "responsible_party": responsible_party,
                "owner_of_next_action": owner_of_next_action,
                "patient_external_id": patient_external_id
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/encounters/v4"
            end
            CandidApiClient::Encounters::V4::Types::EncounterPage.from_json(json_object: response.body)
          end
        end

        # @param encounter_id [String]
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Encounters::V4::Types::Encounter]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.encounters.v_4.get(encounter_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32")
        def get(encounter_id:, request_options: nil)
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
                                                 request_options: request_options)}/api/encounters/v4/#{encounter_id}"
            end
            CandidApiClient::Encounters::V4::Types::Encounter.from_json(json_object: response.body)
          end
        end

        # @param request [Hash] Request of type CandidApiClient::Encounters::V4::Types::EncounterCreate, as a Hash
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
        #   * :diagnoses (Array<CandidApiClient::Diagnoses::Types::DiagnosisCreate>)
        #   * :place_of_service_code (CandidApiClient::Commons::Types::FacilityTypeCode)
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
        #   * :service_lines (Array<CandidApiClient::ServiceLines::V2::Types::ServiceLineCreate>)
        #   * :patient (Hash)
        #     * :phone_numbers (Array<CandidApiClient::Commons::Types::PhoneNumber>)
        #     * :phone_consent (Boolean)
        #     * :email (String)
        #     * :non_insurance_payers (Array<String>)
        #     * :non_insurance_payers_info (Array<CandidApiClient::Individual::Types::PatientNonInsurancePayerInfoCreate>)
        #     * :email_consent (Boolean)
        #     * :auto_charge_consent (Boolean)
        #     * :external_id (String)
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
        #   * :prior_authorization_number (String)
        #   * :responsible_party (CandidApiClient::Encounters::V4::Types::ResponsiblePartyType)
        #   * :clinical_notes (Array<CandidApiClient::Encounters::V4::Types::ClinicalNoteCategoryCreate>)
        #   * :billing_notes (Array<CandidApiClient::BillingNotes::V2::Types::BillingNoteBase>)
        #   * :patient_histories (Array<CandidApiClient::Encounters::V4::Types::PatientHistoryCategory>)
        #   * :guarantor (Hash)
        #     * :phone_numbers (Array<CandidApiClient::Commons::Types::PhoneNumber>)
        #     * :phone_consent (Boolean)
        #     * :email (String)
        #     * :email_consent (Boolean)
        #     * :auto_charge_consent (Boolean)
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
        #   * :external_claim_submission (Hash)
        #     * :claim_created_at (DateTime)
        #     * :patient_control_number (String)
        #     * :submission_records (Array<CandidApiClient::ClaimSubmission::V1::Types::ClaimSubmissionRecordCreate>)
        #   * :tag_ids (Array<String>)
        #   * :schema_instances (Array<CandidApiClient::CustomSchemas::V1::Types::SchemaInstance>)
        #   * :referral_number (String)
        #   * :epsdt_referral (Hash)
        #     * :condition_indicator_1 (CandidApiClient::Commons::Types::EpsdtReferralConditionIndicatorCode)
        #     * :condition_indicator_2 (CandidApiClient::Commons::Types::EpsdtReferralConditionIndicatorCode)
        #     * :condition_indicator_3 (CandidApiClient::Commons::Types::EpsdtReferralConditionIndicatorCode)
        #   * :claim_supplemental_information (Array<CandidApiClient::Encounters::V4::Types::ClaimSupplementalInformation>)
        #   * :secondary_payer_carrier_code (String)
        #   * :external_id (String)
        #   * :date_of_service (Date)
        #   * :end_date_of_service (Date)
        #   * :patient_authorized_release (Boolean)
        #   * :benefits_assigned_to_provider (Boolean)
        #   * :provider_accepts_assignment (Boolean)
        #   * :appointment_type (String)
        #   * :existing_medications (Array<CandidApiClient::Encounters::V4::Types::Medication>)
        #   * :interventions (Array<CandidApiClient::Encounters::V4::Types::Intervention>)
        #   * :pay_to_address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :synchronicity (CandidApiClient::Encounters::V4::Types::SynchronicityType)
        #   * :vitals (Hash)
        #     * :height_in (Integer)
        #     * :weight_lbs (Integer)
        #     * :blood_pressure_systolic_mmhg (Integer)
        #     * :blood_pressure_diastolic_mmhg (Integer)
        #     * :body_temperature_f (Float)
        #     * :hemoglobin_gdl (Float)
        #     * :hematocrit_pct (Float)
        #   * :billable_status (CandidApiClient::Encounters::V4::Types::BillableStatusType)
        #   * :additional_information (String)
        #   * :service_authorization_exception_code (CandidApiClient::Encounters::V4::Types::ServiceAuthorizationExceptionCode)
        #   * :admission_date (Date)
        #   * :discharge_date (Date)
        #   * :onset_of_current_illness_or_symptom_date (Date)
        #   * :last_menstrual_period_date (Date)
        #   * :delay_reason_code (CandidApiClient::Commons::Types::DelayReasonCode)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Encounters::V4::Types::Encounter]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.encounters.v_4.create(request: { billing_provider: { address: { zip_plus_four_code: "zip_plus_four_code", address_1: "address1", city: "city", state: AA, zip_code: "zip_code" }, tax_id: "tax_id", npi: "npi" }, diagnoses: [{ code_type: ABF, code: "code" }, { code_type: ABF, code: "code" }], place_of_service_code: PHARMACY, rendering_provider: { npi: "npi" }, patient: { external_id: "external_id", date_of_birth: DateTime.parse(2023-01-15), address: { address_1: "address1", city: "city", state: AA, zip_code: "zip_code" }, first_name: "first_name", last_name: "last_name", gender: MALE }, responsible_party: INSURANCE_PAY, external_id: "external_id", patient_authorized_release: true, benefits_assigned_to_provider: true, provider_accepts_assignment: true, billable_status: BILLABLE })
        def create(request:, request_options: nil)
          Async do
            response = @request_client.conn.post do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/encounters/v4"
            end
            CandidApiClient::Encounters::V4::Types::Encounter.from_json(json_object: response.body)
          end
        end

        # Create an encounter from a pre-encounter patient and appointment. This endpoint
        #  is intended to be used by consumers who are managing
        #  patients and appointments in the pre-encounter service and is currently under
        #  development. Consumers who are not taking advantage
        #  of the pre-encounter service should use the standard create endpoint.
        #  The endpoint will create an encounter from the provided fields, pulling
        #  information from the provided patient and appointment objects
        #  where applicable. In particular, the following fields are populated from the
        #  patient and appointment objects:
        #  - Patient
        #  - Referring Provider
        #  - Subscriber Primary
        #  - Subscriber Secondary
        #  - Referral Number
        #  - Responsible Party
        #  - Guarantor
        #  Utilizing this endpoint opts you into automatic updating of the encounter when
        #  the patient or appointment is updated, assuming the
        #  encounter has not already been submitted or adjudicated.
        #
        # @param request [Hash] Request of type CandidApiClient::Encounters::V4::Types::EncounterCreateFromPreEncounter, as a Hash
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
        #   * :place_of_service_code (CandidApiClient::Commons::Types::FacilityTypeCode)
        #   * :diagnoses (Array<CandidApiClient::Diagnoses::Types::DiagnosisCreate>)
        #   * :service_lines (Array<CandidApiClient::ServiceLines::V2::Types::ServiceLineCreate>)
        #   * :pre_encounter_patient_id (String)
        #   * :pre_encounter_appointment_ids (Array<String>)
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
        #   * :clinical_notes (Array<CandidApiClient::Encounters::V4::Types::ClinicalNoteCategoryCreate>)
        #   * :billing_notes (Array<CandidApiClient::BillingNotes::V2::Types::BillingNoteBase>)
        #   * :patient_histories (Array<CandidApiClient::Encounters::V4::Types::PatientHistoryCategory>)
        #   * :external_claim_submission (Hash)
        #     * :claim_created_at (DateTime)
        #     * :patient_control_number (String)
        #     * :submission_records (Array<CandidApiClient::ClaimSubmission::V1::Types::ClaimSubmissionRecordCreate>)
        #   * :tag_ids (Array<String>)
        #   * :schema_instances (Array<CandidApiClient::CustomSchemas::V1::Types::SchemaInstance>)
        #   * :external_id (String)
        #   * :date_of_service (Date)
        #   * :end_date_of_service (Date)
        #   * :patient_authorized_release (Boolean)
        #   * :benefits_assigned_to_provider (Boolean)
        #   * :provider_accepts_assignment (Boolean)
        #   * :appointment_type (String)
        #   * :existing_medications (Array<CandidApiClient::Encounters::V4::Types::Medication>)
        #   * :interventions (Array<CandidApiClient::Encounters::V4::Types::Intervention>)
        #   * :pay_to_address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :synchronicity (CandidApiClient::Encounters::V4::Types::SynchronicityType)
        #   * :vitals (Hash)
        #     * :height_in (Integer)
        #     * :weight_lbs (Integer)
        #     * :blood_pressure_systolic_mmhg (Integer)
        #     * :blood_pressure_diastolic_mmhg (Integer)
        #     * :body_temperature_f (Float)
        #     * :hemoglobin_gdl (Float)
        #     * :hematocrit_pct (Float)
        #   * :billable_status (CandidApiClient::Encounters::V4::Types::BillableStatusType)
        #   * :additional_information (String)
        #   * :service_authorization_exception_code (CandidApiClient::Encounters::V4::Types::ServiceAuthorizationExceptionCode)
        #   * :admission_date (Date)
        #   * :discharge_date (Date)
        #   * :onset_of_current_illness_or_symptom_date (Date)
        #   * :last_menstrual_period_date (Date)
        #   * :delay_reason_code (CandidApiClient::Commons::Types::DelayReasonCode)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Encounters::V4::Types::Encounter]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.encounters.v_4.create_from_pre_encounter_patient(request: { rendering_provider: { npi: "npi" }, place_of_service_code: PHARMACY, diagnoses: [{ code_type: ABF, code: "code" }, { code_type: ABF, code: "code" }], pre_encounter_patient_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", pre_encounter_appointment_ids: ["d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32"], billing_provider: { address: { zip_plus_four_code: "zip_plus_four_code", address_1: "address1", city: "city", state: AA, zip_code: "zip_code" }, tax_id: "tax_id", npi: "npi" }, external_id: "external_id", patient_authorized_release: true, benefits_assigned_to_provider: true, provider_accepts_assignment: true, billable_status: BILLABLE })
        def create_from_pre_encounter_patient(request:, request_options: nil)
          Async do
            response = @request_client.conn.post do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/encounters/v4/create-from-pre-encounter"
            end
            CandidApiClient::Encounters::V4::Types::Encounter.from_json(json_object: response.body)
          end
        end

        # @param encounter_id [String]
        # @param request [Hash] Request of type CandidApiClient::Encounters::V4::Types::EncounterUpdate, as a Hash
        #   * :vitals (Hash)
        #     * :height_in (Integer)
        #     * :weight_lbs (Integer)
        #     * :blood_pressure_systolic_mmhg (Integer)
        #     * :blood_pressure_diastolic_mmhg (Integer)
        #     * :body_temperature_f (Float)
        #     * :hemoglobin_gdl (Float)
        #     * :hematocrit_pct (Float)
        #   * :diagnosis_ids (Array<String>)
        #   * :epsdt_referral (Hash)
        #     * :condition_indicator_1 (CandidApiClient::Commons::Types::EpsdtReferralConditionIndicatorCode)
        #     * :condition_indicator_2 (CandidApiClient::Commons::Types::EpsdtReferralConditionIndicatorCode)
        #     * :condition_indicator_3 (CandidApiClient::Commons::Types::EpsdtReferralConditionIndicatorCode)
        #   * :clinical_notes (Array<CandidApiClient::Encounters::V4::Types::ClinicalNoteCategoryCreate>)
        #   * :claim_supplemental_information (Array<CandidApiClient::Encounters::V4::Types::ClaimSupplementalInformation>)
        #   * :schema_instances (Array<CandidApiClient::CustomSchemas::V1::Types::SchemaInstance>)
        #   * :existing_medications (Array<CandidApiClient::Encounters::V4::Types::Medication>)
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
        #     * :phone_numbers (Array<CandidApiClient::Commons::Types::PhoneNumber>)
        #     * :phone_consent (Boolean)
        #     * :email (String)
        #     * :email_consent (Boolean)
        #     * :auto_charge_consent (Boolean)
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
        #   * :pay_to_address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
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
        #     * :phone_numbers (Array<CandidApiClient::Commons::Types::PhoneNumber>)
        #     * :phone_consent (Boolean)
        #     * :email (String)
        #     * :email_consent (Boolean)
        #     * :auto_charge_consent (Boolean)
        #     * :non_insurance_payers (Array<String>)
        #     * :non_insurance_payers_info (Array<CandidApiClient::Individual::Types::PatientNonInsurancePayerInfoCreate>)
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
        #   * :place_of_service_code_as_submitted (CandidApiClient::Commons::Types::FacilityTypeCode)
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
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Encounters::V4::Types::Encounter]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.encounters.v_4.update(encounter_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32", request: {  })
        def update(encounter_id:, request:, request_options: nil)
          Async do
            response = @request_client.conn.patch do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = {
            **(req.headers || {}),
            **@request_client.get_headers,
            **(request_options&.additional_headers || {})
              }.compact
              req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/encounters/v4/#{encounter_id}"
            end
            CandidApiClient::Encounters::V4::Types::Encounter.from_json(json_object: response.body)
          end
        end
      end
    end
  end
end
