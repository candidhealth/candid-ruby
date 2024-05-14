# frozen_string_literal: true

require_relative "../../../requests"
require_relative "../../claims/types/claim_status"
require_relative "types/encounter_sort_options"
require_relative "../../commons/types/page_token"
require_relative "../../commons/types/date"
require_relative "../../commons/types/encounter_external_id"
require "date"
require_relative "../../tags/types/tag_id"
require_relative "../../commons/types/work_queue_id"
require_relative "types/billable_status_type"
require_relative "types/responsible_party_type"
require_relative "types/encounter_owner_of_next_action_type"
require_relative "types/encounter_page"
require_relative "../../commons/types/encounter_id"
require_relative "types/encounter"
require_relative "types/prior_authorization_number"
require_relative "types/medication"
require_relative "types/vitals"
require_relative "types/intervention"
require_relative "../../commons/types/street_address_long_zip"
require_relative "types/synchronicity_type"
require_relative "types/service_authorization_exception_code"
require_relative "../../commons/types/delay_reason_code"
require_relative "../../individual/types/patient_create"
require_relative "../../encounter_providers/v_2/types/billing_provider"
require_relative "../../encounter_providers/v_2/types/rendering_provider"
require_relative "../../encounter_providers/v_2/types/referring_provider"
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
require_relative "../../diagnoses/types/diagnosis_id"
require "async"

