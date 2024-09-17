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
require_relative "types/medication"
require_relative "types/vitals"
require_relative "types/intervention"
require_relative "../../commons/types/street_address_long_zip"
require_relative "types/synchronicity_type"
require_relative "types/service_authorization_exception_code"
require_relative "../../commons/types/delay_reason_code"
require "ostruct"
require_relative "../../individual/types/patient_create"
require_relative "../../encounter_providers/v_2/types/billing_provider"
require_relative "../../encounter_providers/v_2/types/rendering_provider"
require_relative "../../encounter_providers/v_2/types/referring_provider"
require_relative "../../encounter_providers/v_2/types/initial_referring_provider"
require_relative "../../encounter_providers/v_2/types/supervising_provider"
require_relative "../../service_facility/types/encounter_service_facility_base"
require_relative "../../individual/types/subscriber_create"
require_relative "../../diagnoses/types/diagnosis_create"
require_relative "types/clinical_note_category_create"
require_relative "../../billing_notes/v_2/types/billing_note_base"
require_relative "../../commons/types/facility_type_code"
require_relative "types/patient_history_category"
require_relative "../../service_lines/v_2/types/service_line_create"
require_relative "../../guarantor/v_1/types/guarantor_create"
require_relative "../../claim_submission/v_1/types/external_claim_submission_create"
require_relative "../../custom_schemas/v_1/types/schema_instance"
require_relative "types/vitals_update"
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

        # @param external_id [String] A client-specified unique ID to associate with this encounter;
        #  for example, your internal encounter ID or a Dr. Chrono encounter ID.
        #  This field should not contain PHI.
        # @param prior_authorization_number [String] Box 23 on the CMS-1500 claim form.
        # @param patient_authorized_release [Boolean] Whether this patient has authorized the release of medical information
        #  for billing purpose.
        #  Box 12 on the CMS-1500 claim form.
        # @param benefits_assigned_to_provider [Boolean] Whether this patient has authorized insurance payments to be made to you,
        #  not them. If false, patient may receive reimbursement.
        #  Box 13 on the CMS-1500 claim form.
        # @param provider_accepts_assignment [Boolean] Whether you have accepted the patient's authorization for insurance payments
        #  to be made to you, not them.
        #  Box 27 on the CMS-1500 claim form.
        # @param appointment_type [String] Human-readable description of the appointment type (ex: "Acupuncture -
        #  Headaches").
        # @param existing_medications [Array<Hash>] Request of type Array<CandidApiClient::Encounters::V4::Types::Medication>, as a Hash
        #   * :name (String)
        #   * :rx_cui (String)
        #   * :dosage (String)
        #   * :dosage_form (String)
        #   * :frequency (String)
        #   * :as_needed (Boolean)
        # @param vitals [Hash] Request of type CandidApiClient::Encounters::V4::Types::Vitals, as a Hash
        #   * :height_in (Integer)
        #   * :weight_lbs (Integer)
        #   * :blood_pressure_systolic_mmhg (Integer)
        #   * :blood_pressure_diastolic_mmhg (Integer)
        #   * :body_temperature_f (Float)
        #   * :hemoglobin_gdl (Float)
        #   * :hematocrit_pct (Float)
        # @param interventions [Array<Hash>] Request of type Array<CandidApiClient::Encounters::V4::Types::Intervention>, as a Hash
        #   * :name (String)
        #   * :category (CandidApiClient::Encounters::V4::Types::InterventionCategory)
        #   * :description (String)
        #   * :medication (Hash)
        #     * :name (String)
        #     * :rx_cui (String)
        #     * :dosage (String)
        #     * :dosage_form (String)
        #     * :frequency (String)
        #     * :as_needed (Boolean)
        #   * :labs (Array<CandidApiClient::Encounters::V4::Types::Lab>)
        # @param pay_to_address [Hash] Specifies the address to which payments for the claim should be sent.Request of type CandidApiClient::Commons::Types::StreetAddressLongZip, as a Hash
        #   * :zip_plus_four_code (String)
        #   * :address_1 (String)
        #   * :address_2 (String)
        #   * :city (String)
        #   * :state (CandidApiClient::Commons::Types::State)
        #   * :zip_code (String)
        # @param synchronicity [CandidApiClient::Encounters::V4::Types::SynchronicityType] Whether or not this was a synchronous or asynchronous encounter.
        #  Asynchronous encounters occur when providers and patients communicate online
        #  using
        #  forms, instant messaging, or other pre-recorded digital mediums.
        #  Synchronous encounters occur in live, real-time settings where the patient
        #  interacts
        #  directly with the provider, such as over video or a phone call.
        # @param billable_status [CandidApiClient::Encounters::V4::Types::BillableStatusType] Defines if the Encounter is to be billed by Candid to the responsible_party.
        #  Examples for when this should be set to NOT_BILLABLE include
        #  if the Encounter has not occurred yet or if there is no intention of ever
        #  billing the responsible_party.
        # @param responsible_party [CandidApiClient::Encounters::V4::Types::ResponsiblePartyType] Defines the party to be billed with the initial balance owed on the claim.
        # @param additional_information [String] Defines additional information on the claim needed by the payer.
        #  Box 19 on the CMS-1500 claim form.
        # @param service_authorization_exception_code [CandidApiClient::Encounters::V4::Types::ServiceAuthorizationExceptionCode] 837p Loop2300 REF\*4N
        #  Required when mandated by government law or regulation to obtain authorization
        #  for specific service(s) but, for the
        #  reasons listed in one of the enum values of ServiceAuthorizationExceptionCode,
        #  the service was performed without
        #  obtaining the authorization.
        # @param admission_date [Date] 837p Loop2300 DTP\*435, CMS-1500 Box 18
        #  Required on all ambulance claims when the patient was known to be admitted to
        #  the hospital.
        #  OR
        #  Required on all claims involving inpatient medical visits.
        # @param discharge_date [Date] 837p Loop2300 DTP\*096, CMS-1500 Box 18
        #  Required for inpatient claims when the patient was discharged from the facility
        #  and the discharge date is known.
        # @param onset_of_current_illness_or_symptom_date [Date] 837p Loop2300 DTP\*431, CMS-1500 Box 14
        #  Required for the initial medical service or visit performed in response to a
        #  medical emergency when the date is available and is different than the date of
        #  service.
        #  OR
        #  This date is the onset of acute symptoms for the current illness or condition.
        # @param last_menstrual_period_date [Date] 837p Loop2300 DTP\*484, CMS-1500 Box 14
        #  Required when, in the judgment of the provider, the services on this claim are
        #  related to the patient's pregnancy.
        # @param delay_reason_code [CandidApiClient::Commons::Types::DelayReasonCode] 837i Loop2300, CLM-1300 Box 20
        #  Code indicating the reason why a request was delayed
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @param _field_set [Object]
        # @param date_of_service [Date] Date formatted as YYYY-MM-DD; eg: 2019-08-24.
        #  This date must be the local date in the timezone where the service occurred.
        #  Box 24a on the CMS-1500 claim form.
        #  If service occurred over a range of dates, this should be the start date.
        #  date_of_service must be defined on either the encounter or the service lines but
        #  not both.
        #  If there are greater than zero service lines, it is recommended to specify
        #  date_of_service on the service_line instead of on the encounter to prepare for
        #  future API versions.
        # @param end_date_of_service [Date] Date formatted as YYYY-MM-DD; eg: 2019-08-25.
        #  This date must be the local date in the timezone where the service occurred.
        #  If omitted, the Encounter is assumed to be for a single day.
        #  Must not be temporally before the date_of_service field.
        #  If there are greater than zero service lines, it is recommended to specify
        #  end_date_of_service on the service_line instead of on the encounter to prepare
        #  for future API versions.
        # @param patient [Hash] Contains the identification information of the individual receiving medical
        #  services.Request of type CandidApiClient::Individual::Types::PatientCreate, as a Hash
        #   * :phone_numbers (Array<CandidApiClient::Commons::Types::PhoneNumber>)
        #   * :phone_consent (Boolean)
        #   * :email (String)
        #   * :non_insurance_payers (Array<String>)
        #   * :email_consent (Boolean)
        #   * :external_id (String)
        #   * :date_of_birth (Date)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :gender (CandidApiClient::Individual::Types::Gender)
        # @param billing_provider [Hash] The billing provider is the provider or business entity submitting the claim.
        #  Billing provider may be, but is not necessarily, the same person/NPI as the
        #  rendering provider. From a payer's perspective, this represents the person or
        #  entity being reimbursed. When a contract exists with the target payer, the
        #  billing provider should be the entity contracted with the payer. In some
        #  circumstances, this will be an individual provider. In that case, submit that
        #  provider's NPI and the tax ID (TIN) that the provider gave to the payer during
        #  contracting. In other cases, the billing entity will be a medical group. If so,
        #  submit the group NPI and the group's tax ID. Box 33 on the CMS-1500 claim form.Request of type CandidApiClient::EncounterProviders::V2::Types::BillingProvider, as a Hash
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :tax_id (String)
        #   * :npi (String)
        #   * :taxonomy_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :organization_name (String)
        # @param rendering_provider [Hash] The rendering provider is the practitioner -- physician, nurse practitioner,
        #  etc. -- performing the service.
        #  For telehealth services, the rendering provider performs the visit, asynchronous
        #  communication, or other service. The rendering provider address should generally
        #  be the same as the service facility address.Request of type CandidApiClient::EncounterProviders::V2::Types::RenderingProvider, as a Hash
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :npi (String)
        #   * :taxonomy_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :organization_name (String)
        # @param referring_provider [Hash] The final provider who referred the services that were rendered.
        #  All physicians who order services or refer Medicare beneficiaries must
        #  report this data.Request of type CandidApiClient::EncounterProviders::V2::Types::ReferringProvider, as a Hash
        #   * :npi (String)
        #   * :taxonomy_code (String)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :organization_name (String)
        # @param initial_referring_provider [Hash] The second iteration of Loop ID-2310. Use code "P3 - Primary Care Provider" in
        #  this loop to
        #  indicate the initial referral from the primary care provider or whatever
        #  provider wrote the initial referral for this patient's episode of care being
        #  billed/reported in this transaction.Request of type CandidApiClient::EncounterProviders::V2::Types::InitialReferringProvider, as a Hash
        #   * :npi (String)
        #   * :taxonomy_code (String)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :qualifier (CandidApiClient::Commons::Types::QualifierCode)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :organization_name (String)
        # @param supervising_provider [Hash] Required when the rendering provider is supervised by a physician. If not
        #  required by this implementation guide, do not send.Request of type CandidApiClient::EncounterProviders::V2::Types::SupervisingProvider, as a Hash
        #   * :npi (String)
        #   * :taxonomy_code (String)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :organization_name (String)
        # @param service_facility [Hash] Encounter Service facility is typically the location a medical service was
        #  rendered, such as a provider office or hospital. For telehealth, service
        #  facility can represent the provider's location when the service was delivered
        #  (e.g., home), or the location where an in-person visit would have taken place,
        #  whichever is easier to identify. If the provider is in-network, service facility
        #  may be defined in payer contracts. Box 32 on the CMS-1500 claim form. Note that
        #  for an in-network claim to be successfully adjudicated, the service facility
        #  address listed on claims must match what was provided to the payer during the
        #  credentialing process.Request of type CandidApiClient::ServiceFacility::Types::EncounterServiceFacilityBase, as a Hash
        #   * :organization_name (String)
        #   * :npi (String)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        # @param subscriber_primary [Hash] Subscriber_primary is required when responsible_party is INSURANCE_PAY (i.e.
        #  when the claim should be billed to insurance).
        #  These are not required fields when responsible_party is SELF_PAY (i.e. when the
        #  claim should be billed to the patient).
        #  However, if you collect this for patients, even self-pay, we recommend including
        #  it when sending encounters to Candid.
        #  Note: Cash Pay is no longer a valid payer_id in v4, please use responsible party
        #  to define self-pay claims.Request of type CandidApiClient::Individual::Types::SubscriberCreate, as a Hash
        #   * :insurance_card (Hash)
        #     * :member_id (String)
        #     * :payer_name (String)
        #     * :payer_id (String)
        #     * :rx_bin (String)
        #     * :rx_pcn (String)
        #     * :image_url_front (String)
        #     * :image_url_back (String)
        #     * :emr_payer_crosswalk (CandidApiClient::Commons::Types::EmrPayerCrosswalk)
        #     * :group_number (String)
        #     * :plan_name (String)
        #     * :plan_type (CandidApiClient::Commons::Types::SourceOfPaymentCode)
        #     * :insurance_type (CandidApiClient::Commons::Types::InsuranceTypeCode)
        #   * :patient_relationship_to_subscriber_code (CandidApiClient::Commons::Types::PatientRelationshipToInsuredCodeAll)
        #   * :date_of_birth (Date)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :gender (CandidApiClient::Individual::Types::Gender)
        # @param subscriber_secondary [Hash] Please always include this when you have it, even for self-pay claims.Request of type CandidApiClient::Individual::Types::SubscriberCreate, as a Hash
        #   * :insurance_card (Hash)
        #     * :member_id (String)
        #     * :payer_name (String)
        #     * :payer_id (String)
        #     * :rx_bin (String)
        #     * :rx_pcn (String)
        #     * :image_url_front (String)
        #     * :image_url_back (String)
        #     * :emr_payer_crosswalk (CandidApiClient::Commons::Types::EmrPayerCrosswalk)
        #     * :group_number (String)
        #     * :plan_name (String)
        #     * :plan_type (CandidApiClient::Commons::Types::SourceOfPaymentCode)
        #     * :insurance_type (CandidApiClient::Commons::Types::InsuranceTypeCode)
        #   * :patient_relationship_to_subscriber_code (CandidApiClient::Commons::Types::PatientRelationshipToInsuredCodeAll)
        #   * :date_of_birth (Date)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :gender (CandidApiClient::Individual::Types::Gender)
        # @param diagnoses [Array<Hash>] Ideally, this field should contain no more than 12 diagnoses. However, more
        #  diagnoses
        #  may be submitted at this time, and coders will later prioritize the 12 that will
        #  be
        #  submitted to the payor.Request of type Array<CandidApiClient::Diagnoses::Types::DiagnosisCreate>, as a Hash
        #   * :name (String)
        #   * :code_type (CandidApiClient::Diagnoses::Types::DiagnosisTypeCode)
        #   * :code (String)
        # @param clinical_notes [Array<Hash>] Holds a collection of clinical observations made by healthcare providers during
        #  patient encounters.Request of type Array<CandidApiClient::Encounters::V4::Types::ClinicalNoteCategoryCreate>, as a Hash
        #   * :category (CandidApiClient::Encounters::V4::Types::NoteCategory)
        #   * :notes (Array<CandidApiClient::Encounters::V4::Types::ClinicalNote>)
        # @param billing_notes [Array<Hash>] Spot to store misc, human-readable, notes about this encounter to be used
        #  in the billing process.Request of type Array<CandidApiClient::BillingNotes::V2::Types::BillingNoteBase>, as a Hash
        #   * :text (String)
        # @param place_of_service_code [CandidApiClient::Commons::Types::FacilityTypeCode] Box 24B on the CMS-1500 claim form. Line-level place of service is not currently
        #  supported. 02 for telemedicine, 11 for in-person. Full list
        #  //www.cms.gov/Medicare/Coding/place-of-service-codes/Place_of_Service_Code_Set).
        # @param patient_histories [Array<Hash>] Request of type Array<CandidApiClient::Encounters::V4::Types::PatientHistoryCategory>, as a Hash
        #   * :category (CandidApiClient::Encounters::V4::Types::PatientHistoryCategoryEnum)
        #   * :questions (Array<CandidApiClient::Encounters::V4::Types::IntakeQuestion>)
        # @param service_lines [Array<Hash>] Each service line must be linked to a diagnosis. Concretely,
        #  `service_line.diagnosis_pointers`must contain at least one entry which should be
        #  in bounds of the diagnoses list field.Request of type Array<CandidApiClient::ServiceLines::V2::Types::ServiceLineCreate>, as a Hash
        #   * :modifiers (Array<CandidApiClient::Commons::Types::ProcedureModifier>)
        #   * :procedure_code (String)
        #   * :quantity (String)
        #   * :units (CandidApiClient::Commons::Types::ServiceLineUnits)
        #   * :charge_amount_cents (Integer)
        #   * :diagnosis_pointers (Array<Integer>)
        #   * :drug_identification (Hash)
        #     * :service_id_qualifier (CandidApiClient::ServiceLines::V2::Types::ServiceIdQualifier)
        #     * :national_drug_code (String)
        #     * :national_drug_unit_count (String)
        #     * :measurement_unit_code (CandidApiClient::ServiceLines::V2::Types::MeasurementUnitCode)
        #     * :link_sequence_number (String)
        #     * :pharmacy_prescription_number (String)
        #     * :conversion_formula (String)
        #   * :place_of_service_code (CandidApiClient::Commons::Types::FacilityTypeCode)
        #   * :description (String)
        #   * :date_of_service (Date)
        #   * :end_date_of_service (Date)
        #   * :ordering_provider (Hash)
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
        # @param guarantor [Hash] Personal and contact info for the guarantor of the patient responsibility.Request of type CandidApiClient::Guarantor::V1::Types::GuarantorCreate, as a Hash
        #   * :phone_numbers (Array<CandidApiClient::Commons::Types::PhoneNumber>)
        #   * :phone_consent (Boolean)
        #   * :email (String)
        #   * :email_consent (Boolean)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :external_id (String)
        #   * :date_of_birth (Date)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        # @param external_claim_submission [Hash] ***This field is in beta.***
        #  To be included for claims that have been submitted outside of Candid.
        #  Candid supports posting remits and payments to these claims and working them
        #  in-platform (e.g. editing, resubmitting).Request of type CandidApiClient::ClaimSubmission::V1::Types::ExternalClaimSubmissionCreate, as a Hash
        #   * :claim_created_at (DateTime)
        #   * :patient_control_number (String)
        #   * :submission_records (Array<CandidApiClient::ClaimSubmission::V1::Types::ClaimSubmissionRecordCreate>)
        # @param tag_ids [Array<String>] Names of tags that should be on the encounter.
        # @param schema_instances [Array<Hash>] Key-value pairs that must adhere to a schema created via the Custom Schema API.
        #  Multiple schema
        #  instances cannot be created for the same schema on an encounter.Request of type Array<CandidApiClient::CustomSchemas::V1::Types::SchemaInstance>, as a Hash
        #   * :schema_id (String)
        #   * :content (Hash{String => Object})
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Encounters::V4::Types::Encounter]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.encounters.v_4.create(
        #    date_of_service: DateTime.parse(2023-01-15),
        #    end_date_of_service: DateTime.parse(2023-01-15),
        #    patient: { phone_numbers: [{ number: "1234567890", type: HOME }], phone_consent: true, email: "johndoe@joincandidhealth.com", non_insurance_payers: ["d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32"], email_consent: true, external_id: "string", date_of_birth: DateTime.parse(2023-01-15), address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" }, first_name: "string", last_name: "string", gender: MALE },
        #    billing_provider: { address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" }, tax_id: "string", npi: "string", taxonomy_code: "string", first_name: "string", last_name: "string", organization_name: "string" },
        #    rendering_provider: { address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" }, npi: "string", taxonomy_code: "string", first_name: "string", last_name: "string", organization_name: "string" },
        #    referring_provider: { npi: "string", taxonomy_code: "string", address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" }, first_name: "string", last_name: "string", organization_name: "string" },
        #    initial_referring_provider: { npi: "string", taxonomy_code: "string", address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" }, qualifier: DQ, first_name: "string", last_name: "string", organization_name: "string" },
        #    supervising_provider: { npi: "string", taxonomy_code: "string", address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" }, first_name: "string", last_name: "string", organization_name: "string" },
        #    service_facility: { organization_name: "string", npi: "string", address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" } },
        #    subscriber_primary: { insurance_card: { member_id: "string", payer_name: "string", payer_id: "string", rx_bin: "string", rx_pcn: "string", image_url_front: "string", image_url_back: "string", emr_payer_crosswalk: HEALTHIE, group_number: "string", plan_name: "string", plan_type: SELF_PAY, insurance_type: C_01 }, patient_relationship_to_subscriber_code: SPOUSE, date_of_birth: DateTime.parse(2023-01-15), address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" }, first_name: "string", last_name: "string", gender: MALE },
        #    subscriber_secondary: { insurance_card: { member_id: "string", payer_name: "string", payer_id: "string", rx_bin: "string", rx_pcn: "string", image_url_front: "string", image_url_back: "string", emr_payer_crosswalk: HEALTHIE, group_number: "string", plan_name: "string", plan_type: SELF_PAY, insurance_type: C_01 }, patient_relationship_to_subscriber_code: SPOUSE, date_of_birth: DateTime.parse(2023-01-15), address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" }, first_name: "string", last_name: "string", gender: MALE },
        #    diagnoses: [{ name: "string", code_type: ABF, code: "string" }],
        #    clinical_notes: [{ category: CLINICAL, notes: [{ text: "string", author_name: "string", author_npi: "string", timestamp: DateTime.parse(2024-01-15T09:30:00.000Z) }] }],
        #    billing_notes: [{ text: "string" }],
        #    place_of_service_code: PHARMACY,
        #    patient_histories: [{ category: PRESENT_ILLNESS, questions: [{ id: "6E7FBCE4-A8EA-46D0-A8D8-FF83CA3BB176", text: "Do you have any allergies?", responses: [{ response: "No allergies", follow_ups: [{ id: "4F3D57F9-AC94-49D6-87E4-E804B709917A", text: "Do you have any allergies?", response: "No allergies" }] }] }] }],
        #    service_lines: [{ modifiers: [TWENTY_TWO], procedure_code: "string", quantity: "string", units: MJ, charge_amount_cents: 1, diagnosis_pointers: [1], drug_identification: { service_id_qualifier: EAN_UCC_13, national_drug_code: "string", national_drug_unit_count: "string", measurement_unit_code: MILLILITERS, link_sequence_number: "string", pharmacy_prescription_number: "string", conversion_formula: "string" }, place_of_service_code: PHARMACY, description: "string", date_of_service: DateTime.parse(2023-01-15), end_date_of_service: DateTime.parse(2023-01-15), ordering_provider: { npi: "string", taxonomy_code: "string", address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" }, first_name: "string", last_name: "string", organization_name: "string" } }],
        #    guarantor: { phone_numbers: [{ number: "1234567890", type: HOME }], phone_consent: true, email: "johndoe@joincandidhealth.com", email_consent: true, first_name: "string", last_name: "string", external_id: "string", date_of_birth: DateTime.parse(2023-01-15), address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" } },
        #    external_claim_submission: { claim_created_at: DateTime.parse(2023-01-01T12:00:00.000Z), patient_control_number: "PATIENT_CONTROL_NUMBER", submission_records: [{ submitted_at: DateTime.parse(2023-01-01T13:00:00.000Z), claim_frequency_code: ORIGINAL, payer_responsibility: PRIMARY, intended_submission_medium: ELECTRONIC }, { submitted_at: DateTime.parse(2023-01-04T12:00:00.000Z), claim_frequency_code: REPLACEMENT, payer_responsibility: PRIMARY, intended_submission_medium: PAPER }] },
        #    tag_ids: ["string"],
        #    schema_instances: [{ schema_id: "ec096b13-f80a-471d-aaeb-54b021c9d582", content: { "provider_category": "internist", "is_urgent_care": true, "bmi": 24.2, "age": 38 } }]
        #  )
        def create(external_id:, patient_authorized_release:, benefits_assigned_to_provider:,
                   provider_accepts_assignment:, billable_status:, responsible_party:, patient:, billing_provider:, rendering_provider:, diagnoses:, place_of_service_code:, prior_authorization_number: nil, appointment_type: nil, existing_medications: nil, vitals: nil, interventions: nil, pay_to_address: nil, synchronicity: nil, additional_information: nil, service_authorization_exception_code: nil, admission_date: nil, discharge_date: nil, onset_of_current_illness_or_symptom_date: nil, last_menstrual_period_date: nil, delay_reason_code: nil, additional_properties: nil, _field_set: nil, date_of_service: nil, end_date_of_service: nil, referring_provider: nil, initial_referring_provider: nil, supervising_provider: nil, service_facility: nil, subscriber_primary: nil, subscriber_secondary: nil, clinical_notes: nil, billing_notes: nil, patient_histories: nil, service_lines: nil, guarantor: nil, external_claim_submission: nil, tag_ids: nil, schema_instances: nil, request_options: nil)
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
              external_id: external_id,
              prior_authorization_number: prior_authorization_number,
              patient_authorized_release: patient_authorized_release,
              benefits_assigned_to_provider: benefits_assigned_to_provider,
              provider_accepts_assignment: provider_accepts_assignment,
              appointment_type: appointment_type,
              existing_medications: existing_medications,
              vitals: vitals,
              interventions: interventions,
              pay_to_address: pay_to_address,
              synchronicity: synchronicity,
              billable_status: billable_status,
              responsible_party: responsible_party,
              additional_information: additional_information,
              service_authorization_exception_code: service_authorization_exception_code,
              admission_date: admission_date,
              discharge_date: discharge_date,
              onset_of_current_illness_or_symptom_date: onset_of_current_illness_or_symptom_date,
              last_menstrual_period_date: last_menstrual_period_date,
              delay_reason_code: delay_reason_code,
              additional_properties: additional_properties,
              _field_set: _field_set,
              date_of_service: date_of_service,
              end_date_of_service: end_date_of_service,
              patient: patient,
              billing_provider: billing_provider,
              rendering_provider: rendering_provider,
              referring_provider: referring_provider,
              initial_referring_provider: initial_referring_provider,
              supervising_provider: supervising_provider,
              service_facility: service_facility,
              subscriber_primary: subscriber_primary,
              subscriber_secondary: subscriber_secondary,
              diagnoses: diagnoses,
              clinical_notes: clinical_notes,
              billing_notes: billing_notes,
              place_of_service_code: place_of_service_code,
              patient_histories: patient_histories,
              service_lines: service_lines,
              guarantor: guarantor,
              external_claim_submission: external_claim_submission,
              tag_ids: tag_ids,
              schema_instances: schema_instances
            }.compact
            req.url "#{@request_client.get_url(environment: CandidApi,
                                               request_options: request_options)}/api/encounters/v4"
          end
          CandidApiClient::Encounters::V4::Types::Encounter.from_json(json_object: response.body)
        end

        # @param encounter_id [String]
        # @param prior_authorization_number [String] Box 23 on the CMS-1500 claim form.
        # @param external_id [String] A client-specified unique ID to associate with this encounter;
        #  for example, your internal encounter ID or a Dr. Chrono encounter ID.
        #  This field should not contain PHI.
        # @param date_of_service [Date] Date formatted as YYYY-MM-DD; eg: 2019-08-24.
        #  This date must be the local date in the timezone where the service occurred.
        #  Box 24a on the CMS-1500 claim form.
        #  If service occurred over a range of dates, this should be the start date.
        #  If service lines have distinct date_of_service values, updating the encounter's
        #  date_of_service will fail. If all service line date_of_service values are the
        #  same, updating the encounter's date_of_service will update all service line
        #  date_of_service values.
        # @param diagnosis_ids [Array<String>] Ideally, this field should contain no more than 12 diagnoses. However, more
        #  diagnoses
        #  may be submitted at this time, and coders will later prioritize the 12 that will
        #  be
        #  submitted to the payor.
        # @param tag_ids [Array<String>] Names of tags that should be on the encounter.  Note all tags on encounter will
        #  be overriden with this list.
        # @param clinical_notes [Array<Hash>] Holds a collection of clinical observations made by healthcare providers during
        #  patient encounters.Request of type Array<CandidApiClient::Encounters::V4::Types::ClinicalNoteCategoryCreate>, as a Hash
        #   * :category (CandidApiClient::Encounters::V4::Types::NoteCategory)
        #   * :notes (Array<CandidApiClient::Encounters::V4::Types::ClinicalNote>)
        # @param pay_to_address [Hash] Specifies the address to which payments for the claim should be sent.Request of type CandidApiClient::Commons::Types::StreetAddressLongZip, as a Hash
        #   * :zip_plus_four_code (String)
        #   * :address_1 (String)
        #   * :address_2 (String)
        #   * :city (String)
        #   * :state (CandidApiClient::Commons::Types::State)
        #   * :zip_code (String)
        # @param billable_status [CandidApiClient::Encounters::V4::Types::BillableStatusType] Defines if the Encounter is to be billed by Candid to the responsible_party.
        #  Examples for when this should be set to NOT_BILLABLE include if the Encounter
        #  has not occurred yet or if there is no intention of ever billing the
        #  responsible_party.
        # @param responsible_party [CandidApiClient::Encounters::V4::Types::ResponsiblePartyType] Defines the party to be billed with the initial balance owed on the claim. Use
        #  SELF_PAY if you intend to bill self pay/cash pay.
        # @param provider_accepts_assignment [Boolean] Whether you have accepted the patient's authorization for insurance payments to
        #  be made to you, not them. Box 27 on the CMS-1500 claim form.
        # @param benefits_assigned_to_provider [Boolean] Whether this patient has authorized insurance payments to be made to you, not
        #  them. If false, patient may receive reimbursement. Box 13 on the CMS-1500 claim
        #  form.
        # @param synchronicity [CandidApiClient::Encounters::V4::Types::SynchronicityType] Whether or not this was a synchronous or asynchronous encounter. Asynchronous
        #  encounters occur when providers and patients communicate online using forms,
        #  instant messaging, or other pre-recorded digital mediums. Synchronous encounters
        #  occur in live, real-time settings where the patient interacts directly with the
        #  provider, such as over video or a phone call.
        # @param place_of_service_code [CandidApiClient::Commons::Types::FacilityTypeCode] Box 24B on the CMS-1500 claim form. Line-level place of service is not currently
        #  supported. 02 for telemedicine, 11 for in-person. Full list
        #  //www.cms.gov/Medicare/Coding/place-of-service-codes/Place_of_Service_Code_Set).
        # @param place_of_service_code_as_submitted [CandidApiClient::Commons::Types::FacilityTypeCode] Box 24B on the CMS-1500 claim form. Line-level place of service is not currently
        #  supported. 02 for telemedicine, 11 for in-person. Full list
        #  //www.cms.gov/Medicare/Coding/place-of-service-codes/Place_of_Service_Code_Set).
        # @param appointment_type [String] Human-readable description of the appointment type (ex: "Acupuncture -
        #  Headaches").
        # @param end_date_of_service [Date] Date formatted as YYYY-MM-DD; eg: 2019-08-25.
        #  This date must be the local date in the timezone where the service occurred.
        #  If omitted, the Encounter is assumed to be for a single day.
        #  Must not be temporally before the date_of_service field.
        #  If service lines have distinct end_date_of_service values, updating the
        #  encounter's end_date_of_service will fail. If all service line
        #  end_date_of_service values are the same, updating the encounter's
        #  end_date_of_service will update all service line date_of_service values.
        # @param subscriber_primary [Hash] Contains details of the primary insurance subscriber.Request of type CandidApiClient::Individual::Types::SubscriberCreate, as a Hash
        #   * :insurance_card (Hash)
        #     * :member_id (String)
        #     * :payer_name (String)
        #     * :payer_id (String)
        #     * :rx_bin (String)
        #     * :rx_pcn (String)
        #     * :image_url_front (String)
        #     * :image_url_back (String)
        #     * :emr_payer_crosswalk (CandidApiClient::Commons::Types::EmrPayerCrosswalk)
        #     * :group_number (String)
        #     * :plan_name (String)
        #     * :plan_type (CandidApiClient::Commons::Types::SourceOfPaymentCode)
        #     * :insurance_type (CandidApiClient::Commons::Types::InsuranceTypeCode)
        #   * :patient_relationship_to_subscriber_code (CandidApiClient::Commons::Types::PatientRelationshipToInsuredCodeAll)
        #   * :date_of_birth (Date)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :gender (CandidApiClient::Individual::Types::Gender)
        # @param subscriber_secondary [Hash] Contains details of the secondary insurance subscriber.Request of type CandidApiClient::Individual::Types::SubscriberCreate, as a Hash
        #   * :insurance_card (Hash)
        #     * :member_id (String)
        #     * :payer_name (String)
        #     * :payer_id (String)
        #     * :rx_bin (String)
        #     * :rx_pcn (String)
        #     * :image_url_front (String)
        #     * :image_url_back (String)
        #     * :emr_payer_crosswalk (CandidApiClient::Commons::Types::EmrPayerCrosswalk)
        #     * :group_number (String)
        #     * :plan_name (String)
        #     * :plan_type (CandidApiClient::Commons::Types::SourceOfPaymentCode)
        #     * :insurance_type (CandidApiClient::Commons::Types::InsuranceTypeCode)
        #   * :patient_relationship_to_subscriber_code (CandidApiClient::Commons::Types::PatientRelationshipToInsuredCodeAll)
        #   * :date_of_birth (Date)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :gender (CandidApiClient::Individual::Types::Gender)
        # @param additional_information [String] Defines additional information on the claim needed by the payer.
        #  Box 19 on the CMS-1500 claim form.
        # @param service_authorization_exception_code [CandidApiClient::Encounters::V4::Types::ServiceAuthorizationExceptionCode] 837p Loop2300 REF*4N
        #  Required when mandated by government law or regulation to obtain authorization
        #  for specific service(s) but, for the
        #  reasons listed in one of the enum values of ServiceAuthorizationExceptionCode,
        #  the service was performed without
        #  obtaining the authorization.
        # @param admission_date [Date] 837p Loop2300 DTP*435, CMS-1500 Box 18
        #  Required on all ambulance claims when the patient was known to be admitted to
        #  the hospital.
        #  OR
        #  Required on all claims involving inpatient medical visits.
        # @param discharge_date [Date] 837p Loop2300 DTP*096, CMS-1500 Box 18
        #  Required for inpatient claims when the patient was discharged from the facility
        #  and the discharge date is known.
        # @param onset_of_current_illness_or_symptom_date [Date] 837p Loop2300 DTP*431, CMS-1500 Box 14
        #  Required for the initial medical service or visit performed in response to a
        #  medical emergency when the date is available and is different than the date of
        #  service.
        #  OR
        #  This date is the onset of acute symptoms for the current illness or condition.
        # @param last_menstrual_period_date [Date] 837p Loop2300 DTP*484, CMS-1500 Box 14
        #  Required when, in the judgment of the provider, the services on this claim are
        #  related to the patient's pregnancy.
        # @param delay_reason_code [CandidApiClient::Commons::Types::DelayReasonCode] 837i Loop2300, CLM-1300 Box 20
        #  Code indicating the reason why a request was delayed
        # @param patient_authorized_release [Boolean] Whether this patient has authorized the release of medical information
        #  for billing purpose.
        #  Box 12 on the CMS-1500 claim form.
        # @param schema_instances [Array<Hash>] Key-value pairs that must adhere to a schema created via the Custom Schema API.
        #  Multiple schema
        #  instances cannot be created for the same schema on an encounter. Updating schema
        #  instances utilizes PUT
        #  semantics, so the schema instances on the encounter will be set to whatever
        #  inputs are provided. If null
        #  is provided as an input, then the encounter's schema instances will be cleared.Request of type Array<CandidApiClient::CustomSchemas::V1::Types::SchemaInstance>, as a Hash
        #   * :schema_id (String)
        #   * :content (Hash{String => Object})
        # @param vitals [Hash] If a vitals entity already exists for the encounter, then all values will be
        #  updated to the provided values.
        #  Otherwise, a new vitals object will be created for the encounter.Request of type CandidApiClient::Encounters::V4::Types::VitalsUpdate, as a Hash
        #   * :height_in (Integer)
        #   * :weight_lbs (Integer)
        #   * :blood_pressure_systolic_mmhg (Integer)
        #   * :blood_pressure_diastolic_mmhg (Integer)
        #   * :body_temperature_f (Float)
        #   * :hemoglobin_gdl (Float)
        #   * :hematocrit_pct (Float)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Encounters::V4::Types::Encounter]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.encounters.v_4.update(
        #    encounter_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    prior_authorization_number: "string",
        #    external_id: "string",
        #    date_of_service: DateTime.parse(2023-01-15),
        #    diagnosis_ids: ["d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32"],
        #    tag_ids: ["string"],
        #    clinical_notes: [{ category: CLINICAL, notes: [{ text: "string", author_name: "string", author_npi: "string", timestamp: DateTime.parse(2024-01-15T09:30:00.000Z) }] }],
        #    pay_to_address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" },
        #    billable_status: BILLABLE,
        #    responsible_party: INSURANCE_PAY,
        #    provider_accepts_assignment: true,
        #    benefits_assigned_to_provider: true,
        #    synchronicity: SYNCHRONOUS,
        #    place_of_service_code: PHARMACY,
        #    place_of_service_code_as_submitted: PHARMACY,
        #    appointment_type: "string",
        #    end_date_of_service: DateTime.parse(2023-01-15),
        #    subscriber_primary: { insurance_card: { member_id: "string", payer_name: "string", payer_id: "string", rx_bin: "string", rx_pcn: "string", image_url_front: "string", image_url_back: "string", emr_payer_crosswalk: HEALTHIE, group_number: "string", plan_name: "string", plan_type: SELF_PAY, insurance_type: C_01 }, patient_relationship_to_subscriber_code: SPOUSE, date_of_birth: DateTime.parse(2023-01-15), address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" }, first_name: "string", last_name: "string", gender: MALE },
        #    subscriber_secondary: { insurance_card: { member_id: "string", payer_name: "string", payer_id: "string", rx_bin: "string", rx_pcn: "string", image_url_front: "string", image_url_back: "string", emr_payer_crosswalk: HEALTHIE, group_number: "string", plan_name: "string", plan_type: SELF_PAY, insurance_type: C_01 }, patient_relationship_to_subscriber_code: SPOUSE, date_of_birth: DateTime.parse(2023-01-15), address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" }, first_name: "string", last_name: "string", gender: MALE },
        #    additional_information: "string",
        #    service_authorization_exception_code: C_1,
        #    admission_date: DateTime.parse(2023-01-15),
        #    discharge_date: DateTime.parse(2023-01-15),
        #    onset_of_current_illness_or_symptom_date: DateTime.parse(2023-01-15),
        #    last_menstrual_period_date: DateTime.parse(2023-01-15),
        #    delay_reason_code: C_1,
        #    patient_authorized_release: true,
        #    schema_instances: [{ schema_id: "ec096b13-f80a-471d-aaeb-54b021c9d582", content: { "provider_category": "internist", "is_urgent_care": true, "bmi": 24.2, "age": 38 } }],
        #    vitals: { height_in: 70, weight_lbs: 165, blood_pressure_systolic_mmhg: 115, blood_pressure_diastolic_mmhg: 85, body_temperature_f: 98, hemoglobin_gdl: 15.1, hematocrit_pct: 51.2 }
        #  )
        def update(encounter_id:, prior_authorization_number: nil, external_id: nil, date_of_service: nil,
                   diagnosis_ids: nil, tag_ids: nil, clinical_notes: nil, pay_to_address: nil, billable_status: nil, responsible_party: nil, provider_accepts_assignment: nil, benefits_assigned_to_provider: nil, synchronicity: nil, place_of_service_code: nil, place_of_service_code_as_submitted: nil, appointment_type: nil, end_date_of_service: nil, subscriber_primary: nil, subscriber_secondary: nil, additional_information: nil, service_authorization_exception_code: nil, admission_date: nil, discharge_date: nil, onset_of_current_illness_or_symptom_date: nil, last_menstrual_period_date: nil, delay_reason_code: nil, patient_authorized_release: nil, schema_instances: nil, vitals: nil, request_options: nil)
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
              prior_authorization_number: prior_authorization_number,
              external_id: external_id,
              date_of_service: date_of_service,
              diagnosis_ids: diagnosis_ids,
              tag_ids: tag_ids,
              clinical_notes: clinical_notes,
              pay_to_address: pay_to_address,
              billable_status: billable_status,
              responsible_party: responsible_party,
              provider_accepts_assignment: provider_accepts_assignment,
              benefits_assigned_to_provider: benefits_assigned_to_provider,
              synchronicity: synchronicity,
              place_of_service_code: place_of_service_code,
              place_of_service_code_as_submitted: place_of_service_code_as_submitted,
              appointment_type: appointment_type,
              end_date_of_service: end_date_of_service,
              subscriber_primary: subscriber_primary,
              subscriber_secondary: subscriber_secondary,
              additional_information: additional_information,
              service_authorization_exception_code: service_authorization_exception_code,
              admission_date: admission_date,
              discharge_date: discharge_date,
              onset_of_current_illness_or_symptom_date: onset_of_current_illness_or_symptom_date,
              last_menstrual_period_date: last_menstrual_period_date,
              delay_reason_code: delay_reason_code,
              patient_authorized_release: patient_authorized_release,
              schema_instances: schema_instances,
              vitals: vitals
            }.compact
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

        # @param external_id [String] A client-specified unique ID to associate with this encounter;
        #  for example, your internal encounter ID or a Dr. Chrono encounter ID.
        #  This field should not contain PHI.
        # @param prior_authorization_number [String] Box 23 on the CMS-1500 claim form.
        # @param patient_authorized_release [Boolean] Whether this patient has authorized the release of medical information
        #  for billing purpose.
        #  Box 12 on the CMS-1500 claim form.
        # @param benefits_assigned_to_provider [Boolean] Whether this patient has authorized insurance payments to be made to you,
        #  not them. If false, patient may receive reimbursement.
        #  Box 13 on the CMS-1500 claim form.
        # @param provider_accepts_assignment [Boolean] Whether you have accepted the patient's authorization for insurance payments
        #  to be made to you, not them.
        #  Box 27 on the CMS-1500 claim form.
        # @param appointment_type [String] Human-readable description of the appointment type (ex: "Acupuncture -
        #  Headaches").
        # @param existing_medications [Array<Hash>] Request of type Array<CandidApiClient::Encounters::V4::Types::Medication>, as a Hash
        #   * :name (String)
        #   * :rx_cui (String)
        #   * :dosage (String)
        #   * :dosage_form (String)
        #   * :frequency (String)
        #   * :as_needed (Boolean)
        # @param vitals [Hash] Request of type CandidApiClient::Encounters::V4::Types::Vitals, as a Hash
        #   * :height_in (Integer)
        #   * :weight_lbs (Integer)
        #   * :blood_pressure_systolic_mmhg (Integer)
        #   * :blood_pressure_diastolic_mmhg (Integer)
        #   * :body_temperature_f (Float)
        #   * :hemoglobin_gdl (Float)
        #   * :hematocrit_pct (Float)
        # @param interventions [Array<Hash>] Request of type Array<CandidApiClient::Encounters::V4::Types::Intervention>, as a Hash
        #   * :name (String)
        #   * :category (CandidApiClient::Encounters::V4::Types::InterventionCategory)
        #   * :description (String)
        #   * :medication (Hash)
        #     * :name (String)
        #     * :rx_cui (String)
        #     * :dosage (String)
        #     * :dosage_form (String)
        #     * :frequency (String)
        #     * :as_needed (Boolean)
        #   * :labs (Array<CandidApiClient::Encounters::V4::Types::Lab>)
        # @param pay_to_address [Hash] Specifies the address to which payments for the claim should be sent.Request of type CandidApiClient::Commons::Types::StreetAddressLongZip, as a Hash
        #   * :zip_plus_four_code (String)
        #   * :address_1 (String)
        #   * :address_2 (String)
        #   * :city (String)
        #   * :state (CandidApiClient::Commons::Types::State)
        #   * :zip_code (String)
        # @param synchronicity [CandidApiClient::Encounters::V4::Types::SynchronicityType] Whether or not this was a synchronous or asynchronous encounter.
        #  Asynchronous encounters occur when providers and patients communicate online
        #  using
        #  forms, instant messaging, or other pre-recorded digital mediums.
        #  Synchronous encounters occur in live, real-time settings where the patient
        #  interacts
        #  directly with the provider, such as over video or a phone call.
        # @param billable_status [CandidApiClient::Encounters::V4::Types::BillableStatusType] Defines if the Encounter is to be billed by Candid to the responsible_party.
        #  Examples for when this should be set to NOT_BILLABLE include
        #  if the Encounter has not occurred yet or if there is no intention of ever
        #  billing the responsible_party.
        # @param responsible_party [CandidApiClient::Encounters::V4::Types::ResponsiblePartyType] Defines the party to be billed with the initial balance owed on the claim.
        # @param additional_information [String] Defines additional information on the claim needed by the payer.
        #  Box 19 on the CMS-1500 claim form.
        # @param service_authorization_exception_code [CandidApiClient::Encounters::V4::Types::ServiceAuthorizationExceptionCode] 837p Loop2300 REF\*4N
        #  Required when mandated by government law or regulation to obtain authorization
        #  for specific service(s) but, for the
        #  reasons listed in one of the enum values of ServiceAuthorizationExceptionCode,
        #  the service was performed without
        #  obtaining the authorization.
        # @param admission_date [Date] 837p Loop2300 DTP\*435, CMS-1500 Box 18
        #  Required on all ambulance claims when the patient was known to be admitted to
        #  the hospital.
        #  OR
        #  Required on all claims involving inpatient medical visits.
        # @param discharge_date [Date] 837p Loop2300 DTP\*096, CMS-1500 Box 18
        #  Required for inpatient claims when the patient was discharged from the facility
        #  and the discharge date is known.
        # @param onset_of_current_illness_or_symptom_date [Date] 837p Loop2300 DTP\*431, CMS-1500 Box 14
        #  Required for the initial medical service or visit performed in response to a
        #  medical emergency when the date is available and is different than the date of
        #  service.
        #  OR
        #  This date is the onset of acute symptoms for the current illness or condition.
        # @param last_menstrual_period_date [Date] 837p Loop2300 DTP\*484, CMS-1500 Box 14
        #  Required when, in the judgment of the provider, the services on this claim are
        #  related to the patient's pregnancy.
        # @param delay_reason_code [CandidApiClient::Commons::Types::DelayReasonCode] 837i Loop2300, CLM-1300 Box 20
        #  Code indicating the reason why a request was delayed
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @param _field_set [Object]
        # @param date_of_service [Date] Date formatted as YYYY-MM-DD; eg: 2019-08-24.
        #  This date must be the local date in the timezone where the service occurred.
        #  Box 24a on the CMS-1500 claim form.
        #  If service occurred over a range of dates, this should be the start date.
        #  date_of_service must be defined on either the encounter or the service lines but
        #  not both.
        #  If there are greater than zero service lines, it is recommended to specify
        #  date_of_service on the service_line instead of on the encounter to prepare for
        #  future API versions.
        # @param end_date_of_service [Date] Date formatted as YYYY-MM-DD; eg: 2019-08-25.
        #  This date must be the local date in the timezone where the service occurred.
        #  If omitted, the Encounter is assumed to be for a single day.
        #  Must not be temporally before the date_of_service field.
        #  If there are greater than zero service lines, it is recommended to specify
        #  end_date_of_service on the service_line instead of on the encounter to prepare
        #  for future API versions.
        # @param patient [Hash] Contains the identification information of the individual receiving medical
        #  services.Request of type CandidApiClient::Individual::Types::PatientCreate, as a Hash
        #   * :phone_numbers (Array<CandidApiClient::Commons::Types::PhoneNumber>)
        #   * :phone_consent (Boolean)
        #   * :email (String)
        #   * :non_insurance_payers (Array<String>)
        #   * :email_consent (Boolean)
        #   * :external_id (String)
        #   * :date_of_birth (Date)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :gender (CandidApiClient::Individual::Types::Gender)
        # @param billing_provider [Hash] The billing provider is the provider or business entity submitting the claim.
        #  Billing provider may be, but is not necessarily, the same person/NPI as the
        #  rendering provider. From a payer's perspective, this represents the person or
        #  entity being reimbursed. When a contract exists with the target payer, the
        #  billing provider should be the entity contracted with the payer. In some
        #  circumstances, this will be an individual provider. In that case, submit that
        #  provider's NPI and the tax ID (TIN) that the provider gave to the payer during
        #  contracting. In other cases, the billing entity will be a medical group. If so,
        #  submit the group NPI and the group's tax ID. Box 33 on the CMS-1500 claim form.Request of type CandidApiClient::EncounterProviders::V2::Types::BillingProvider, as a Hash
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :tax_id (String)
        #   * :npi (String)
        #   * :taxonomy_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :organization_name (String)
        # @param rendering_provider [Hash] The rendering provider is the practitioner -- physician, nurse practitioner,
        #  etc. -- performing the service.
        #  For telehealth services, the rendering provider performs the visit, asynchronous
        #  communication, or other service. The rendering provider address should generally
        #  be the same as the service facility address.Request of type CandidApiClient::EncounterProviders::V2::Types::RenderingProvider, as a Hash
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :npi (String)
        #   * :taxonomy_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :organization_name (String)
        # @param referring_provider [Hash] The final provider who referred the services that were rendered.
        #  All physicians who order services or refer Medicare beneficiaries must
        #  report this data.Request of type CandidApiClient::EncounterProviders::V2::Types::ReferringProvider, as a Hash
        #   * :npi (String)
        #   * :taxonomy_code (String)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :organization_name (String)
        # @param initial_referring_provider [Hash] The second iteration of Loop ID-2310. Use code "P3 - Primary Care Provider" in
        #  this loop to
        #  indicate the initial referral from the primary care provider or whatever
        #  provider wrote the initial referral for this patient's episode of care being
        #  billed/reported in this transaction.Request of type CandidApiClient::EncounterProviders::V2::Types::InitialReferringProvider, as a Hash
        #   * :npi (String)
        #   * :taxonomy_code (String)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :qualifier (CandidApiClient::Commons::Types::QualifierCode)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :organization_name (String)
        # @param supervising_provider [Hash] Required when the rendering provider is supervised by a physician. If not
        #  required by this implementation guide, do not send.Request of type CandidApiClient::EncounterProviders::V2::Types::SupervisingProvider, as a Hash
        #   * :npi (String)
        #   * :taxonomy_code (String)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :organization_name (String)
        # @param service_facility [Hash] Encounter Service facility is typically the location a medical service was
        #  rendered, such as a provider office or hospital. For telehealth, service
        #  facility can represent the provider's location when the service was delivered
        #  (e.g., home), or the location where an in-person visit would have taken place,
        #  whichever is easier to identify. If the provider is in-network, service facility
        #  may be defined in payer contracts. Box 32 on the CMS-1500 claim form. Note that
        #  for an in-network claim to be successfully adjudicated, the service facility
        #  address listed on claims must match what was provided to the payer during the
        #  credentialing process.Request of type CandidApiClient::ServiceFacility::Types::EncounterServiceFacilityBase, as a Hash
        #   * :organization_name (String)
        #   * :npi (String)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        # @param subscriber_primary [Hash] Subscriber_primary is required when responsible_party is INSURANCE_PAY (i.e.
        #  when the claim should be billed to insurance).
        #  These are not required fields when responsible_party is SELF_PAY (i.e. when the
        #  claim should be billed to the patient).
        #  However, if you collect this for patients, even self-pay, we recommend including
        #  it when sending encounters to Candid.
        #  Note: Cash Pay is no longer a valid payer_id in v4, please use responsible party
        #  to define self-pay claims.Request of type CandidApiClient::Individual::Types::SubscriberCreate, as a Hash
        #   * :insurance_card (Hash)
        #     * :member_id (String)
        #     * :payer_name (String)
        #     * :payer_id (String)
        #     * :rx_bin (String)
        #     * :rx_pcn (String)
        #     * :image_url_front (String)
        #     * :image_url_back (String)
        #     * :emr_payer_crosswalk (CandidApiClient::Commons::Types::EmrPayerCrosswalk)
        #     * :group_number (String)
        #     * :plan_name (String)
        #     * :plan_type (CandidApiClient::Commons::Types::SourceOfPaymentCode)
        #     * :insurance_type (CandidApiClient::Commons::Types::InsuranceTypeCode)
        #   * :patient_relationship_to_subscriber_code (CandidApiClient::Commons::Types::PatientRelationshipToInsuredCodeAll)
        #   * :date_of_birth (Date)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :gender (CandidApiClient::Individual::Types::Gender)
        # @param subscriber_secondary [Hash] Please always include this when you have it, even for self-pay claims.Request of type CandidApiClient::Individual::Types::SubscriberCreate, as a Hash
        #   * :insurance_card (Hash)
        #     * :member_id (String)
        #     * :payer_name (String)
        #     * :payer_id (String)
        #     * :rx_bin (String)
        #     * :rx_pcn (String)
        #     * :image_url_front (String)
        #     * :image_url_back (String)
        #     * :emr_payer_crosswalk (CandidApiClient::Commons::Types::EmrPayerCrosswalk)
        #     * :group_number (String)
        #     * :plan_name (String)
        #     * :plan_type (CandidApiClient::Commons::Types::SourceOfPaymentCode)
        #     * :insurance_type (CandidApiClient::Commons::Types::InsuranceTypeCode)
        #   * :patient_relationship_to_subscriber_code (CandidApiClient::Commons::Types::PatientRelationshipToInsuredCodeAll)
        #   * :date_of_birth (Date)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :gender (CandidApiClient::Individual::Types::Gender)
        # @param diagnoses [Array<Hash>] Ideally, this field should contain no more than 12 diagnoses. However, more
        #  diagnoses
        #  may be submitted at this time, and coders will later prioritize the 12 that will
        #  be
        #  submitted to the payor.Request of type Array<CandidApiClient::Diagnoses::Types::DiagnosisCreate>, as a Hash
        #   * :name (String)
        #   * :code_type (CandidApiClient::Diagnoses::Types::DiagnosisTypeCode)
        #   * :code (String)
        # @param clinical_notes [Array<Hash>] Holds a collection of clinical observations made by healthcare providers during
        #  patient encounters.Request of type Array<CandidApiClient::Encounters::V4::Types::ClinicalNoteCategoryCreate>, as a Hash
        #   * :category (CandidApiClient::Encounters::V4::Types::NoteCategory)
        #   * :notes (Array<CandidApiClient::Encounters::V4::Types::ClinicalNote>)
        # @param billing_notes [Array<Hash>] Spot to store misc, human-readable, notes about this encounter to be used
        #  in the billing process.Request of type Array<CandidApiClient::BillingNotes::V2::Types::BillingNoteBase>, as a Hash
        #   * :text (String)
        # @param place_of_service_code [CandidApiClient::Commons::Types::FacilityTypeCode] Box 24B on the CMS-1500 claim form. Line-level place of service is not currently
        #  supported. 02 for telemedicine, 11 for in-person. Full list
        #  //www.cms.gov/Medicare/Coding/place-of-service-codes/Place_of_Service_Code_Set).
        # @param patient_histories [Array<Hash>] Request of type Array<CandidApiClient::Encounters::V4::Types::PatientHistoryCategory>, as a Hash
        #   * :category (CandidApiClient::Encounters::V4::Types::PatientHistoryCategoryEnum)
        #   * :questions (Array<CandidApiClient::Encounters::V4::Types::IntakeQuestion>)
        # @param service_lines [Array<Hash>] Each service line must be linked to a diagnosis. Concretely,
        #  `service_line.diagnosis_pointers`must contain at least one entry which should be
        #  in bounds of the diagnoses list field.Request of type Array<CandidApiClient::ServiceLines::V2::Types::ServiceLineCreate>, as a Hash
        #   * :modifiers (Array<CandidApiClient::Commons::Types::ProcedureModifier>)
        #   * :procedure_code (String)
        #   * :quantity (String)
        #   * :units (CandidApiClient::Commons::Types::ServiceLineUnits)
        #   * :charge_amount_cents (Integer)
        #   * :diagnosis_pointers (Array<Integer>)
        #   * :drug_identification (Hash)
        #     * :service_id_qualifier (CandidApiClient::ServiceLines::V2::Types::ServiceIdQualifier)
        #     * :national_drug_code (String)
        #     * :national_drug_unit_count (String)
        #     * :measurement_unit_code (CandidApiClient::ServiceLines::V2::Types::MeasurementUnitCode)
        #     * :link_sequence_number (String)
        #     * :pharmacy_prescription_number (String)
        #     * :conversion_formula (String)
        #   * :place_of_service_code (CandidApiClient::Commons::Types::FacilityTypeCode)
        #   * :description (String)
        #   * :date_of_service (Date)
        #   * :end_date_of_service (Date)
        #   * :ordering_provider (Hash)
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
        # @param guarantor [Hash] Personal and contact info for the guarantor of the patient responsibility.Request of type CandidApiClient::Guarantor::V1::Types::GuarantorCreate, as a Hash
        #   * :phone_numbers (Array<CandidApiClient::Commons::Types::PhoneNumber>)
        #   * :phone_consent (Boolean)
        #   * :email (String)
        #   * :email_consent (Boolean)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :external_id (String)
        #   * :date_of_birth (Date)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        # @param external_claim_submission [Hash] ***This field is in beta.***
        #  To be included for claims that have been submitted outside of Candid.
        #  Candid supports posting remits and payments to these claims and working them
        #  in-platform (e.g. editing, resubmitting).Request of type CandidApiClient::ClaimSubmission::V1::Types::ExternalClaimSubmissionCreate, as a Hash
        #   * :claim_created_at (DateTime)
        #   * :patient_control_number (String)
        #   * :submission_records (Array<CandidApiClient::ClaimSubmission::V1::Types::ClaimSubmissionRecordCreate>)
        # @param tag_ids [Array<String>] Names of tags that should be on the encounter.
        # @param schema_instances [Array<Hash>] Key-value pairs that must adhere to a schema created via the Custom Schema API.
        #  Multiple schema
        #  instances cannot be created for the same schema on an encounter.Request of type Array<CandidApiClient::CustomSchemas::V1::Types::SchemaInstance>, as a Hash
        #   * :schema_id (String)
        #   * :content (Hash{String => Object})
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Encounters::V4::Types::Encounter]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.encounters.v_4.create(
        #    date_of_service: DateTime.parse(2023-01-15),
        #    end_date_of_service: DateTime.parse(2023-01-15),
        #    patient: { phone_numbers: [{ number: "1234567890", type: HOME }], phone_consent: true, email: "johndoe@joincandidhealth.com", non_insurance_payers: ["d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32"], email_consent: true, external_id: "string", date_of_birth: DateTime.parse(2023-01-15), address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" }, first_name: "string", last_name: "string", gender: MALE },
        #    billing_provider: { address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" }, tax_id: "string", npi: "string", taxonomy_code: "string", first_name: "string", last_name: "string", organization_name: "string" },
        #    rendering_provider: { address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" }, npi: "string", taxonomy_code: "string", first_name: "string", last_name: "string", organization_name: "string" },
        #    referring_provider: { npi: "string", taxonomy_code: "string", address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" }, first_name: "string", last_name: "string", organization_name: "string" },
        #    initial_referring_provider: { npi: "string", taxonomy_code: "string", address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" }, qualifier: DQ, first_name: "string", last_name: "string", organization_name: "string" },
        #    supervising_provider: { npi: "string", taxonomy_code: "string", address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" }, first_name: "string", last_name: "string", organization_name: "string" },
        #    service_facility: { organization_name: "string", npi: "string", address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" } },
        #    subscriber_primary: { insurance_card: { member_id: "string", payer_name: "string", payer_id: "string", rx_bin: "string", rx_pcn: "string", image_url_front: "string", image_url_back: "string", emr_payer_crosswalk: HEALTHIE, group_number: "string", plan_name: "string", plan_type: SELF_PAY, insurance_type: C_01 }, patient_relationship_to_subscriber_code: SPOUSE, date_of_birth: DateTime.parse(2023-01-15), address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" }, first_name: "string", last_name: "string", gender: MALE },
        #    subscriber_secondary: { insurance_card: { member_id: "string", payer_name: "string", payer_id: "string", rx_bin: "string", rx_pcn: "string", image_url_front: "string", image_url_back: "string", emr_payer_crosswalk: HEALTHIE, group_number: "string", plan_name: "string", plan_type: SELF_PAY, insurance_type: C_01 }, patient_relationship_to_subscriber_code: SPOUSE, date_of_birth: DateTime.parse(2023-01-15), address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" }, first_name: "string", last_name: "string", gender: MALE },
        #    diagnoses: [{ name: "string", code_type: ABF, code: "string" }],
        #    clinical_notes: [{ category: CLINICAL, notes: [{ text: "string", author_name: "string", author_npi: "string", timestamp: DateTime.parse(2024-01-15T09:30:00.000Z) }] }],
        #    billing_notes: [{ text: "string" }],
        #    place_of_service_code: PHARMACY,
        #    patient_histories: [{ category: PRESENT_ILLNESS, questions: [{ id: "6E7FBCE4-A8EA-46D0-A8D8-FF83CA3BB176", text: "Do you have any allergies?", responses: [{ response: "No allergies", follow_ups: [{ id: "4F3D57F9-AC94-49D6-87E4-E804B709917A", text: "Do you have any allergies?", response: "No allergies" }] }] }] }],
        #    service_lines: [{ modifiers: [TWENTY_TWO], procedure_code: "string", quantity: "string", units: MJ, charge_amount_cents: 1, diagnosis_pointers: [1], drug_identification: { service_id_qualifier: EAN_UCC_13, national_drug_code: "string", national_drug_unit_count: "string", measurement_unit_code: MILLILITERS, link_sequence_number: "string", pharmacy_prescription_number: "string", conversion_formula: "string" }, place_of_service_code: PHARMACY, description: "string", date_of_service: DateTime.parse(2023-01-15), end_date_of_service: DateTime.parse(2023-01-15), ordering_provider: { npi: "string", taxonomy_code: "string", address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" }, first_name: "string", last_name: "string", organization_name: "string" } }],
        #    guarantor: { phone_numbers: [{ number: "1234567890", type: HOME }], phone_consent: true, email: "johndoe@joincandidhealth.com", email_consent: true, first_name: "string", last_name: "string", external_id: "string", date_of_birth: DateTime.parse(2023-01-15), address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" } },
        #    external_claim_submission: { claim_created_at: DateTime.parse(2023-01-01T12:00:00.000Z), patient_control_number: "PATIENT_CONTROL_NUMBER", submission_records: [{ submitted_at: DateTime.parse(2023-01-01T13:00:00.000Z), claim_frequency_code: ORIGINAL, payer_responsibility: PRIMARY, intended_submission_medium: ELECTRONIC }, { submitted_at: DateTime.parse(2023-01-04T12:00:00.000Z), claim_frequency_code: REPLACEMENT, payer_responsibility: PRIMARY, intended_submission_medium: PAPER }] },
        #    tag_ids: ["string"],
        #    schema_instances: [{ schema_id: "ec096b13-f80a-471d-aaeb-54b021c9d582", content: { "provider_category": "internist", "is_urgent_care": true, "bmi": 24.2, "age": 38 } }]
        #  )
        def create(external_id:, patient_authorized_release:, benefits_assigned_to_provider:,
                   provider_accepts_assignment:, billable_status:, responsible_party:, patient:, billing_provider:, rendering_provider:, diagnoses:, place_of_service_code:, prior_authorization_number: nil, appointment_type: nil, existing_medications: nil, vitals: nil, interventions: nil, pay_to_address: nil, synchronicity: nil, additional_information: nil, service_authorization_exception_code: nil, admission_date: nil, discharge_date: nil, onset_of_current_illness_or_symptom_date: nil, last_menstrual_period_date: nil, delay_reason_code: nil, additional_properties: nil, _field_set: nil, date_of_service: nil, end_date_of_service: nil, referring_provider: nil, initial_referring_provider: nil, supervising_provider: nil, service_facility: nil, subscriber_primary: nil, subscriber_secondary: nil, clinical_notes: nil, billing_notes: nil, patient_histories: nil, service_lines: nil, guarantor: nil, external_claim_submission: nil, tag_ids: nil, schema_instances: nil, request_options: nil)
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
                external_id: external_id,
                prior_authorization_number: prior_authorization_number,
                patient_authorized_release: patient_authorized_release,
                benefits_assigned_to_provider: benefits_assigned_to_provider,
                provider_accepts_assignment: provider_accepts_assignment,
                appointment_type: appointment_type,
                existing_medications: existing_medications,
                vitals: vitals,
                interventions: interventions,
                pay_to_address: pay_to_address,
                synchronicity: synchronicity,
                billable_status: billable_status,
                responsible_party: responsible_party,
                additional_information: additional_information,
                service_authorization_exception_code: service_authorization_exception_code,
                admission_date: admission_date,
                discharge_date: discharge_date,
                onset_of_current_illness_or_symptom_date: onset_of_current_illness_or_symptom_date,
                last_menstrual_period_date: last_menstrual_period_date,
                delay_reason_code: delay_reason_code,
                additional_properties: additional_properties,
                _field_set: _field_set,
                date_of_service: date_of_service,
                end_date_of_service: end_date_of_service,
                patient: patient,
                billing_provider: billing_provider,
                rendering_provider: rendering_provider,
                referring_provider: referring_provider,
                initial_referring_provider: initial_referring_provider,
                supervising_provider: supervising_provider,
                service_facility: service_facility,
                subscriber_primary: subscriber_primary,
                subscriber_secondary: subscriber_secondary,
                diagnoses: diagnoses,
                clinical_notes: clinical_notes,
                billing_notes: billing_notes,
                place_of_service_code: place_of_service_code,
                patient_histories: patient_histories,
                service_lines: service_lines,
                guarantor: guarantor,
                external_claim_submission: external_claim_submission,
                tag_ids: tag_ids,
                schema_instances: schema_instances
              }.compact
              req.url "#{@request_client.get_url(environment: CandidApi,
                                                 request_options: request_options)}/api/encounters/v4"
            end
            CandidApiClient::Encounters::V4::Types::Encounter.from_json(json_object: response.body)
          end
        end

        # @param encounter_id [String]
        # @param prior_authorization_number [String] Box 23 on the CMS-1500 claim form.
        # @param external_id [String] A client-specified unique ID to associate with this encounter;
        #  for example, your internal encounter ID or a Dr. Chrono encounter ID.
        #  This field should not contain PHI.
        # @param date_of_service [Date] Date formatted as YYYY-MM-DD; eg: 2019-08-24.
        #  This date must be the local date in the timezone where the service occurred.
        #  Box 24a on the CMS-1500 claim form.
        #  If service occurred over a range of dates, this should be the start date.
        #  If service lines have distinct date_of_service values, updating the encounter's
        #  date_of_service will fail. If all service line date_of_service values are the
        #  same, updating the encounter's date_of_service will update all service line
        #  date_of_service values.
        # @param diagnosis_ids [Array<String>] Ideally, this field should contain no more than 12 diagnoses. However, more
        #  diagnoses
        #  may be submitted at this time, and coders will later prioritize the 12 that will
        #  be
        #  submitted to the payor.
        # @param tag_ids [Array<String>] Names of tags that should be on the encounter.  Note all tags on encounter will
        #  be overriden with this list.
        # @param clinical_notes [Array<Hash>] Holds a collection of clinical observations made by healthcare providers during
        #  patient encounters.Request of type Array<CandidApiClient::Encounters::V4::Types::ClinicalNoteCategoryCreate>, as a Hash
        #   * :category (CandidApiClient::Encounters::V4::Types::NoteCategory)
        #   * :notes (Array<CandidApiClient::Encounters::V4::Types::ClinicalNote>)
        # @param pay_to_address [Hash] Specifies the address to which payments for the claim should be sent.Request of type CandidApiClient::Commons::Types::StreetAddressLongZip, as a Hash
        #   * :zip_plus_four_code (String)
        #   * :address_1 (String)
        #   * :address_2 (String)
        #   * :city (String)
        #   * :state (CandidApiClient::Commons::Types::State)
        #   * :zip_code (String)
        # @param billable_status [CandidApiClient::Encounters::V4::Types::BillableStatusType] Defines if the Encounter is to be billed by Candid to the responsible_party.
        #  Examples for when this should be set to NOT_BILLABLE include if the Encounter
        #  has not occurred yet or if there is no intention of ever billing the
        #  responsible_party.
        # @param responsible_party [CandidApiClient::Encounters::V4::Types::ResponsiblePartyType] Defines the party to be billed with the initial balance owed on the claim. Use
        #  SELF_PAY if you intend to bill self pay/cash pay.
        # @param provider_accepts_assignment [Boolean] Whether you have accepted the patient's authorization for insurance payments to
        #  be made to you, not them. Box 27 on the CMS-1500 claim form.
        # @param benefits_assigned_to_provider [Boolean] Whether this patient has authorized insurance payments to be made to you, not
        #  them. If false, patient may receive reimbursement. Box 13 on the CMS-1500 claim
        #  form.
        # @param synchronicity [CandidApiClient::Encounters::V4::Types::SynchronicityType] Whether or not this was a synchronous or asynchronous encounter. Asynchronous
        #  encounters occur when providers and patients communicate online using forms,
        #  instant messaging, or other pre-recorded digital mediums. Synchronous encounters
        #  occur in live, real-time settings where the patient interacts directly with the
        #  provider, such as over video or a phone call.
        # @param place_of_service_code [CandidApiClient::Commons::Types::FacilityTypeCode] Box 24B on the CMS-1500 claim form. Line-level place of service is not currently
        #  supported. 02 for telemedicine, 11 for in-person. Full list
        #  //www.cms.gov/Medicare/Coding/place-of-service-codes/Place_of_Service_Code_Set).
        # @param place_of_service_code_as_submitted [CandidApiClient::Commons::Types::FacilityTypeCode] Box 24B on the CMS-1500 claim form. Line-level place of service is not currently
        #  supported. 02 for telemedicine, 11 for in-person. Full list
        #  //www.cms.gov/Medicare/Coding/place-of-service-codes/Place_of_Service_Code_Set).
        # @param appointment_type [String] Human-readable description of the appointment type (ex: "Acupuncture -
        #  Headaches").
        # @param end_date_of_service [Date] Date formatted as YYYY-MM-DD; eg: 2019-08-25.
        #  This date must be the local date in the timezone where the service occurred.
        #  If omitted, the Encounter is assumed to be for a single day.
        #  Must not be temporally before the date_of_service field.
        #  If service lines have distinct end_date_of_service values, updating the
        #  encounter's end_date_of_service will fail. If all service line
        #  end_date_of_service values are the same, updating the encounter's
        #  end_date_of_service will update all service line date_of_service values.
        # @param subscriber_primary [Hash] Contains details of the primary insurance subscriber.Request of type CandidApiClient::Individual::Types::SubscriberCreate, as a Hash
        #   * :insurance_card (Hash)
        #     * :member_id (String)
        #     * :payer_name (String)
        #     * :payer_id (String)
        #     * :rx_bin (String)
        #     * :rx_pcn (String)
        #     * :image_url_front (String)
        #     * :image_url_back (String)
        #     * :emr_payer_crosswalk (CandidApiClient::Commons::Types::EmrPayerCrosswalk)
        #     * :group_number (String)
        #     * :plan_name (String)
        #     * :plan_type (CandidApiClient::Commons::Types::SourceOfPaymentCode)
        #     * :insurance_type (CandidApiClient::Commons::Types::InsuranceTypeCode)
        #   * :patient_relationship_to_subscriber_code (CandidApiClient::Commons::Types::PatientRelationshipToInsuredCodeAll)
        #   * :date_of_birth (Date)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :gender (CandidApiClient::Individual::Types::Gender)
        # @param subscriber_secondary [Hash] Contains details of the secondary insurance subscriber.Request of type CandidApiClient::Individual::Types::SubscriberCreate, as a Hash
        #   * :insurance_card (Hash)
        #     * :member_id (String)
        #     * :payer_name (String)
        #     * :payer_id (String)
        #     * :rx_bin (String)
        #     * :rx_pcn (String)
        #     * :image_url_front (String)
        #     * :image_url_back (String)
        #     * :emr_payer_crosswalk (CandidApiClient::Commons::Types::EmrPayerCrosswalk)
        #     * :group_number (String)
        #     * :plan_name (String)
        #     * :plan_type (CandidApiClient::Commons::Types::SourceOfPaymentCode)
        #     * :insurance_type (CandidApiClient::Commons::Types::InsuranceTypeCode)
        #   * :patient_relationship_to_subscriber_code (CandidApiClient::Commons::Types::PatientRelationshipToInsuredCodeAll)
        #   * :date_of_birth (Date)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (CandidApiClient::Commons::Types::State)
        #     * :zip_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :gender (CandidApiClient::Individual::Types::Gender)
        # @param additional_information [String] Defines additional information on the claim needed by the payer.
        #  Box 19 on the CMS-1500 claim form.
        # @param service_authorization_exception_code [CandidApiClient::Encounters::V4::Types::ServiceAuthorizationExceptionCode] 837p Loop2300 REF*4N
        #  Required when mandated by government law or regulation to obtain authorization
        #  for specific service(s) but, for the
        #  reasons listed in one of the enum values of ServiceAuthorizationExceptionCode,
        #  the service was performed without
        #  obtaining the authorization.
        # @param admission_date [Date] 837p Loop2300 DTP*435, CMS-1500 Box 18
        #  Required on all ambulance claims when the patient was known to be admitted to
        #  the hospital.
        #  OR
        #  Required on all claims involving inpatient medical visits.
        # @param discharge_date [Date] 837p Loop2300 DTP*096, CMS-1500 Box 18
        #  Required for inpatient claims when the patient was discharged from the facility
        #  and the discharge date is known.
        # @param onset_of_current_illness_or_symptom_date [Date] 837p Loop2300 DTP*431, CMS-1500 Box 14
        #  Required for the initial medical service or visit performed in response to a
        #  medical emergency when the date is available and is different than the date of
        #  service.
        #  OR
        #  This date is the onset of acute symptoms for the current illness or condition.
        # @param last_menstrual_period_date [Date] 837p Loop2300 DTP*484, CMS-1500 Box 14
        #  Required when, in the judgment of the provider, the services on this claim are
        #  related to the patient's pregnancy.
        # @param delay_reason_code [CandidApiClient::Commons::Types::DelayReasonCode] 837i Loop2300, CLM-1300 Box 20
        #  Code indicating the reason why a request was delayed
        # @param patient_authorized_release [Boolean] Whether this patient has authorized the release of medical information
        #  for billing purpose.
        #  Box 12 on the CMS-1500 claim form.
        # @param schema_instances [Array<Hash>] Key-value pairs that must adhere to a schema created via the Custom Schema API.
        #  Multiple schema
        #  instances cannot be created for the same schema on an encounter. Updating schema
        #  instances utilizes PUT
        #  semantics, so the schema instances on the encounter will be set to whatever
        #  inputs are provided. If null
        #  is provided as an input, then the encounter's schema instances will be cleared.Request of type Array<CandidApiClient::CustomSchemas::V1::Types::SchemaInstance>, as a Hash
        #   * :schema_id (String)
        #   * :content (Hash{String => Object})
        # @param vitals [Hash] If a vitals entity already exists for the encounter, then all values will be
        #  updated to the provided values.
        #  Otherwise, a new vitals object will be created for the encounter.Request of type CandidApiClient::Encounters::V4::Types::VitalsUpdate, as a Hash
        #   * :height_in (Integer)
        #   * :weight_lbs (Integer)
        #   * :blood_pressure_systolic_mmhg (Integer)
        #   * :blood_pressure_diastolic_mmhg (Integer)
        #   * :body_temperature_f (Float)
        #   * :hemoglobin_gdl (Float)
        #   * :hematocrit_pct (Float)
        # @param request_options [CandidApiClient::RequestOptions]
        # @return [CandidApiClient::Encounters::V4::Types::Encounter]
        # @example
        #  api = CandidApiClient::Client.new(base_url: "https://api.example.com", environment: CandidApiClient::Environment::PRODUCTION)
        #  api.encounters.v_4.update(
        #    encounter_id: "d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32",
        #    prior_authorization_number: "string",
        #    external_id: "string",
        #    date_of_service: DateTime.parse(2023-01-15),
        #    diagnosis_ids: ["d5e9c84f-c2b2-4bf4-b4b0-7ffd7a9ffc32"],
        #    tag_ids: ["string"],
        #    clinical_notes: [{ category: CLINICAL, notes: [{ text: "string", author_name: "string", author_npi: "string", timestamp: DateTime.parse(2024-01-15T09:30:00.000Z) }] }],
        #    pay_to_address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" },
        #    billable_status: BILLABLE,
        #    responsible_party: INSURANCE_PAY,
        #    provider_accepts_assignment: true,
        #    benefits_assigned_to_provider: true,
        #    synchronicity: SYNCHRONOUS,
        #    place_of_service_code: PHARMACY,
        #    place_of_service_code_as_submitted: PHARMACY,
        #    appointment_type: "string",
        #    end_date_of_service: DateTime.parse(2023-01-15),
        #    subscriber_primary: { insurance_card: { member_id: "string", payer_name: "string", payer_id: "string", rx_bin: "string", rx_pcn: "string", image_url_front: "string", image_url_back: "string", emr_payer_crosswalk: HEALTHIE, group_number: "string", plan_name: "string", plan_type: SELF_PAY, insurance_type: C_01 }, patient_relationship_to_subscriber_code: SPOUSE, date_of_birth: DateTime.parse(2023-01-15), address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" }, first_name: "string", last_name: "string", gender: MALE },
        #    subscriber_secondary: { insurance_card: { member_id: "string", payer_name: "string", payer_id: "string", rx_bin: "string", rx_pcn: "string", image_url_front: "string", image_url_back: "string", emr_payer_crosswalk: HEALTHIE, group_number: "string", plan_name: "string", plan_type: SELF_PAY, insurance_type: C_01 }, patient_relationship_to_subscriber_code: SPOUSE, date_of_birth: DateTime.parse(2023-01-15), address: { address_1: "123 Main St", address_2: "Apt 1", city: "New York", state: NY, zip_code: "10001", zip_plus_four_code: "1234" }, first_name: "string", last_name: "string", gender: MALE },
        #    additional_information: "string",
        #    service_authorization_exception_code: C_1,
        #    admission_date: DateTime.parse(2023-01-15),
        #    discharge_date: DateTime.parse(2023-01-15),
        #    onset_of_current_illness_or_symptom_date: DateTime.parse(2023-01-15),
        #    last_menstrual_period_date: DateTime.parse(2023-01-15),
        #    delay_reason_code: C_1,
        #    patient_authorized_release: true,
        #    schema_instances: [{ schema_id: "ec096b13-f80a-471d-aaeb-54b021c9d582", content: { "provider_category": "internist", "is_urgent_care": true, "bmi": 24.2, "age": 38 } }],
        #    vitals: { height_in: 70, weight_lbs: 165, blood_pressure_systolic_mmhg: 115, blood_pressure_diastolic_mmhg: 85, body_temperature_f: 98, hemoglobin_gdl: 15.1, hematocrit_pct: 51.2 }
        #  )
        def update(encounter_id:, prior_authorization_number: nil, external_id: nil, date_of_service: nil,
                   diagnosis_ids: nil, tag_ids: nil, clinical_notes: nil, pay_to_address: nil, billable_status: nil, responsible_party: nil, provider_accepts_assignment: nil, benefits_assigned_to_provider: nil, synchronicity: nil, place_of_service_code: nil, place_of_service_code_as_submitted: nil, appointment_type: nil, end_date_of_service: nil, subscriber_primary: nil, subscriber_secondary: nil, additional_information: nil, service_authorization_exception_code: nil, admission_date: nil, discharge_date: nil, onset_of_current_illness_or_symptom_date: nil, last_menstrual_period_date: nil, delay_reason_code: nil, patient_authorized_release: nil, schema_instances: nil, vitals: nil, request_options: nil)
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
                prior_authorization_number: prior_authorization_number,
                external_id: external_id,
                date_of_service: date_of_service,
                diagnosis_ids: diagnosis_ids,
                tag_ids: tag_ids,
                clinical_notes: clinical_notes,
                pay_to_address: pay_to_address,
                billable_status: billable_status,
                responsible_party: responsible_party,
                provider_accepts_assignment: provider_accepts_assignment,
                benefits_assigned_to_provider: benefits_assigned_to_provider,
                synchronicity: synchronicity,
                place_of_service_code: place_of_service_code,
                place_of_service_code_as_submitted: place_of_service_code_as_submitted,
                appointment_type: appointment_type,
                end_date_of_service: end_date_of_service,
                subscriber_primary: subscriber_primary,
                subscriber_secondary: subscriber_secondary,
                additional_information: additional_information,
                service_authorization_exception_code: service_authorization_exception_code,
                admission_date: admission_date,
                discharge_date: discharge_date,
                onset_of_current_illness_or_symptom_date: onset_of_current_illness_or_symptom_date,
                last_menstrual_period_date: last_menstrual_period_date,
                delay_reason_code: delay_reason_code,
                patient_authorized_release: patient_authorized_release,
                schema_instances: schema_instances,
                vitals: vitals
              }.compact
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