module CandidApiClient
  module Encounters
    module V4
      class V4Client
        attr_reader :request_client

        # @param request_client [RequestClient]
        # @return [Encounters::V4::V4Client]
        def initialize(request_client:)
          # @type [RequestClient]
          @request_client = request_client
        end

        # @param limit [Integer] Maximum number of entities per page, defaults to 100.
        # @param claim_status [Claims::ClaimStatus] Indicates the current status of an insurance claim within the billing process.
        # @param sort [Encounters::V4::EncounterSortOptions] Defaults to created_at:desc.
        # @param page_token [Commons::PAGE_TOKEN]
        # @param date_of_service_min [Commons::DATE] Date formatted as YYYY-MM-DD; eg: 2019-08-25.
        # @param date_of_service_max [Commons::DATE] Date formatted as YYYY-MM-DD; eg: 2019-08-25.
        # @param primary_payer_names [String] Comma delimited string.
        # @param search_term [String] Filter by any of the following fields: encounter_id, claim_id, patient external_id,
        #   patient date of birth, patient first name, patient last name,
        #   or encounter external id.
        # @param external_id [Commons::ENCOUNTER_EXTERNAL_ID] Filter to an exact match on encounter external_id, if one exists.
        # @param diagnoses_updated_since [DateTime] ISO 8601 timestamp; ideally in UTC (although not required): 2019-08-24T14:15:22Z.
        # @param tag_ids [Tags::TAG_ID] Filter by name of tags on encounters.
        # @param work_queue_id [Commons::WORK_QUEUE_ID]
        # @param billable_status [Encounters::V4::BillableStatusType] Defines if the Encounter is to be billed by Candid to the responsible_party. Examples for when this should be set to NOT_BILLABLE include if the Encounter has not occurred yet or if there is no intention of ever billing the responsible_party.
        # @param responsible_party [Encounters::V4::ResponsiblePartyType] Defines the party to be billed with the initial balance owed on the claim. Use SELF_PAY if you intend to bill self pay/cash pay.
        # @param owner_of_next_action [Encounters::V4::EncounterOwnerOfNextActionType] The party who is responsible for taking the next action on an Encounter, as defined by ownership of open Tasks.
        # @param patient_external_id [String] The patient ID from the external EMR platform for the patient
        # @param request_options [RequestOptions]
        # @return [Encounters::V4::EncounterPage]
        def get_all(limit: nil, claim_status: nil, sort: nil, page_token: nil, date_of_service_min: nil,
                    date_of_service_max: nil, primary_payer_names: nil, search_term: nil, external_id: nil, diagnoses_updated_since: nil, tag_ids: nil, work_queue_id: nil, billable_status: nil, responsible_party: nil, owner_of_next_action: nil, patient_external_id: nil, request_options: nil)
          response = @request_client.conn.get("/api/encounters/v4") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
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
          end
          Encounters::V4::EncounterPage.from_json(json_object: response.body)
        end

        # @param encounter_id [Commons::ENCOUNTER_ID]
        # @param request_options [RequestOptions]
        # @return [Encounters::V4::Encounter]
        def get(encounter_id:, request_options: nil)
          response = @request_client.conn.get("/api/encounters/v4/#{encounter_id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          end
          Encounters::V4::Encounter.from_json(json_object: response.body)
        end

        # @param external_id [Commons::ENCOUNTER_EXTERNAL_ID] A client-specified unique ID to associate with this encounter;
        #   for example, your internal encounter ID or a Dr. Chrono encounter ID.
        #   This field should not contain PHI.
        # @param prior_authorization_number [Encounters::V4::PRIOR_AUTHORIZATION_NUMBER] Box 23 on the CMS-1500 claim form.
        # @param patient_authorized_release [Boolean] Whether this patient has authorized the release of medical information
        #   for billing purpose.
        #   Box 12 on the CMS-1500 claim form.
        # @param benefits_assigned_to_provider [Boolean] Whether this patient has authorized insurance payments to be made to you,
        #   not them. If false, patient may receive reimbursement.
        #   Box 13 on the CMS-1500 claim form.
        # @param provider_accepts_assignment [Boolean] Whether you have accepted the patient's authorization for insurance payments
        #   to be made to you, not them.
        #   Box 27 on the CMS-1500 claim form.
        # @param appointment_type [String] Human-readable description of the appointment type (ex: "Acupuncture - Headaches").
        # @param existing_medications [Array<Hash>] Request of type Array<Encounters::V4::Medication>, as a Hash
        #   * :name (String)
        #   * :rx_cui (Encounters::V4::RX_CUI)
        #   * :dosage (String)
        #   * :dosage_form (String)
        #   * :frequency (String)
        #   * :as_needed (Boolean)
        # @param vitals [Hash] Request of type Encounters::V4::Vitals, as a Hash
        #   * :height_in (Integer)
        #   * :weight_lbs (Integer)
        #   * :blood_pressure_systolic_mmhg (Integer)
        #   * :blood_pressure_diastolic_mmhg (Integer)
        #   * :body_temperature_f (Float)
        # @param interventions [Array<Hash>] Request of type Array<Encounters::V4::Intervention>, as a Hash
        #   * :name (String)
        #   * :category (Encounters::V4::InterventionCategory)
        #   * :description (String)
        #   * :medication (Hash)
        #     * :name (String)
        #     * :rx_cui (Encounters::V4::RX_CUI)
        #     * :dosage (String)
        #     * :dosage_form (String)
        #     * :frequency (String)
        #     * :as_needed (Boolean)
        #   * :labs (Array<Encounters::V4::Lab>)
        # @param pay_to_address [Hash] Specifies the address to which payments for the claim should be sent.Request of type Commons::StreetAddressLongZip, as a Hash
        #   * :zip_plus_four_code (String)
        #   * :address_1 (String)
        #   * :address_2 (String)
        #   * :city (String)
        #   * :state (Commons::State)
        #   * :zip_code (String)
        # @param synchronicity [Encounters::V4::SynchronicityType] Whether or not this was a synchronous or asynchronous encounter.
        #   Asynchronous encounters occur when providers and patients communicate online using
        #   forms, instant messaging, or other pre-recorded digital mediums.
        #   Synchronous encounters occur in live, real-time settings where the patient interacts
        #   directly with the provider, such as over video or a phone call.
        # @param billable_status [Encounters::V4::BillableStatusType] Defines if the Encounter is to be billed by Candid to the responsible_party.
        #   Examples for when this should be set to NOT_BILLABLE include
        #   if the Encounter has not occurred yet or if there is no intention of ever billing the responsible_party.
        # @param responsible_party [Encounters::V4::ResponsiblePartyType] Defines the party to be billed with the initial balance owed on the claim.
        # @param additional_information [String] Defines additional information on the claim needed by the payer.
        #   Box 19 on the CMS-1500 claim form.
        # @param service_authorization_exception_code [Encounters::V4::ServiceAuthorizationExceptionCode] 837p Loop2300 REF\*4N
        #   Required when mandated by government law or regulation to obtain authorization for specific service(s) but, for the
        #   reasons listed in one of the enum values of ServiceAuthorizationExceptionCode, the service was performed without
        #   obtaining the authorization.
        # @param admission_date [Commons::DATE] 837p Loop2300 DTP\*435, CMS-1500 Box 18
        #   Required on all ambulance claims when the patient was known to be admitted to the hospital.
        #   OR
        #   Required on all claims involving inpatient medical visits.
        # @param discharge_date [Commons::DATE] 837p Loop2300 DTP\*096, CMS-1500 Box 18
        #   Required for inpatient claims when the patient was discharged from the facility and the discharge date is known.
        # @param onset_of_current_illness_or_symptom_date [Commons::DATE] 837p Loop2300 DTP\*431, CMS-1500 Box 14
        #   Required for the initial medical service or visit performed in response to a medical emergency when the date is available and is different than the date of service.
        #   OR
        #   This date is the onset of acute symptoms for the current illness or condition.
        # @param last_menstrual_period_date [Commons::DATE] 837p Loop2300 DTP\*484, CMS-1500 Box 14
        #   Required when, in the judgment of the provider, the services on this claim are related to the patient's pregnancy.
        # @param delay_reason_code [Commons::DelayReasonCode] 837i Loop2300, CLM-1300 Box 20
        #   Code indicating the reason why a request was delayed
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @param date_of_service [Commons::DATE] Date formatted as YYYY-MM-DD; eg: 2019-08-24.
        #   This date must be the local date in the timezone where the service occurred.
        #   Box 24a on the CMS-1500 claim form.
        #   If service occurred over a range of dates, this should be the start date.
        #   date_of_service must be defined on either the encounter or the service lines but not both.
        #   If there are greater than zero service lines, it is recommended to specify date_of_service on the service_line instead of on the encounter to prepare for future API versions.
        # @param end_date_of_service [Commons::DATE] Date formatted as YYYY-MM-DD; eg: 2019-08-25.
        #   This date must be the local date in the timezone where the service occurred.
        #   If omitted, the Encounter is assumed to be for a single day.
        #   Must not be temporally before the date_of_service field.
        #   If there are greater than zero service lines, it is recommended to specify end_date_of_service on the service_line instead of on the encounter to prepare for future API versions.
        # @param patient [Hash] Contains the identification information of the individual receiving medical services.Request of type Individual::PatientCreate, as a Hash
        #   * :phone_numbers (Array<Commons::PhoneNumber>)
        #   * :phone_consent (Boolean)
        #   * :email (Commons::EMAIL)
        #   * :email_consent (Boolean)
        #   * :external_id (String)
        #   * :date_of_birth (Commons::DATE)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (Commons::State)
        #     * :zip_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :gender (Individual::Gender)
        # @param billing_provider [Hash] The billing provider is the provider or business entity submitting the claim. Billing provider may be, but is not necessarily, the same person/NPI as the rendering provider. From a payer's perspective, this represents the person or entity being reimbursed. When a contract exists with the target payer, the billing provider should be the entity contracted with the payer. In some circumstances, this will be an individual provider. In that case, submit that provider's NPI and the tax ID (TIN) that the provider gave to the payer during contracting. In other cases, the billing entity will be a medical group. If so, submit the group NPI and the group's tax ID. Box 33 on the CMS-1500 claim form.Request of type EncounterProviders::V2::BillingProvider, as a Hash
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (Commons::State)
        #     * :zip_code (String)
        #   * :tax_id (String)
        #   * :npi (String)
        #   * :taxonomy_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :organization_name (String)
        # @param rendering_provider [Hash] The rendering provider is the practitioner -- physician, nurse practitioner, etc. -- performing the service.
        #   For telehealth services, the rendering provider performs the visit, asynchronous communication, or other service. The rendering provider address should generally be the same as the service facility address.Request of type EncounterProviders::V2::RenderingProvider, as a Hash
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (Commons::State)
        #     * :zip_code (String)
        #   * :npi (String)
        #   * :taxonomy_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :organization_name (String)
        # @param referring_provider [Hash] The provider who referred the services that were rendered.
        #   All physicians who order services or refer Medicare beneficiaries must
        #   report this data.
        #   If a claim involves multiple referring physicians, create a separate
        #   encounter for each physician.Request of type EncounterProviders::V2::ReferringProvider, as a Hash
        #   * :npi (String)
        #   * :taxonomy_code (String)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (Commons::State)
        #     * :zip_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :organization_name (String)
        # @param service_facility [Hash] Encounter Service facility is typically the location a medical service was rendered, such as a provider office or hospital. For telehealth, service facility can represent the provider's location when the service was delivered (e.g., home), or the location where an in-person visit would have taken place, whichever is easier to identify. If the provider is in-network, service facility may be defined in payer contracts. Box 32 on the CMS-1500 claim form. Note that for an in-network claim to be successfully adjudicated, the service facility address listed on claims must match what was provided to the payer during the credentialing process.Request of type ServiceFacility::EncounterServiceFacilityBase, as a Hash
        #   * :organization_name (String)
        #   * :npi (String)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (Commons::State)
        #     * :zip_code (String)
        # @param subscriber_primary [Hash] Subscriber_primary is required when responsible_party is INSURANCE_PAY (i.e. when the claim should be billed to insurance).
        #   These are not required fields when responsible_party is SELF_PAY (i.e. when the claim should be billed to the patient).
        #   However, if you collect this for patients, even self-pay, we recommend including it when sending encounters to Candid.
        #   Note: Cash Pay is no longer a valid payer_id in v4, please use responsible party to define self-pay claims.Request of type Individual::SubscriberCreate, as a Hash
        #   * :insurance_card (Hash)
        #     * :member_id (String)
        #     * :payer_name (String)
        #     * :payer_id (String)
        #     * :rx_bin (String)
        #     * :rx_pcn (String)
        #     * :image_url_front (String)
        #     * :image_url_back (String)
        #     * :emr_payer_crosswalk (Commons::EmrPayerCrosswalk)
        #     * :group_number (String)
        #     * :plan_name (String)
        #     * :plan_type (Commons::SourceOfPaymentCode)
        #     * :insurance_type (Commons::InsuranceTypeCode)
        #   * :patient_relationship_to_subscriber_code (Commons::PatientRelationshipToInsuredCodeAll)
        #   * :date_of_birth (Commons::DATE)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (Commons::State)
        #     * :zip_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :gender (Individual::Gender)
        # @param subscriber_secondary [Hash] Please always include this when you have it, even for self-pay claims.Request of type Individual::SubscriberCreate, as a Hash
        #   * :insurance_card (Hash)
        #     * :member_id (String)
        #     * :payer_name (String)
        #     * :payer_id (String)
        #     * :rx_bin (String)
        #     * :rx_pcn (String)
        #     * :image_url_front (String)
        #     * :image_url_back (String)
        #     * :emr_payer_crosswalk (Commons::EmrPayerCrosswalk)
        #     * :group_number (String)
        #     * :plan_name (String)
        #     * :plan_type (Commons::SourceOfPaymentCode)
        #     * :insurance_type (Commons::InsuranceTypeCode)
        #   * :patient_relationship_to_subscriber_code (Commons::PatientRelationshipToInsuredCodeAll)
        #   * :date_of_birth (Commons::DATE)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (Commons::State)
        #     * :zip_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :gender (Individual::Gender)
        # @param diagnoses [Array<Hash>] Ideally, this field should contain no more than 12 diagnoses. However, more diagnoses
        #   may be submitted at this time, and coders will later prioritize the 12 that will be
        #   submitted to the payor.Request of type Array<Diagnoses::DiagnosisCreate>, as a Hash
        #   * :name (String)
        #   * :code_type (Diagnoses::DiagnosisTypeCode)
        #   * :code (String)
        # @param clinical_notes [Array<Hash>] Holds a collection of clinical observations made by healthcare providers during patient encounters.Request of type Array<Encounters::V4::ClinicalNoteCategoryCreate>, as a Hash
        #   * :category (Encounters::V4::NoteCategory)
        #   * :notes (Array<Encounters::V4::ClinicalNote>)
        # @param billing_notes [Array<Hash>] Spot to store misc, human-readable, notes about this encounter to be used
        #   in the billing process.Request of type Array<BillingNotes::V2::BillingNoteBase>, as a Hash
        #   * :text (String)
        # @param place_of_service_code [Commons::FacilityTypeCode] Box 24B on the CMS-1500 claim form. Line-level place of service is not currently supported. 02 for telemedicine, 11 for in-person. Full list [here](https://www.cms.gov/Medicare/Coding/place-of-service-codes/Place_of_Service_Code_Set).
        # @param patient_histories [Array<Hash>] Request of type Array<Encounters::V4::PatientHistoryCategory>, as a Hash
        #   * :category (Encounters::V4::PatientHistoryCategoryEnum)
        #   * :questions (Array<Encounters::V4::IntakeQuestion>)
        # @param service_lines [Array<Hash>] Each service line must be linked to a diagnosis. Concretely,
        #   `service_line.diagnosis_pointers`must contain at least one entry which should be
        #   in bounds of the diagnoses list field.Request of type Array<ServiceLines::V2::ServiceLineCreate>, as a Hash
        #   * :modifiers (Array<Commons::ProcedureModifier>)
        #   * :procedure_code (String)
        #   * :quantity (Commons::DECIMAL)
        #   * :units (Commons::ServiceLineUnits)
        #   * :charge_amount_cents (Integer)
        #   * :diagnosis_pointers (Array<Integer>)
        #   * :drug_identification (Hash)
        #     * :service_id_qualifier (ServiceLines::V2::ServiceIdQualifier)
        #     * :national_drug_code (String)
        #     * :national_drug_unit_count (String)
        #     * :measurement_unit_code (ServiceLines::V2::MeasurementUnitCode)
        #     * :link_sequence_number (String)
        #     * :pharmacy_prescription_number (String)
        #   * :place_of_service_code (Commons::FacilityTypeCode)
        #   * :description (String)
        #   * :date_of_service (Date)
        #   * :end_date_of_service (Date)
        # @param guarantor [Hash] Personal and contact info for the guarantor of the patient responsibility.Request of type Guarantor::V1::GuarantorCreate, as a Hash
        #   * :phone_numbers (Array<Commons::PhoneNumber>)
        #   * :phone_consent (Boolean)
        #   * :email (Commons::EMAIL)
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
        #     * :state (Commons::State)
        #     * :zip_code (String)
        # @param external_claim_submission [Hash] ***This field is in beta.***
        #   To be included for claims that have been submitted outside of Candid.
        #   Candid supports posting remits and payments to these claims and working them in-platform (e.g. editing, resubmitting).Request of type ClaimSubmission::V1::ExternalClaimSubmissionCreate, as a Hash
        #   * :claim_created_at (DateTime)
        #   * :patient_control_number (String)
        #   * :submission_records (Array<ClaimSubmission::V1::ClaimSubmissionRecordCreate>)
        # @param tag_ids [Array<Tags::TAG_ID>] Names of tags that should be on the encounter.
        # @param request_options [RequestOptions]
        # @return [Encounters::V4::Encounter]
        def create(external_id:, patient_authorized_release:, benefits_assigned_to_provider:,
                   provider_accepts_assignment:, billable_status:, responsible_party:, patient:, billing_provider:, rendering_provider:, diagnoses:, place_of_service_code:, prior_authorization_number: nil, appointment_type: nil, existing_medications: nil, vitals: nil, interventions: nil, pay_to_address: nil, synchronicity: nil, additional_information: nil, service_authorization_exception_code: nil, admission_date: nil, discharge_date: nil, onset_of_current_illness_or_symptom_date: nil, last_menstrual_period_date: nil, delay_reason_code: nil, additional_properties: nil, date_of_service: nil, end_date_of_service: nil, referring_provider: nil, service_facility: nil, subscriber_primary: nil, subscriber_secondary: nil, clinical_notes: nil, billing_notes: nil, patient_histories: nil, service_lines: nil, guarantor: nil, external_claim_submission: nil, tag_ids: nil, request_options: nil)
          response = @request_client.conn.post("/api/encounters/v4") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
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
              date_of_service: date_of_service,
              end_date_of_service: end_date_of_service,
              patient: patient,
              billing_provider: billing_provider,
              rendering_provider: rendering_provider,
              referring_provider: referring_provider,
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
              tag_ids: tag_ids
            }.compact
          end
          Encounters::V4::Encounter.from_json(json_object: response.body)
        end

        # @param encounter_id [Commons::ENCOUNTER_ID]
        # @param prior_authorization_number [Encounters::V4::PRIOR_AUTHORIZATION_NUMBER] Box 23 on the CMS-1500 claim form.
        # @param external_id [Commons::ENCOUNTER_EXTERNAL_ID] A client-specified unique ID to associate with this encounter;
        #   for example, your internal encounter ID or a Dr. Chrono encounter ID.
        #   This field should not contain PHI.
        # @param date_of_service [Commons::DATE] Date formatted as YYYY-MM-DD; eg: 2019-08-24.
        #   This date must be the local date in the timezone where the service occurred.
        #   Box 24a on the CMS-1500 claim form.
        #   If service occurred over a range of dates, this should be the start date.
        #   If service lines have distinct date_of_service values, updating the encounter's date_of_service will fail. If all service line date_of_service values are the same, updating the encounter's date_of_service will update all service line date_of_service values.
        # @param diagnosis_ids [Array<Diagnoses::DIAGNOSIS_ID>] Ideally, this field should contain no more than 12 diagnoses. However, more diagnoses
        #   may be submitted at this time, and coders will later prioritize the 12 that will be
        #   submitted to the payor.
        # @param tag_ids [Array<Tags::TAG_ID>] Names of tags that should be on the encounter.  Note all tags on encounter will be overriden with this list.
        # @param clinical_notes [Array<Hash>] Holds a collection of clinical observations made by healthcare providers during patient encounters.Request of type Array<Encounters::V4::ClinicalNoteCategoryCreate>, as a Hash
        #   * :category (Encounters::V4::NoteCategory)
        #   * :notes (Array<Encounters::V4::ClinicalNote>)
        # @param pay_to_address [Hash] Specifies the address to which payments for the claim should be sent.Request of type Commons::StreetAddressLongZip, as a Hash
        #   * :zip_plus_four_code (String)
        #   * :address_1 (String)
        #   * :address_2 (String)
        #   * :city (String)
        #   * :state (Commons::State)
        #   * :zip_code (String)
        # @param billable_status [Encounters::V4::BillableStatusType] Defines if the Encounter is to be billed by Candid to the responsible_party. Examples for when this should be set to NOT_BILLABLE include if the Encounter has not occurred yet or if there is no intention of ever billing the responsible_party.
        # @param responsible_party [Encounters::V4::ResponsiblePartyType] Defines the party to be billed with the initial balance owed on the claim. Use SELF_PAY if you intend to bill self pay/cash pay.
        # @param provider_accepts_assignment [Boolean] Whether you have accepted the patient's authorization for insurance payments to be made to you, not them. Box 27 on the CMS-1500 claim form.
        # @param benefits_assigned_to_provider [Boolean] Whether this patient has authorized insurance payments to be made to you, not them. If false, patient may receive reimbursement. Box 13 on the CMS-1500 claim form.
        # @param synchronicity [Encounters::V4::SynchronicityType] Whether or not this was a synchronous or asynchronous encounter. Asynchronous encounters occur when providers and patients communicate online using forms, instant messaging, or other pre-recorded digital mediums. Synchronous encounters occur in live, real-time settings where the patient interacts directly with the provider, such as over video or a phone call.
        # @param place_of_service_code [Commons::FacilityTypeCode] Box 24B on the CMS-1500 claim form. Line-level place of service is not currently supported. 02 for telemedicine, 11 for in-person. Full list [here](https://www.cms.gov/Medicare/Coding/place-of-service-codes/Place_of_Service_Code_Set).
        # @param appointment_type [String] Human-readable description of the appointment type (ex: "Acupuncture - Headaches").
        # @param end_date_of_service [Commons::DATE] Date formatted as YYYY-MM-DD; eg: 2019-08-25.
        #   This date must be the local date in the timezone where the service occurred.
        #   If omitted, the Encounter is assumed to be for a single day.
        #   Must not be temporally before the date_of_service field.
        #   If service lines have distinct end_date_of_service values, updating the encounter's end_date_of_service will fail. If all service line end_date_of_service values are the same, updating the encounter's end_date_of_service will update all service line date_of_service values.
        # @param subscriber_primary [Hash] Contains details of the primary insurance subscriber.Request of type Individual::SubscriberCreate, as a Hash
        #   * :insurance_card (Hash)
        #     * :member_id (String)
        #     * :payer_name (String)
        #     * :payer_id (String)
        #     * :rx_bin (String)
        #     * :rx_pcn (String)
        #     * :image_url_front (String)
        #     * :image_url_back (String)
        #     * :emr_payer_crosswalk (Commons::EmrPayerCrosswalk)
        #     * :group_number (String)
        #     * :plan_name (String)
        #     * :plan_type (Commons::SourceOfPaymentCode)
        #     * :insurance_type (Commons::InsuranceTypeCode)
        #   * :patient_relationship_to_subscriber_code (Commons::PatientRelationshipToInsuredCodeAll)
        #   * :date_of_birth (Commons::DATE)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (Commons::State)
        #     * :zip_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :gender (Individual::Gender)
        # @param subscriber_secondary [Hash] Contains details of the secondary insurance subscriber.Request of type Individual::SubscriberCreate, as a Hash
        #   * :insurance_card (Hash)
        #     * :member_id (String)
        #     * :payer_name (String)
        #     * :payer_id (String)
        #     * :rx_bin (String)
        #     * :rx_pcn (String)
        #     * :image_url_front (String)
        #     * :image_url_back (String)
        #     * :emr_payer_crosswalk (Commons::EmrPayerCrosswalk)
        #     * :group_number (String)
        #     * :plan_name (String)
        #     * :plan_type (Commons::SourceOfPaymentCode)
        #     * :insurance_type (Commons::InsuranceTypeCode)
        #   * :patient_relationship_to_subscriber_code (Commons::PatientRelationshipToInsuredCodeAll)
        #   * :date_of_birth (Commons::DATE)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (Commons::State)
        #     * :zip_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :gender (Individual::Gender)
        # @param additional_information [String] Defines additional information on the claim needed by the payer.
        #   Box 19 on the CMS-1500 claim form.
        # @param service_authorization_exception_code [Encounters::V4::ServiceAuthorizationExceptionCode] 837p Loop2300 REF*4N
        #   Required when mandated by government law or regulation to obtain authorization for specific service(s) but, for the
        #   reasons listed in one of the enum values of ServiceAuthorizationExceptionCode, the service was performed without
        #   obtaining the authorization.
        # @param admission_date [Commons::DATE] 837p Loop2300 DTP*435, CMS-1500 Box 18
        #   Required on all ambulance claims when the patient was known to be admitted to the hospital.
        #   OR
        #   Required on all claims involving inpatient medical visits.
        # @param discharge_date [Commons::DATE] 837p Loop2300 DTP*096, CMS-1500 Box 18
        #   Required for inpatient claims when the patient was discharged from the facility and the discharge date is known.
        # @param onset_of_current_illness_or_symptom_date [Commons::DATE] 837p Loop2300 DTP*431, CMS-1500 Box 14
        #   Required for the initial medical service or visit performed in response to a medical emergency when the date is available and is different than the date of service.
        #   OR
        #   This date is the onset of acute symptoms for the current illness or condition.
        # @param last_menstrual_period_date [Commons::DATE] 837p Loop2300 DTP*484, CMS-1500 Box 14
        #   Required when, in the judgment of the provider, the services on this claim are related to the patient's pregnancy.
        # @param delay_reason_code [Commons::DelayReasonCode] 837i Loop2300, CLM-1300 Box 20
        #   Code indicating the reason why a request was delayed
        # @param patient_authorized_release [Boolean] Whether this patient has authorized the release of medical information
        #   for billing purpose.
        #   Box 12 on the CMS-1500 claim form.
        # @param request_options [RequestOptions]
        # @return [Encounters::V4::Encounter]
        def update(encounter_id:, prior_authorization_number: nil, external_id: nil, date_of_service: nil,
                   diagnosis_ids: nil, tag_ids: nil, clinical_notes: nil, pay_to_address: nil, billable_status: nil, responsible_party: nil, provider_accepts_assignment: nil, benefits_assigned_to_provider: nil, synchronicity: nil, place_of_service_code: nil, appointment_type: nil, end_date_of_service: nil, subscriber_primary: nil, subscriber_secondary: nil, additional_information: nil, service_authorization_exception_code: nil, admission_date: nil, discharge_date: nil, onset_of_current_illness_or_symptom_date: nil, last_menstrual_period_date: nil, delay_reason_code: nil, patient_authorized_release: nil, request_options: nil)
          response = @request_client.conn.patch("/api/encounters/v4/#{encounter_id}") do |req|
            req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
            req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
            req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
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
              patient_authorized_release: patient_authorized_release
            }.compact
          end
          Encounters::V4::Encounter.from_json(json_object: response.body)
        end
      end

      class AsyncV4Client
        attr_reader :request_client

        # @param request_client [AsyncRequestClient]
        # @return [Encounters::V4::AsyncV4Client]
        def initialize(request_client:)
          # @type [AsyncRequestClient]
          @request_client = request_client
        end

        # @param limit [Integer] Maximum number of entities per page, defaults to 100.
        # @param claim_status [Claims::ClaimStatus] Indicates the current status of an insurance claim within the billing process.
        # @param sort [Encounters::V4::EncounterSortOptions] Defaults to created_at:desc.
        # @param page_token [Commons::PAGE_TOKEN]
        # @param date_of_service_min [Commons::DATE] Date formatted as YYYY-MM-DD; eg: 2019-08-25.
        # @param date_of_service_max [Commons::DATE] Date formatted as YYYY-MM-DD; eg: 2019-08-25.
        # @param primary_payer_names [String] Comma delimited string.
        # @param search_term [String] Filter by any of the following fields: encounter_id, claim_id, patient external_id,
        #   patient date of birth, patient first name, patient last name,
        #   or encounter external id.
        # @param external_id [Commons::ENCOUNTER_EXTERNAL_ID] Filter to an exact match on encounter external_id, if one exists.
        # @param diagnoses_updated_since [DateTime] ISO 8601 timestamp; ideally in UTC (although not required): 2019-08-24T14:15:22Z.
        # @param tag_ids [Tags::TAG_ID] Filter by name of tags on encounters.
        # @param work_queue_id [Commons::WORK_QUEUE_ID]
        # @param billable_status [Encounters::V4::BillableStatusType] Defines if the Encounter is to be billed by Candid to the responsible_party. Examples for when this should be set to NOT_BILLABLE include if the Encounter has not occurred yet or if there is no intention of ever billing the responsible_party.
        # @param responsible_party [Encounters::V4::ResponsiblePartyType] Defines the party to be billed with the initial balance owed on the claim. Use SELF_PAY if you intend to bill self pay/cash pay.
        # @param owner_of_next_action [Encounters::V4::EncounterOwnerOfNextActionType] The party who is responsible for taking the next action on an Encounter, as defined by ownership of open Tasks.
        # @param patient_external_id [String] The patient ID from the external EMR platform for the patient
        # @param request_options [RequestOptions]
        # @return [Encounters::V4::EncounterPage]
        def get_all(limit: nil, claim_status: nil, sort: nil, page_token: nil, date_of_service_min: nil,
                    date_of_service_max: nil, primary_payer_names: nil, search_term: nil, external_id: nil, diagnoses_updated_since: nil, tag_ids: nil, work_queue_id: nil, billable_status: nil, responsible_party: nil, owner_of_next_action: nil, patient_external_id: nil, request_options: nil)
          Async do
            response = @request_client.conn.get("/api/encounters/v4") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
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
            end
            Encounters::V4::EncounterPage.from_json(json_object: response.body)
          end
        end

        # @param encounter_id [Commons::ENCOUNTER_ID]
        # @param request_options [RequestOptions]
        # @return [Encounters::V4::Encounter]
        def get(encounter_id:, request_options: nil)
          Async do
            response = @request_client.conn.get("/api/encounters/v4/#{encounter_id}") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
            end
            Encounters::V4::Encounter.from_json(json_object: response.body)
          end
        end

        # @param external_id [Commons::ENCOUNTER_EXTERNAL_ID] A client-specified unique ID to associate with this encounter;
        #   for example, your internal encounter ID or a Dr. Chrono encounter ID.
        #   This field should not contain PHI.
        # @param prior_authorization_number [Encounters::V4::PRIOR_AUTHORIZATION_NUMBER] Box 23 on the CMS-1500 claim form.
        # @param patient_authorized_release [Boolean] Whether this patient has authorized the release of medical information
        #   for billing purpose.
        #   Box 12 on the CMS-1500 claim form.
        # @param benefits_assigned_to_provider [Boolean] Whether this patient has authorized insurance payments to be made to you,
        #   not them. If false, patient may receive reimbursement.
        #   Box 13 on the CMS-1500 claim form.
        # @param provider_accepts_assignment [Boolean] Whether you have accepted the patient's authorization for insurance payments
        #   to be made to you, not them.
        #   Box 27 on the CMS-1500 claim form.
        # @param appointment_type [String] Human-readable description of the appointment type (ex: "Acupuncture - Headaches").
        # @param existing_medications [Array<Hash>] Request of type Array<Encounters::V4::Medication>, as a Hash
        #   * :name (String)
        #   * :rx_cui (Encounters::V4::RX_CUI)
        #   * :dosage (String)
        #   * :dosage_form (String)
        #   * :frequency (String)
        #   * :as_needed (Boolean)
        # @param vitals [Hash] Request of type Encounters::V4::Vitals, as a Hash
        #   * :height_in (Integer)
        #   * :weight_lbs (Integer)
        #   * :blood_pressure_systolic_mmhg (Integer)
        #   * :blood_pressure_diastolic_mmhg (Integer)
        #   * :body_temperature_f (Float)
        # @param interventions [Array<Hash>] Request of type Array<Encounters::V4::Intervention>, as a Hash
        #   * :name (String)
        #   * :category (Encounters::V4::InterventionCategory)
        #   * :description (String)
        #   * :medication (Hash)
        #     * :name (String)
        #     * :rx_cui (Encounters::V4::RX_CUI)
        #     * :dosage (String)
        #     * :dosage_form (String)
        #     * :frequency (String)
        #     * :as_needed (Boolean)
        #   * :labs (Array<Encounters::V4::Lab>)
        # @param pay_to_address [Hash] Specifies the address to which payments for the claim should be sent.Request of type Commons::StreetAddressLongZip, as a Hash
        #   * :zip_plus_four_code (String)
        #   * :address_1 (String)
        #   * :address_2 (String)
        #   * :city (String)
        #   * :state (Commons::State)
        #   * :zip_code (String)
        # @param synchronicity [Encounters::V4::SynchronicityType] Whether or not this was a synchronous or asynchronous encounter.
        #   Asynchronous encounters occur when providers and patients communicate online using
        #   forms, instant messaging, or other pre-recorded digital mediums.
        #   Synchronous encounters occur in live, real-time settings where the patient interacts
        #   directly with the provider, such as over video or a phone call.
        # @param billable_status [Encounters::V4::BillableStatusType] Defines if the Encounter is to be billed by Candid to the responsible_party.
        #   Examples for when this should be set to NOT_BILLABLE include
        #   if the Encounter has not occurred yet or if there is no intention of ever billing the responsible_party.
        # @param responsible_party [Encounters::V4::ResponsiblePartyType] Defines the party to be billed with the initial balance owed on the claim.
        # @param additional_information [String] Defines additional information on the claim needed by the payer.
        #   Box 19 on the CMS-1500 claim form.
        # @param service_authorization_exception_code [Encounters::V4::ServiceAuthorizationExceptionCode] 837p Loop2300 REF\*4N
        #   Required when mandated by government law or regulation to obtain authorization for specific service(s) but, for the
        #   reasons listed in one of the enum values of ServiceAuthorizationExceptionCode, the service was performed without
        #   obtaining the authorization.
        # @param admission_date [Commons::DATE] 837p Loop2300 DTP\*435, CMS-1500 Box 18
        #   Required on all ambulance claims when the patient was known to be admitted to the hospital.
        #   OR
        #   Required on all claims involving inpatient medical visits.
        # @param discharge_date [Commons::DATE] 837p Loop2300 DTP\*096, CMS-1500 Box 18
        #   Required for inpatient claims when the patient was discharged from the facility and the discharge date is known.
        # @param onset_of_current_illness_or_symptom_date [Commons::DATE] 837p Loop2300 DTP\*431, CMS-1500 Box 14
        #   Required for the initial medical service or visit performed in response to a medical emergency when the date is available and is different than the date of service.
        #   OR
        #   This date is the onset of acute symptoms for the current illness or condition.
        # @param last_menstrual_period_date [Commons::DATE] 837p Loop2300 DTP\*484, CMS-1500 Box 14
        #   Required when, in the judgment of the provider, the services on this claim are related to the patient's pregnancy.
        # @param delay_reason_code [Commons::DelayReasonCode] 837i Loop2300, CLM-1300 Box 20
        #   Code indicating the reason why a request was delayed
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @param date_of_service [Commons::DATE] Date formatted as YYYY-MM-DD; eg: 2019-08-24.
        #   This date must be the local date in the timezone where the service occurred.
        #   Box 24a on the CMS-1500 claim form.
        #   If service occurred over a range of dates, this should be the start date.
        #   date_of_service must be defined on either the encounter or the service lines but not both.
        #   If there are greater than zero service lines, it is recommended to specify date_of_service on the service_line instead of on the encounter to prepare for future API versions.
        # @param end_date_of_service [Commons::DATE] Date formatted as YYYY-MM-DD; eg: 2019-08-25.
        #   This date must be the local date in the timezone where the service occurred.
        #   If omitted, the Encounter is assumed to be for a single day.
        #   Must not be temporally before the date_of_service field.
        #   If there are greater than zero service lines, it is recommended to specify end_date_of_service on the service_line instead of on the encounter to prepare for future API versions.
        # @param patient [Hash] Contains the identification information of the individual receiving medical services.Request of type Individual::PatientCreate, as a Hash
        #   * :phone_numbers (Array<Commons::PhoneNumber>)
        #   * :phone_consent (Boolean)
        #   * :email (Commons::EMAIL)
        #   * :email_consent (Boolean)
        #   * :external_id (String)
        #   * :date_of_birth (Commons::DATE)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (Commons::State)
        #     * :zip_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :gender (Individual::Gender)
        # @param billing_provider [Hash] The billing provider is the provider or business entity submitting the claim. Billing provider may be, but is not necessarily, the same person/NPI as the rendering provider. From a payer's perspective, this represents the person or entity being reimbursed. When a contract exists with the target payer, the billing provider should be the entity contracted with the payer. In some circumstances, this will be an individual provider. In that case, submit that provider's NPI and the tax ID (TIN) that the provider gave to the payer during contracting. In other cases, the billing entity will be a medical group. If so, submit the group NPI and the group's tax ID. Box 33 on the CMS-1500 claim form.Request of type EncounterProviders::V2::BillingProvider, as a Hash
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (Commons::State)
        #     * :zip_code (String)
        #   * :tax_id (String)
        #   * :npi (String)
        #   * :taxonomy_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :organization_name (String)
        # @param rendering_provider [Hash] The rendering provider is the practitioner -- physician, nurse practitioner, etc. -- performing the service.
        #   For telehealth services, the rendering provider performs the visit, asynchronous communication, or other service. The rendering provider address should generally be the same as the service facility address.Request of type EncounterProviders::V2::RenderingProvider, as a Hash
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (Commons::State)
        #     * :zip_code (String)
        #   * :npi (String)
        #   * :taxonomy_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :organization_name (String)
        # @param referring_provider [Hash] The provider who referred the services that were rendered.
        #   All physicians who order services or refer Medicare beneficiaries must
        #   report this data.
        #   If a claim involves multiple referring physicians, create a separate
        #   encounter for each physician.Request of type EncounterProviders::V2::ReferringProvider, as a Hash
        #   * :npi (String)
        #   * :taxonomy_code (String)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (Commons::State)
        #     * :zip_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :organization_name (String)
        # @param service_facility [Hash] Encounter Service facility is typically the location a medical service was rendered, such as a provider office or hospital. For telehealth, service facility can represent the provider's location when the service was delivered (e.g., home), or the location where an in-person visit would have taken place, whichever is easier to identify. If the provider is in-network, service facility may be defined in payer contracts. Box 32 on the CMS-1500 claim form. Note that for an in-network claim to be successfully adjudicated, the service facility address listed on claims must match what was provided to the payer during the credentialing process.Request of type ServiceFacility::EncounterServiceFacilityBase, as a Hash
        #   * :organization_name (String)
        #   * :npi (String)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (Commons::State)
        #     * :zip_code (String)
        # @param subscriber_primary [Hash] Subscriber_primary is required when responsible_party is INSURANCE_PAY (i.e. when the claim should be billed to insurance).
        #   These are not required fields when responsible_party is SELF_PAY (i.e. when the claim should be billed to the patient).
        #   However, if you collect this for patients, even self-pay, we recommend including it when sending encounters to Candid.
        #   Note: Cash Pay is no longer a valid payer_id in v4, please use responsible party to define self-pay claims.Request of type Individual::SubscriberCreate, as a Hash
        #   * :insurance_card (Hash)
        #     * :member_id (String)
        #     * :payer_name (String)
        #     * :payer_id (String)
        #     * :rx_bin (String)
        #     * :rx_pcn (String)
        #     * :image_url_front (String)
        #     * :image_url_back (String)
        #     * :emr_payer_crosswalk (Commons::EmrPayerCrosswalk)
        #     * :group_number (String)
        #     * :plan_name (String)
        #     * :plan_type (Commons::SourceOfPaymentCode)
        #     * :insurance_type (Commons::InsuranceTypeCode)
        #   * :patient_relationship_to_subscriber_code (Commons::PatientRelationshipToInsuredCodeAll)
        #   * :date_of_birth (Commons::DATE)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (Commons::State)
        #     * :zip_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :gender (Individual::Gender)
        # @param subscriber_secondary [Hash] Please always include this when you have it, even for self-pay claims.Request of type Individual::SubscriberCreate, as a Hash
        #   * :insurance_card (Hash)
        #     * :member_id (String)
        #     * :payer_name (String)
        #     * :payer_id (String)
        #     * :rx_bin (String)
        #     * :rx_pcn (String)
        #     * :image_url_front (String)
        #     * :image_url_back (String)
        #     * :emr_payer_crosswalk (Commons::EmrPayerCrosswalk)
        #     * :group_number (String)
        #     * :plan_name (String)
        #     * :plan_type (Commons::SourceOfPaymentCode)
        #     * :insurance_type (Commons::InsuranceTypeCode)
        #   * :patient_relationship_to_subscriber_code (Commons::PatientRelationshipToInsuredCodeAll)
        #   * :date_of_birth (Commons::DATE)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (Commons::State)
        #     * :zip_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :gender (Individual::Gender)
        # @param diagnoses [Array<Hash>] Ideally, this field should contain no more than 12 diagnoses. However, more diagnoses
        #   may be submitted at this time, and coders will later prioritize the 12 that will be
        #   submitted to the payor.Request of type Array<Diagnoses::DiagnosisCreate>, as a Hash
        #   * :name (String)
        #   * :code_type (Diagnoses::DiagnosisTypeCode)
        #   * :code (String)
        # @param clinical_notes [Array<Hash>] Holds a collection of clinical observations made by healthcare providers during patient encounters.Request of type Array<Encounters::V4::ClinicalNoteCategoryCreate>, as a Hash
        #   * :category (Encounters::V4::NoteCategory)
        #   * :notes (Array<Encounters::V4::ClinicalNote>)
        # @param billing_notes [Array<Hash>] Spot to store misc, human-readable, notes about this encounter to be used
        #   in the billing process.Request of type Array<BillingNotes::V2::BillingNoteBase>, as a Hash
        #   * :text (String)
        # @param place_of_service_code [Commons::FacilityTypeCode] Box 24B on the CMS-1500 claim form. Line-level place of service is not currently supported. 02 for telemedicine, 11 for in-person. Full list [here](https://www.cms.gov/Medicare/Coding/place-of-service-codes/Place_of_Service_Code_Set).
        # @param patient_histories [Array<Hash>] Request of type Array<Encounters::V4::PatientHistoryCategory>, as a Hash
        #   * :category (Encounters::V4::PatientHistoryCategoryEnum)
        #   * :questions (Array<Encounters::V4::IntakeQuestion>)
        # @param service_lines [Array<Hash>] Each service line must be linked to a diagnosis. Concretely,
        #   `service_line.diagnosis_pointers`must contain at least one entry which should be
        #   in bounds of the diagnoses list field.Request of type Array<ServiceLines::V2::ServiceLineCreate>, as a Hash
        #   * :modifiers (Array<Commons::ProcedureModifier>)
        #   * :procedure_code (String)
        #   * :quantity (Commons::DECIMAL)
        #   * :units (Commons::ServiceLineUnits)
        #   * :charge_amount_cents (Integer)
        #   * :diagnosis_pointers (Array<Integer>)
        #   * :drug_identification (Hash)
        #     * :service_id_qualifier (ServiceLines::V2::ServiceIdQualifier)
        #     * :national_drug_code (String)
        #     * :national_drug_unit_count (String)
        #     * :measurement_unit_code (ServiceLines::V2::MeasurementUnitCode)
        #     * :link_sequence_number (String)
        #     * :pharmacy_prescription_number (String)
        #   * :place_of_service_code (Commons::FacilityTypeCode)
        #   * :description (String)
        #   * :date_of_service (Date)
        #   * :end_date_of_service (Date)
        # @param guarantor [Hash] Personal and contact info for the guarantor of the patient responsibility.Request of type Guarantor::V1::GuarantorCreate, as a Hash
        #   * :phone_numbers (Array<Commons::PhoneNumber>)
        #   * :phone_consent (Boolean)
        #   * :email (Commons::EMAIL)
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
        #     * :state (Commons::State)
        #     * :zip_code (String)
        # @param external_claim_submission [Hash] ***This field is in beta.***
        #   To be included for claims that have been submitted outside of Candid.
        #   Candid supports posting remits and payments to these claims and working them in-platform (e.g. editing, resubmitting).Request of type ClaimSubmission::V1::ExternalClaimSubmissionCreate, as a Hash
        #   * :claim_created_at (DateTime)
        #   * :patient_control_number (String)
        #   * :submission_records (Array<ClaimSubmission::V1::ClaimSubmissionRecordCreate>)
        # @param tag_ids [Array<Tags::TAG_ID>] Names of tags that should be on the encounter.
        # @param request_options [RequestOptions]
        # @return [Encounters::V4::Encounter]
        def create(external_id:, patient_authorized_release:, benefits_assigned_to_provider:,
                   provider_accepts_assignment:, billable_status:, responsible_party:, patient:, billing_provider:, rendering_provider:, diagnoses:, place_of_service_code:, prior_authorization_number: nil, appointment_type: nil, existing_medications: nil, vitals: nil, interventions: nil, pay_to_address: nil, synchronicity: nil, additional_information: nil, service_authorization_exception_code: nil, admission_date: nil, discharge_date: nil, onset_of_current_illness_or_symptom_date: nil, last_menstrual_period_date: nil, delay_reason_code: nil, additional_properties: nil, date_of_service: nil, end_date_of_service: nil, referring_provider: nil, service_facility: nil, subscriber_primary: nil, subscriber_secondary: nil, clinical_notes: nil, billing_notes: nil, patient_histories: nil, service_lines: nil, guarantor: nil, external_claim_submission: nil, tag_ids: nil, request_options: nil)
          Async do
            response = @request_client.conn.post("/api/encounters/v4") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
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
                date_of_service: date_of_service,
                end_date_of_service: end_date_of_service,
                patient: patient,
                billing_provider: billing_provider,
                rendering_provider: rendering_provider,
                referring_provider: referring_provider,
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
                tag_ids: tag_ids
              }.compact
            end
            Encounters::V4::Encounter.from_json(json_object: response.body)
          end
        end

        # @param encounter_id [Commons::ENCOUNTER_ID]
        # @param prior_authorization_number [Encounters::V4::PRIOR_AUTHORIZATION_NUMBER] Box 23 on the CMS-1500 claim form.
        # @param external_id [Commons::ENCOUNTER_EXTERNAL_ID] A client-specified unique ID to associate with this encounter;
        #   for example, your internal encounter ID or a Dr. Chrono encounter ID.
        #   This field should not contain PHI.
        # @param date_of_service [Commons::DATE] Date formatted as YYYY-MM-DD; eg: 2019-08-24.
        #   This date must be the local date in the timezone where the service occurred.
        #   Box 24a on the CMS-1500 claim form.
        #   If service occurred over a range of dates, this should be the start date.
        #   If service lines have distinct date_of_service values, updating the encounter's date_of_service will fail. If all service line date_of_service values are the same, updating the encounter's date_of_service will update all service line date_of_service values.
        # @param diagnosis_ids [Array<Diagnoses::DIAGNOSIS_ID>] Ideally, this field should contain no more than 12 diagnoses. However, more diagnoses
        #   may be submitted at this time, and coders will later prioritize the 12 that will be
        #   submitted to the payor.
        # @param tag_ids [Array<Tags::TAG_ID>] Names of tags that should be on the encounter.  Note all tags on encounter will be overriden with this list.
        # @param clinical_notes [Array<Hash>] Holds a collection of clinical observations made by healthcare providers during patient encounters.Request of type Array<Encounters::V4::ClinicalNoteCategoryCreate>, as a Hash
        #   * :category (Encounters::V4::NoteCategory)
        #   * :notes (Array<Encounters::V4::ClinicalNote>)
        # @param pay_to_address [Hash] Specifies the address to which payments for the claim should be sent.Request of type Commons::StreetAddressLongZip, as a Hash
        #   * :zip_plus_four_code (String)
        #   * :address_1 (String)
        #   * :address_2 (String)
        #   * :city (String)
        #   * :state (Commons::State)
        #   * :zip_code (String)
        # @param billable_status [Encounters::V4::BillableStatusType] Defines if the Encounter is to be billed by Candid to the responsible_party. Examples for when this should be set to NOT_BILLABLE include if the Encounter has not occurred yet or if there is no intention of ever billing the responsible_party.
        # @param responsible_party [Encounters::V4::ResponsiblePartyType] Defines the party to be billed with the initial balance owed on the claim. Use SELF_PAY if you intend to bill self pay/cash pay.
        # @param provider_accepts_assignment [Boolean] Whether you have accepted the patient's authorization for insurance payments to be made to you, not them. Box 27 on the CMS-1500 claim form.
        # @param benefits_assigned_to_provider [Boolean] Whether this patient has authorized insurance payments to be made to you, not them. If false, patient may receive reimbursement. Box 13 on the CMS-1500 claim form.
        # @param synchronicity [Encounters::V4::SynchronicityType] Whether or not this was a synchronous or asynchronous encounter. Asynchronous encounters occur when providers and patients communicate online using forms, instant messaging, or other pre-recorded digital mediums. Synchronous encounters occur in live, real-time settings where the patient interacts directly with the provider, such as over video or a phone call.
        # @param place_of_service_code [Commons::FacilityTypeCode] Box 24B on the CMS-1500 claim form. Line-level place of service is not currently supported. 02 for telemedicine, 11 for in-person. Full list [here](https://www.cms.gov/Medicare/Coding/place-of-service-codes/Place_of_Service_Code_Set).
        # @param appointment_type [String] Human-readable description of the appointment type (ex: "Acupuncture - Headaches").
        # @param end_date_of_service [Commons::DATE] Date formatted as YYYY-MM-DD; eg: 2019-08-25.
        #   This date must be the local date in the timezone where the service occurred.
        #   If omitted, the Encounter is assumed to be for a single day.
        #   Must not be temporally before the date_of_service field.
        #   If service lines have distinct end_date_of_service values, updating the encounter's end_date_of_service will fail. If all service line end_date_of_service values are the same, updating the encounter's end_date_of_service will update all service line date_of_service values.
        # @param subscriber_primary [Hash] Contains details of the primary insurance subscriber.Request of type Individual::SubscriberCreate, as a Hash
        #   * :insurance_card (Hash)
        #     * :member_id (String)
        #     * :payer_name (String)
        #     * :payer_id (String)
        #     * :rx_bin (String)
        #     * :rx_pcn (String)
        #     * :image_url_front (String)
        #     * :image_url_back (String)
        #     * :emr_payer_crosswalk (Commons::EmrPayerCrosswalk)
        #     * :group_number (String)
        #     * :plan_name (String)
        #     * :plan_type (Commons::SourceOfPaymentCode)
        #     * :insurance_type (Commons::InsuranceTypeCode)
        #   * :patient_relationship_to_subscriber_code (Commons::PatientRelationshipToInsuredCodeAll)
        #   * :date_of_birth (Commons::DATE)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (Commons::State)
        #     * :zip_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :gender (Individual::Gender)
        # @param subscriber_secondary [Hash] Contains details of the secondary insurance subscriber.Request of type Individual::SubscriberCreate, as a Hash
        #   * :insurance_card (Hash)
        #     * :member_id (String)
        #     * :payer_name (String)
        #     * :payer_id (String)
        #     * :rx_bin (String)
        #     * :rx_pcn (String)
        #     * :image_url_front (String)
        #     * :image_url_back (String)
        #     * :emr_payer_crosswalk (Commons::EmrPayerCrosswalk)
        #     * :group_number (String)
        #     * :plan_name (String)
        #     * :plan_type (Commons::SourceOfPaymentCode)
        #     * :insurance_type (Commons::InsuranceTypeCode)
        #   * :patient_relationship_to_subscriber_code (Commons::PatientRelationshipToInsuredCodeAll)
        #   * :date_of_birth (Commons::DATE)
        #   * :address (Hash)
        #     * :zip_plus_four_code (String)
        #     * :address_1 (String)
        #     * :address_2 (String)
        #     * :city (String)
        #     * :state (Commons::State)
        #     * :zip_code (String)
        #   * :first_name (String)
        #   * :last_name (String)
        #   * :gender (Individual::Gender)
        # @param additional_information [String] Defines additional information on the claim needed by the payer.
        #   Box 19 on the CMS-1500 claim form.
        # @param service_authorization_exception_code [Encounters::V4::ServiceAuthorizationExceptionCode] 837p Loop2300 REF*4N
        #   Required when mandated by government law or regulation to obtain authorization for specific service(s) but, for the
        #   reasons listed in one of the enum values of ServiceAuthorizationExceptionCode, the service was performed without
        #   obtaining the authorization.
        # @param admission_date [Commons::DATE] 837p Loop2300 DTP*435, CMS-1500 Box 18
        #   Required on all ambulance claims when the patient was known to be admitted to the hospital.
        #   OR
        #   Required on all claims involving inpatient medical visits.
        # @param discharge_date [Commons::DATE] 837p Loop2300 DTP*096, CMS-1500 Box 18
        #   Required for inpatient claims when the patient was discharged from the facility and the discharge date is known.
        # @param onset_of_current_illness_or_symptom_date [Commons::DATE] 837p Loop2300 DTP*431, CMS-1500 Box 14
        #   Required for the initial medical service or visit performed in response to a medical emergency when the date is available and is different than the date of service.
        #   OR
        #   This date is the onset of acute symptoms for the current illness or condition.
        # @param last_menstrual_period_date [Commons::DATE] 837p Loop2300 DTP*484, CMS-1500 Box 14
        #   Required when, in the judgment of the provider, the services on this claim are related to the patient's pregnancy.
        # @param delay_reason_code [Commons::DelayReasonCode] 837i Loop2300, CLM-1300 Box 20
        #   Code indicating the reason why a request was delayed
        # @param patient_authorized_release [Boolean] Whether this patient has authorized the release of medical information
        #   for billing purpose.
        #   Box 12 on the CMS-1500 claim form.
        # @param request_options [RequestOptions]
        # @return [Encounters::V4::Encounter]
        def update(encounter_id:, prior_authorization_number: nil, external_id: nil, date_of_service: nil,
                   diagnosis_ids: nil, tag_ids: nil, clinical_notes: nil, pay_to_address: nil, billable_status: nil, responsible_party: nil, provider_accepts_assignment: nil, benefits_assigned_to_provider: nil, synchronicity: nil, place_of_service_code: nil, appointment_type: nil, end_date_of_service: nil, subscriber_primary: nil, subscriber_secondary: nil, additional_information: nil, service_authorization_exception_code: nil, admission_date: nil, discharge_date: nil, onset_of_current_illness_or_symptom_date: nil, last_menstrual_period_date: nil, delay_reason_code: nil, patient_authorized_release: nil, request_options: nil)
          Async do
            response = @request_client.conn.patch("/api/encounters/v4/#{encounter_id}") do |req|
              req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
              req.headers["Authorization"] = request_options.token unless request_options&.token.nil?
              req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
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
                patient_authorized_release: patient_authorized_release
              }.compact
            end
            Encounters::V4::Encounter.from_json(json_object: response.body)
          end
        end
      end
    end
  end
end
