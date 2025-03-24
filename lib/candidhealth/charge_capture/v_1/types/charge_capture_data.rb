# frozen_string_literal: true

require_relative "../../../diagnoses/types/diagnosis_create"
require_relative "../../../encounters/v_4/types/intervention"
require_relative "../../../claim_submission/v_1/types/external_claim_submission_create"
require_relative "../../../service_lines/v_2/types/service_line_create"
require_relative "../../../encounters/v_4/types/patient_history_category"
require_relative "../../../billing_notes/v_2/types/billing_note"
require "date"
require_relative "../../../encounters/v_4/types/clinical_note_category_create"
require_relative "../../../commons/types/street_address_long_zip"
require_relative "../../../encounters/v_4/types/billable_status_type"
require_relative "../../../encounters/v_4/types/responsible_party_type"
require_relative "../../../encounters/v_4/types/synchronicity_type"
require_relative "../../../commons/types/facility_type_code"
require_relative "../../../individual/types/subscriber_create"
require_relative "../../../encounters/v_4/types/service_authorization_exception_code"
require_relative "../../../commons/types/delay_reason_code"
require_relative "../../../individual/types/patient_update"
require_relative "../../../custom_schemas/v_1/types/schema_instance"
require_relative "../../../encounters/v_4/types/vitals_update"
require_relative "../../../encounters/v_4/types/medication"
require_relative "../../../encounter_providers/v_2/types/rendering_provider_update"
require_relative "../../../service_facility/types/encounter_service_facility_update"
require_relative "../../../guarantor/v_1/types/guarantor_update"
require_relative "../../../encounter_providers/v_2/types/billing_provider_update"
require_relative "../../../encounter_providers/v_2/types/supervising_provider_update"
require_relative "../../../encounter_providers/v_2/types/referring_provider_update"
require_relative "../../../encounter_providers/v_2/types/initial_referring_provider_update"
require_relative "../../../encounters/v_4/types/epsdt_referral"
require_relative "../../../encounters/v_4/types/claim_supplemental_information"
require "ostruct"
require "json"

module CandidApiClient
  module ChargeCapture
    module V1
      module Types
        class ChargeCaptureData
          # @return [Array<CandidApiClient::Diagnoses::Types::DiagnosisCreate>] Ideally, this field should contain no more than 12 diagnoses. However, more
          #  diagnoses
          #  may be submitted at this time, and coders will later prioritize the 12 that will
          #  be
          #  submitted to the payor.
          attr_reader :diagnoses
          # @return [Array<CandidApiClient::Encounters::V4::Types::Intervention>]
          attr_reader :interventions
          # @return [CandidApiClient::ClaimSubmission::V1::Types::ExternalClaimSubmissionCreate] **_This field is in beta._**
          #  To be included for claims that have been submitted outside of Candid.
          #  Candid supports posting remits and payments to these claims and working them
          #  in-platform (e.g. editing, resubmitting).
          attr_reader :external_claim_submission
          # @return [Array<CandidApiClient::ServiceLines::V2::Types::ServiceLineCreate>] Each service line must be linked to a diagnosis. Concretely,
          #  `service_line.diagnosis_pointers`must contain at least one entry which should be
          #  in bounds of the diagnoses list field.
          attr_reader :service_lines
          # @return [Array<CandidApiClient::Encounters::V4::Types::PatientHistoryCategory>]
          attr_reader :patient_histories
          # @return [Array<CandidApiClient::BillingNotes::V2::Types::BillingNote>] Spot to store misc, human-readable, notes about this encounter to be
          #  used in the billing process.
          attr_reader :billing_notes
          # @return [Boolean] Whether this patient has authorized insurance payments to be made to you, not
          #  them. If false, patient may receive reimbursement. Box 13 on the CMS-1500 claim
          #  form.
          attr_reader :benefits_assigned_to_provider
          # @return [String] Box 23 on the CMS-1500 claim form.
          attr_reader :prior_authorization_number
          # @return [String] A client-specified unique ID to associate with this encounter;
          #  for example, your internal encounter ID or a Dr. Chrono encounter ID.
          #  This field should not contain PHI.
          attr_reader :external_id
          # @return [Date] Date formatted as YYYY-MM-DD; eg: 2019-08-24.
          #  This date must be the local date in the timezone where the service occurred.
          #  Box 24a on the CMS-1500 claim form.
          #  If service occurred over a range of dates, this should be the start date.
          #  If service lines have distinct date_of_service values, updating the encounter's
          #  date_of_service will fail. If all service line date_of_service values are the
          #  same, updating the encounter's date_of_service will update all service line
          #  date_of_service values.
          attr_reader :date_of_service
          # @return [Array<String>] Names of tags that should be on the encounter. Note all tags on encounter will
          #  be overridden with this list.
          attr_reader :tag_ids
          # @return [Array<CandidApiClient::Encounters::V4::Types::ClinicalNoteCategoryCreate>] Holds a collection of clinical observations made by healthcare providers during
          #  patient encounters.
          attr_reader :clinical_notes
          # @return [CandidApiClient::Commons::Types::StreetAddressLongZip] Specifies the address to which payments for the claim should be sent.
          attr_reader :pay_to_address
          # @return [CandidApiClient::Encounters::V4::Types::BillableStatusType] Defines if the Encounter is to be billed by Candid to the responsible_party.
          #  Examples for when this should be set to NOT_BILLABLE include if the Encounter
          #  has not occurred yet or if there is no intention of ever billing the
          #  responsible_party.
          attr_reader :billable_status
          # @return [CandidApiClient::Encounters::V4::Types::ResponsiblePartyType] Defines the party to be billed with the initial balance owed on the claim. Use
          #  SELF_PAY if you intend to bill self pay/cash pay.
          attr_reader :responsible_party
          # @return [Boolean] Whether you have accepted the patient's authorization for insurance payments to
          #  be made to you, not them. Box 27 on the CMS-1500 claim form.
          attr_reader :provider_accepts_assignment
          # @return [CandidApiClient::Encounters::V4::Types::SynchronicityType] Whether or not this was a synchronous or asynchronous encounter. Asynchronous
          #  encounters occur when providers and patients communicate online using forms,
          #  instant messaging, or other pre-recorded digital mediums. Synchronous encounters
          #  occur in live, real-time settings where the patient interacts directly with the
          #  provider, such as over video or a phone call.
          attr_reader :synchronicity
          # @return [CandidApiClient::Commons::Types::FacilityTypeCode] Box 24B on the CMS-1500 claim form. 837p Loop2300, CLM-05-1. 02 for
          #  telemedicine, 11 for in-person. Full list
          #  //www.cms.gov/Medicare/Coding/place-of-service-codes/Place_of_Service_Code_Set).
          attr_reader :place_of_service_code
          # @return [String] Human-readable description of the appointment type (ex: "Acupuncture -
          #  Headaches").
          attr_reader :appointment_type
          # @return [Date] Date formatted as YYYY-MM-DD; eg: 2019-08-25.
          #  This date must be the local date in the timezone where the service occurred.
          #  If omitted, the Encounter is assumed to be for a single day.
          #  Must not be temporally before the date_of_service field.
          #  If service lines have distinct end_date_of_service values, updating the
          #  encounter's end_date_of_service will fail. If all service line
          #  end_date_of_service values are the same, updating the encounter's
          #  end_date_of_service will update all service line date_of_service values.
          attr_reader :end_date_of_service
          # @return [CandidApiClient::Individual::Types::SubscriberCreate] Contains details of the primary insurance subscriber.
          attr_reader :subscriber_primary
          # @return [CandidApiClient::Individual::Types::SubscriberCreate] Contains details of the secondary insurance subscriber.
          attr_reader :subscriber_secondary
          # @return [String] Defines additional information on the claim needed by the payer.
          #  Box 19 on the CMS-1500 claim form.
          attr_reader :additional_information
          # @return [CandidApiClient::Encounters::V4::Types::ServiceAuthorizationExceptionCode] 837p Loop2300 REF\*4N
          #  Required when mandated by government law or regulation to obtain authorization
          #  for specific service(s) but, for the
          #  reasons listed in one of the enum values of ServiceAuthorizationExceptionCode,
          #  the service was performed without
          #  obtaining the authorization.
          attr_reader :service_authorization_exception_code
          # @return [Date] 837p Loop2300 DTP\*435, CMS-1500 Box 18
          #  Required on all ambulance claims when the patient was known to be admitted to
          #  the hospital.
          #  OR
          #  Required on all claims involving inpatient medical visits.
          attr_reader :admission_date
          # @return [Date] 837p Loop2300 DTP\*096, CMS-1500 Box 18
          #  Required for inpatient claims when the patient was discharged from the facility
          #  and the discharge date is known.
          attr_reader :discharge_date
          # @return [Date] 837p Loop2300 DTP\*431, CMS-1500 Box 14
          #  Required for the initial medical service or visit performed in response to a
          #  medical emergency when the date is available and is different than the date of
          #  service.
          #  OR
          #  This date is the onset of acute symptoms for the current illness or condition.
          attr_reader :onset_of_current_illness_or_symptom_date
          # @return [Date] 837p Loop2300 DTP\*484, CMS-1500 Box 14
          #  Required when, in the judgment of the provider, the services on this claim are
          #  related to the patient's pregnancy.de
          attr_reader :last_menstrual_period_date
          # @return [CandidApiClient::Commons::Types::DelayReasonCode] 837i Loop2300, CLM-1300 Box 20
          #  Code indicating the reason why a request was delayed
          attr_reader :delay_reason_code
          # @return [CandidApiClient::Individual::Types::PatientUpdate] Contains the identification information of the individual receiving medical
          #  services.
          attr_reader :patient
          # @return [Boolean] Whether this patient has authorized the release of medical information
          #  for billing purpose.
          #  Box 12 on the CMS-1500 claim form.
          attr_reader :patient_authorized_release
          # @return [Array<CandidApiClient::CustomSchemas::V1::Types::SchemaInstance>] Key-value pairs that must adhere to a schema created via the Custom Schema API.
          #  Multiple schema
          #  instances cannot be created for the same schema on an encounter. Updating schema
          #  instances utilizes PUT
          #  semantics, so the schema instances on the encounter will be set to whatever
          #  inputs are provided. If null
          #  is provided as an input, then the encounter's schema instances will be cleared.
          attr_reader :schema_instances
          # @return [CandidApiClient::Encounters::V4::Types::VitalsUpdate] If a vitals entity already exists for the encounter, then all values will be
          #  updated to the provided values.
          #  Otherwise, a new vitals object will be created for the encounter.
          attr_reader :vitals
          # @return [Array<CandidApiClient::Encounters::V4::Types::Medication>] Existing medications that should be on the encounter.
          #  Note all current existing medications on encounter will be overridden with this
          #  list.
          attr_reader :existing_medications
          # @return [CandidApiClient::EncounterProviders::V2::Types::RenderingProviderUpdate] The rendering provider is the practitioner -- physician, nurse practitioner,
          #  etc. -- performing the service.
          #  For telehealth services, the rendering provider performs the visit, asynchronous
          #  communication, or other service. The rendering provider address should generally
          #  be the same as the service facility address.
          attr_reader :rendering_provider
          # @return [CandidApiClient::ServiceFacility::Types::EncounterServiceFacilityUpdate] Encounter Service facility is typically the location a medical service was
          #  rendered, such as a provider office or hospital. For telehealth, service
          #  facility can represent the provider's location when the service was delivered
          #  (e.g., home), or the location where an in-person visit would have taken place,
          #  whichever is easier to identify. If the provider is in-network, service facility
          #  may be defined in payer contracts. Box 32 on the CMS-1500 claim form. Note that
          #  for an in-network claim to be successfully adjudicated, the service facility
          #  address listed on claims must match what was provided to the payer during the
          #  credentialing process.
          attr_reader :service_facility
          # @return [CandidApiClient::Guarantor::V1::Types::GuarantorUpdate] Personal and contact info for the guarantor of the patient responsibility.
          attr_reader :guarantor
          # @return [CandidApiClient::EncounterProviders::V2::Types::BillingProviderUpdate] The billing provider is the provider or business entity submitting the claim.
          #  Billing provider may be, but is not necessarily, the same person/NPI as the
          #  rendering provider. From a payer's perspective, this represents the person or
          #  entity being reimbursed. When a contract exists with the target payer, the
          #  billing provider should be the entity contracted with the payer. In some
          #  circumstances, this will be an individual provider. In that case, submit that
          #  provider's NPI and the tax ID (TIN) that the provider gave to the payer during
          #  contracting. In other cases, the billing entity will be a medical group. If so,
          #  submit the group NPI and the group's tax ID. Box 33 on the CMS-1500 claim form.
          attr_reader :billing_provider
          # @return [CandidApiClient::EncounterProviders::V2::Types::SupervisingProviderUpdate] Required when the rendering provider is supervised by a physician. If not
          #  required by this implementation guide, do not send.
          attr_reader :supervising_provider
          # @return [CandidApiClient::EncounterProviders::V2::Types::ReferringProviderUpdate] The final provider who referred the services that were rendered.
          #  All physicians who order services or refer Medicare beneficiaries must
          #  report this data.
          attr_reader :referring_provider
          # @return [CandidApiClient::EncounterProviders::V2::Types::InitialReferringProviderUpdate] The second iteration of Loop ID-2310. Use code "P3 - Primary Care Provider" in
          #  this loop to
          #  indicate the initial referral from the primary care provider or whatever
          #  provider wrote the initial referral for this patient's episode of care being
          #  billed/reported in this transaction.
          attr_reader :initial_referring_provider
          # @return [String] Refers to REF\*9F on the 837p. Value cannot be greater than 50 characters.
          attr_reader :referral_number
          # @return [CandidApiClient::Encounters::V4::Types::EpsdtReferral] Refers Box 24H on the CMS1500 form and Loop 2300 CRC - EPSDT Referral on the
          #  837P form
          attr_reader :epsdt_referral
          # @return [Array<CandidApiClient::Encounters::V4::Types::ClaimSupplementalInformation>] Refers to Loop 2300 - Segment PWK on the 837P form. No more than 10 entries are
          #  permitted.
          attr_reader :claim_supplemental_information
          # @return [OpenStruct] Additional properties unmapped to the current class definition
          attr_reader :additional_properties
          # @return [Object]
          attr_reader :_field_set
          protected :_field_set

          OMIT = Object.new

          # @param diagnoses [Array<CandidApiClient::Diagnoses::Types::DiagnosisCreate>] Ideally, this field should contain no more than 12 diagnoses. However, more
          #  diagnoses
          #  may be submitted at this time, and coders will later prioritize the 12 that will
          #  be
          #  submitted to the payor.
          # @param interventions [Array<CandidApiClient::Encounters::V4::Types::Intervention>]
          # @param external_claim_submission [CandidApiClient::ClaimSubmission::V1::Types::ExternalClaimSubmissionCreate] **_This field is in beta._**
          #  To be included for claims that have been submitted outside of Candid.
          #  Candid supports posting remits and payments to these claims and working them
          #  in-platform (e.g. editing, resubmitting).
          # @param service_lines [Array<CandidApiClient::ServiceLines::V2::Types::ServiceLineCreate>] Each service line must be linked to a diagnosis. Concretely,
          #  `service_line.diagnosis_pointers`must contain at least one entry which should be
          #  in bounds of the diagnoses list field.
          # @param patient_histories [Array<CandidApiClient::Encounters::V4::Types::PatientHistoryCategory>]
          # @param billing_notes [Array<CandidApiClient::BillingNotes::V2::Types::BillingNote>] Spot to store misc, human-readable, notes about this encounter to be
          #  used in the billing process.
          # @param benefits_assigned_to_provider [Boolean] Whether this patient has authorized insurance payments to be made to you, not
          #  them. If false, patient may receive reimbursement. Box 13 on the CMS-1500 claim
          #  form.
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
          # @param tag_ids [Array<String>] Names of tags that should be on the encounter. Note all tags on encounter will
          #  be overridden with this list.
          # @param clinical_notes [Array<CandidApiClient::Encounters::V4::Types::ClinicalNoteCategoryCreate>] Holds a collection of clinical observations made by healthcare providers during
          #  patient encounters.
          # @param pay_to_address [CandidApiClient::Commons::Types::StreetAddressLongZip] Specifies the address to which payments for the claim should be sent.
          # @param billable_status [CandidApiClient::Encounters::V4::Types::BillableStatusType] Defines if the Encounter is to be billed by Candid to the responsible_party.
          #  Examples for when this should be set to NOT_BILLABLE include if the Encounter
          #  has not occurred yet or if there is no intention of ever billing the
          #  responsible_party.
          # @param responsible_party [CandidApiClient::Encounters::V4::Types::ResponsiblePartyType] Defines the party to be billed with the initial balance owed on the claim. Use
          #  SELF_PAY if you intend to bill self pay/cash pay.
          # @param provider_accepts_assignment [Boolean] Whether you have accepted the patient's authorization for insurance payments to
          #  be made to you, not them. Box 27 on the CMS-1500 claim form.
          # @param synchronicity [CandidApiClient::Encounters::V4::Types::SynchronicityType] Whether or not this was a synchronous or asynchronous encounter. Asynchronous
          #  encounters occur when providers and patients communicate online using forms,
          #  instant messaging, or other pre-recorded digital mediums. Synchronous encounters
          #  occur in live, real-time settings where the patient interacts directly with the
          #  provider, such as over video or a phone call.
          # @param place_of_service_code [CandidApiClient::Commons::Types::FacilityTypeCode] Box 24B on the CMS-1500 claim form. 837p Loop2300, CLM-05-1. 02 for
          #  telemedicine, 11 for in-person. Full list
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
          # @param subscriber_primary [CandidApiClient::Individual::Types::SubscriberCreate] Contains details of the primary insurance subscriber.
          # @param subscriber_secondary [CandidApiClient::Individual::Types::SubscriberCreate] Contains details of the secondary insurance subscriber.
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
          #  related to the patient's pregnancy.de
          # @param delay_reason_code [CandidApiClient::Commons::Types::DelayReasonCode] 837i Loop2300, CLM-1300 Box 20
          #  Code indicating the reason why a request was delayed
          # @param patient [CandidApiClient::Individual::Types::PatientUpdate] Contains the identification information of the individual receiving medical
          #  services.
          # @param patient_authorized_release [Boolean] Whether this patient has authorized the release of medical information
          #  for billing purpose.
          #  Box 12 on the CMS-1500 claim form.
          # @param schema_instances [Array<CandidApiClient::CustomSchemas::V1::Types::SchemaInstance>] Key-value pairs that must adhere to a schema created via the Custom Schema API.
          #  Multiple schema
          #  instances cannot be created for the same schema on an encounter. Updating schema
          #  instances utilizes PUT
          #  semantics, so the schema instances on the encounter will be set to whatever
          #  inputs are provided. If null
          #  is provided as an input, then the encounter's schema instances will be cleared.
          # @param vitals [CandidApiClient::Encounters::V4::Types::VitalsUpdate] If a vitals entity already exists for the encounter, then all values will be
          #  updated to the provided values.
          #  Otherwise, a new vitals object will be created for the encounter.
          # @param existing_medications [Array<CandidApiClient::Encounters::V4::Types::Medication>] Existing medications that should be on the encounter.
          #  Note all current existing medications on encounter will be overridden with this
          #  list.
          # @param rendering_provider [CandidApiClient::EncounterProviders::V2::Types::RenderingProviderUpdate] The rendering provider is the practitioner -- physician, nurse practitioner,
          #  etc. -- performing the service.
          #  For telehealth services, the rendering provider performs the visit, asynchronous
          #  communication, or other service. The rendering provider address should generally
          #  be the same as the service facility address.
          # @param service_facility [CandidApiClient::ServiceFacility::Types::EncounterServiceFacilityUpdate] Encounter Service facility is typically the location a medical service was
          #  rendered, such as a provider office or hospital. For telehealth, service
          #  facility can represent the provider's location when the service was delivered
          #  (e.g., home), or the location where an in-person visit would have taken place,
          #  whichever is easier to identify. If the provider is in-network, service facility
          #  may be defined in payer contracts. Box 32 on the CMS-1500 claim form. Note that
          #  for an in-network claim to be successfully adjudicated, the service facility
          #  address listed on claims must match what was provided to the payer during the
          #  credentialing process.
          # @param guarantor [CandidApiClient::Guarantor::V1::Types::GuarantorUpdate] Personal and contact info for the guarantor of the patient responsibility.
          # @param billing_provider [CandidApiClient::EncounterProviders::V2::Types::BillingProviderUpdate] The billing provider is the provider or business entity submitting the claim.
          #  Billing provider may be, but is not necessarily, the same person/NPI as the
          #  rendering provider. From a payer's perspective, this represents the person or
          #  entity being reimbursed. When a contract exists with the target payer, the
          #  billing provider should be the entity contracted with the payer. In some
          #  circumstances, this will be an individual provider. In that case, submit that
          #  provider's NPI and the tax ID (TIN) that the provider gave to the payer during
          #  contracting. In other cases, the billing entity will be a medical group. If so,
          #  submit the group NPI and the group's tax ID. Box 33 on the CMS-1500 claim form.
          # @param supervising_provider [CandidApiClient::EncounterProviders::V2::Types::SupervisingProviderUpdate] Required when the rendering provider is supervised by a physician. If not
          #  required by this implementation guide, do not send.
          # @param referring_provider [CandidApiClient::EncounterProviders::V2::Types::ReferringProviderUpdate] The final provider who referred the services that were rendered.
          #  All physicians who order services or refer Medicare beneficiaries must
          #  report this data.
          # @param initial_referring_provider [CandidApiClient::EncounterProviders::V2::Types::InitialReferringProviderUpdate] The second iteration of Loop ID-2310. Use code "P3 - Primary Care Provider" in
          #  this loop to
          #  indicate the initial referral from the primary care provider or whatever
          #  provider wrote the initial referral for this patient's episode of care being
          #  billed/reported in this transaction.
          # @param referral_number [String] Refers to REF\*9F on the 837p. Value cannot be greater than 50 characters.
          # @param epsdt_referral [CandidApiClient::Encounters::V4::Types::EpsdtReferral] Refers Box 24H on the CMS1500 form and Loop 2300 CRC - EPSDT Referral on the
          #  837P form
          # @param claim_supplemental_information [Array<CandidApiClient::Encounters::V4::Types::ClaimSupplementalInformation>] Refers to Loop 2300 - Segment PWK on the 837P form. No more than 10 entries are
          #  permitted.
          # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
          # @return [CandidApiClient::ChargeCapture::V1::Types::ChargeCaptureData]
          def initialize(diagnoses: OMIT, interventions: OMIT, external_claim_submission: OMIT, service_lines: OMIT,
                         patient_histories: OMIT, billing_notes: OMIT, benefits_assigned_to_provider: OMIT, prior_authorization_number: OMIT, external_id: OMIT, date_of_service: OMIT, tag_ids: OMIT, clinical_notes: OMIT, pay_to_address: OMIT, billable_status: OMIT, responsible_party: OMIT, provider_accepts_assignment: OMIT, synchronicity: OMIT, place_of_service_code: OMIT, appointment_type: OMIT, end_date_of_service: OMIT, subscriber_primary: OMIT, subscriber_secondary: OMIT, additional_information: OMIT, service_authorization_exception_code: OMIT, admission_date: OMIT, discharge_date: OMIT, onset_of_current_illness_or_symptom_date: OMIT, last_menstrual_period_date: OMIT, delay_reason_code: OMIT, patient: OMIT, patient_authorized_release: OMIT, schema_instances: OMIT, vitals: OMIT, existing_medications: OMIT, rendering_provider: OMIT, service_facility: OMIT, guarantor: OMIT, billing_provider: OMIT, supervising_provider: OMIT, referring_provider: OMIT, initial_referring_provider: OMIT, referral_number: OMIT, epsdt_referral: OMIT, claim_supplemental_information: OMIT, additional_properties: nil)
            @diagnoses = diagnoses if diagnoses != OMIT
            @interventions = interventions if interventions != OMIT
            @external_claim_submission = external_claim_submission if external_claim_submission != OMIT
            @service_lines = service_lines if service_lines != OMIT
            @patient_histories = patient_histories if patient_histories != OMIT
            @billing_notes = billing_notes if billing_notes != OMIT
            @benefits_assigned_to_provider = benefits_assigned_to_provider if benefits_assigned_to_provider != OMIT
            @prior_authorization_number = prior_authorization_number if prior_authorization_number != OMIT
            @external_id = external_id if external_id != OMIT
            @date_of_service = date_of_service if date_of_service != OMIT
            @tag_ids = tag_ids if tag_ids != OMIT
            @clinical_notes = clinical_notes if clinical_notes != OMIT
            @pay_to_address = pay_to_address if pay_to_address != OMIT
            @billable_status = billable_status if billable_status != OMIT
            @responsible_party = responsible_party if responsible_party != OMIT
            @provider_accepts_assignment = provider_accepts_assignment if provider_accepts_assignment != OMIT
            @synchronicity = synchronicity if synchronicity != OMIT
            @place_of_service_code = place_of_service_code if place_of_service_code != OMIT
            @appointment_type = appointment_type if appointment_type != OMIT
            @end_date_of_service = end_date_of_service if end_date_of_service != OMIT
            @subscriber_primary = subscriber_primary if subscriber_primary != OMIT
            @subscriber_secondary = subscriber_secondary if subscriber_secondary != OMIT
            @additional_information = additional_information if additional_information != OMIT
            if service_authorization_exception_code != OMIT
              @service_authorization_exception_code = service_authorization_exception_code
            end
            @admission_date = admission_date if admission_date != OMIT
            @discharge_date = discharge_date if discharge_date != OMIT
            if onset_of_current_illness_or_symptom_date != OMIT
              @onset_of_current_illness_or_symptom_date = onset_of_current_illness_or_symptom_date
            end
            @last_menstrual_period_date = last_menstrual_period_date if last_menstrual_period_date != OMIT
            @delay_reason_code = delay_reason_code if delay_reason_code != OMIT
            @patient = patient if patient != OMIT
            @patient_authorized_release = patient_authorized_release if patient_authorized_release != OMIT
            @schema_instances = schema_instances if schema_instances != OMIT
            @vitals = vitals if vitals != OMIT
            @existing_medications = existing_medications if existing_medications != OMIT
            @rendering_provider = rendering_provider if rendering_provider != OMIT
            @service_facility = service_facility if service_facility != OMIT
            @guarantor = guarantor if guarantor != OMIT
            @billing_provider = billing_provider if billing_provider != OMIT
            @supervising_provider = supervising_provider if supervising_provider != OMIT
            @referring_provider = referring_provider if referring_provider != OMIT
            @initial_referring_provider = initial_referring_provider if initial_referring_provider != OMIT
            @referral_number = referral_number if referral_number != OMIT
            @epsdt_referral = epsdt_referral if epsdt_referral != OMIT
            @claim_supplemental_information = claim_supplemental_information if claim_supplemental_information != OMIT
            @additional_properties = additional_properties
            @_field_set = {
              "diagnoses": diagnoses,
              "interventions": interventions,
              "external_claim_submission": external_claim_submission,
              "service_lines": service_lines,
              "patient_histories": patient_histories,
              "billing_notes": billing_notes,
              "benefits_assigned_to_provider": benefits_assigned_to_provider,
              "prior_authorization_number": prior_authorization_number,
              "external_id": external_id,
              "date_of_service": date_of_service,
              "tag_ids": tag_ids,
              "clinical_notes": clinical_notes,
              "pay_to_address": pay_to_address,
              "billable_status": billable_status,
              "responsible_party": responsible_party,
              "provider_accepts_assignment": provider_accepts_assignment,
              "synchronicity": synchronicity,
              "place_of_service_code": place_of_service_code,
              "appointment_type": appointment_type,
              "end_date_of_service": end_date_of_service,
              "subscriber_primary": subscriber_primary,
              "subscriber_secondary": subscriber_secondary,
              "additional_information": additional_information,
              "service_authorization_exception_code": service_authorization_exception_code,
              "admission_date": admission_date,
              "discharge_date": discharge_date,
              "onset_of_current_illness_or_symptom_date": onset_of_current_illness_or_symptom_date,
              "last_menstrual_period_date": last_menstrual_period_date,
              "delay_reason_code": delay_reason_code,
              "patient": patient,
              "patient_authorized_release": patient_authorized_release,
              "schema_instances": schema_instances,
              "vitals": vitals,
              "existing_medications": existing_medications,
              "rendering_provider": rendering_provider,
              "service_facility": service_facility,
              "guarantor": guarantor,
              "billing_provider": billing_provider,
              "supervising_provider": supervising_provider,
              "referring_provider": referring_provider,
              "initial_referring_provider": initial_referring_provider,
              "referral_number": referral_number,
              "epsdt_referral": epsdt_referral,
              "claim_supplemental_information": claim_supplemental_information
            }.reject do |_k, v|
              v == OMIT
            end
          end

          # Deserialize a JSON object to an instance of ChargeCaptureData
          #
          # @param json_object [String]
          # @return [CandidApiClient::ChargeCapture::V1::Types::ChargeCaptureData]
          def self.from_json(json_object:)
            struct = JSON.parse(json_object, object_class: OpenStruct)
            parsed_json = JSON.parse(json_object)
            diagnoses = parsed_json["diagnoses"]&.map do |item|
              item = item.to_json
              CandidApiClient::Diagnoses::Types::DiagnosisCreate.from_json(json_object: item)
            end
            interventions = parsed_json["interventions"]&.map do |item|
              item = item.to_json
              CandidApiClient::Encounters::V4::Types::Intervention.from_json(json_object: item)
            end
            if parsed_json["external_claim_submission"].nil?
              external_claim_submission = nil
            else
              external_claim_submission = parsed_json["external_claim_submission"].to_json
              external_claim_submission = CandidApiClient::ClaimSubmission::V1::Types::ExternalClaimSubmissionCreate.from_json(json_object: external_claim_submission)
            end
            service_lines = parsed_json["service_lines"]&.map do |item|
              item = item.to_json
              CandidApiClient::ServiceLines::V2::Types::ServiceLineCreate.from_json(json_object: item)
            end
            patient_histories = parsed_json["patient_histories"]&.map do |item|
              item = item.to_json
              CandidApiClient::Encounters::V4::Types::PatientHistoryCategory.from_json(json_object: item)
            end
            billing_notes = parsed_json["billing_notes"]&.map do |item|
              item = item.to_json
              CandidApiClient::BillingNotes::V2::Types::BillingNote.from_json(json_object: item)
            end
            benefits_assigned_to_provider = struct["benefits_assigned_to_provider"]
            prior_authorization_number = struct["prior_authorization_number"]
            external_id = struct["external_id"]
            date_of_service = (Date.parse(parsed_json["date_of_service"]) unless parsed_json["date_of_service"].nil?)
            tag_ids = struct["tag_ids"]
            clinical_notes = parsed_json["clinical_notes"]&.map do |item|
              item = item.to_json
              CandidApiClient::Encounters::V4::Types::ClinicalNoteCategoryCreate.from_json(json_object: item)
            end
            if parsed_json["pay_to_address"].nil?
              pay_to_address = nil
            else
              pay_to_address = parsed_json["pay_to_address"].to_json
              pay_to_address = CandidApiClient::Commons::Types::StreetAddressLongZip.from_json(json_object: pay_to_address)
            end
            billable_status = struct["billable_status"]
            responsible_party = struct["responsible_party"]
            provider_accepts_assignment = struct["provider_accepts_assignment"]
            synchronicity = struct["synchronicity"]
            place_of_service_code = struct["place_of_service_code"]
            appointment_type = struct["appointment_type"]
            end_date_of_service = unless parsed_json["end_date_of_service"].nil?
                                    Date.parse(parsed_json["end_date_of_service"])
                                  end
            if parsed_json["subscriber_primary"].nil?
              subscriber_primary = nil
            else
              subscriber_primary = parsed_json["subscriber_primary"].to_json
              subscriber_primary = CandidApiClient::Individual::Types::SubscriberCreate.from_json(json_object: subscriber_primary)
            end
            if parsed_json["subscriber_secondary"].nil?
              subscriber_secondary = nil
            else
              subscriber_secondary = parsed_json["subscriber_secondary"].to_json
              subscriber_secondary = CandidApiClient::Individual::Types::SubscriberCreate.from_json(json_object: subscriber_secondary)
            end
            additional_information = struct["additional_information"]
            service_authorization_exception_code = struct["service_authorization_exception_code"]
            admission_date = (Date.parse(parsed_json["admission_date"]) unless parsed_json["admission_date"].nil?)
            discharge_date = (Date.parse(parsed_json["discharge_date"]) unless parsed_json["discharge_date"].nil?)
            onset_of_current_illness_or_symptom_date = unless parsed_json["onset_of_current_illness_or_symptom_date"].nil?
                                                         Date.parse(parsed_json["onset_of_current_illness_or_symptom_date"])
                                                       end
            last_menstrual_period_date = unless parsed_json["last_menstrual_period_date"].nil?
                                           Date.parse(parsed_json["last_menstrual_period_date"])
                                         end
            delay_reason_code = struct["delay_reason_code"]
            if parsed_json["patient"].nil?
              patient = nil
            else
              patient = parsed_json["patient"].to_json
              patient = CandidApiClient::Individual::Types::PatientUpdate.from_json(json_object: patient)
            end
            patient_authorized_release = struct["patient_authorized_release"]
            schema_instances = parsed_json["schema_instances"]&.map do |item|
              item = item.to_json
              CandidApiClient::CustomSchemas::V1::Types::SchemaInstance.from_json(json_object: item)
            end
            if parsed_json["vitals"].nil?
              vitals = nil
            else
              vitals = parsed_json["vitals"].to_json
              vitals = CandidApiClient::Encounters::V4::Types::VitalsUpdate.from_json(json_object: vitals)
            end
            existing_medications = parsed_json["existing_medications"]&.map do |item|
              item = item.to_json
              CandidApiClient::Encounters::V4::Types::Medication.from_json(json_object: item)
            end
            if parsed_json["rendering_provider"].nil?
              rendering_provider = nil
            else
              rendering_provider = parsed_json["rendering_provider"].to_json
              rendering_provider = CandidApiClient::EncounterProviders::V2::Types::RenderingProviderUpdate.from_json(json_object: rendering_provider)
            end
            if parsed_json["service_facility"].nil?
              service_facility = nil
            else
              service_facility = parsed_json["service_facility"].to_json
              service_facility = CandidApiClient::ServiceFacility::Types::EncounterServiceFacilityUpdate.from_json(json_object: service_facility)
            end
            if parsed_json["guarantor"].nil?
              guarantor = nil
            else
              guarantor = parsed_json["guarantor"].to_json
              guarantor = CandidApiClient::Guarantor::V1::Types::GuarantorUpdate.from_json(json_object: guarantor)
            end
            if parsed_json["billing_provider"].nil?
              billing_provider = nil
            else
              billing_provider = parsed_json["billing_provider"].to_json
              billing_provider = CandidApiClient::EncounterProviders::V2::Types::BillingProviderUpdate.from_json(json_object: billing_provider)
            end
            if parsed_json["supervising_provider"].nil?
              supervising_provider = nil
            else
              supervising_provider = parsed_json["supervising_provider"].to_json
              supervising_provider = CandidApiClient::EncounterProviders::V2::Types::SupervisingProviderUpdate.from_json(json_object: supervising_provider)
            end
            if parsed_json["referring_provider"].nil?
              referring_provider = nil
            else
              referring_provider = parsed_json["referring_provider"].to_json
              referring_provider = CandidApiClient::EncounterProviders::V2::Types::ReferringProviderUpdate.from_json(json_object: referring_provider)
            end
            if parsed_json["initial_referring_provider"].nil?
              initial_referring_provider = nil
            else
              initial_referring_provider = parsed_json["initial_referring_provider"].to_json
              initial_referring_provider = CandidApiClient::EncounterProviders::V2::Types::InitialReferringProviderUpdate.from_json(json_object: initial_referring_provider)
            end
            referral_number = struct["referral_number"]
            if parsed_json["epsdt_referral"].nil?
              epsdt_referral = nil
            else
              epsdt_referral = parsed_json["epsdt_referral"].to_json
              epsdt_referral = CandidApiClient::Encounters::V4::Types::EpsdtReferral.from_json(json_object: epsdt_referral)
            end
            claim_supplemental_information = parsed_json["claim_supplemental_information"]&.map do |item|
              item = item.to_json
              CandidApiClient::Encounters::V4::Types::ClaimSupplementalInformation.from_json(json_object: item)
            end
            new(
              diagnoses: diagnoses,
              interventions: interventions,
              external_claim_submission: external_claim_submission,
              service_lines: service_lines,
              patient_histories: patient_histories,
              billing_notes: billing_notes,
              benefits_assigned_to_provider: benefits_assigned_to_provider,
              prior_authorization_number: prior_authorization_number,
              external_id: external_id,
              date_of_service: date_of_service,
              tag_ids: tag_ids,
              clinical_notes: clinical_notes,
              pay_to_address: pay_to_address,
              billable_status: billable_status,
              responsible_party: responsible_party,
              provider_accepts_assignment: provider_accepts_assignment,
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
              patient: patient,
              patient_authorized_release: patient_authorized_release,
              schema_instances: schema_instances,
              vitals: vitals,
              existing_medications: existing_medications,
              rendering_provider: rendering_provider,
              service_facility: service_facility,
              guarantor: guarantor,
              billing_provider: billing_provider,
              supervising_provider: supervising_provider,
              referring_provider: referring_provider,
              initial_referring_provider: initial_referring_provider,
              referral_number: referral_number,
              epsdt_referral: epsdt_referral,
              claim_supplemental_information: claim_supplemental_information,
              additional_properties: struct
            )
          end

          # Serialize an instance of ChargeCaptureData to a JSON object
          #
          # @return [String]
          def to_json(*_args)
            @_field_set&.to_json
          end

          # Leveraged for Union-type generation, validate_raw attempts to parse the given
          #  hash and check each fields type against the current object's property
          #  definitions.
          #
          # @param obj [Object]
          # @return [Void]
          def self.validate_raw(obj:)
            obj.diagnoses&.is_a?(Array) != false || raise("Passed value for field obj.diagnoses is not the expected type, validation failed.")
            obj.interventions&.is_a?(Array) != false || raise("Passed value for field obj.interventions is not the expected type, validation failed.")
            obj.external_claim_submission.nil? || CandidApiClient::ClaimSubmission::V1::Types::ExternalClaimSubmissionCreate.validate_raw(obj: obj.external_claim_submission)
            obj.service_lines&.is_a?(Array) != false || raise("Passed value for field obj.service_lines is not the expected type, validation failed.")
            obj.patient_histories&.is_a?(Array) != false || raise("Passed value for field obj.patient_histories is not the expected type, validation failed.")
            obj.billing_notes&.is_a?(Array) != false || raise("Passed value for field obj.billing_notes is not the expected type, validation failed.")
            obj.benefits_assigned_to_provider&.is_a?(Boolean) != false || raise("Passed value for field obj.benefits_assigned_to_provider is not the expected type, validation failed.")
            obj.prior_authorization_number&.is_a?(String) != false || raise("Passed value for field obj.prior_authorization_number is not the expected type, validation failed.")
            obj.external_id&.is_a?(String) != false || raise("Passed value for field obj.external_id is not the expected type, validation failed.")
            obj.date_of_service&.is_a?(Date) != false || raise("Passed value for field obj.date_of_service is not the expected type, validation failed.")
            obj.tag_ids&.is_a?(Array) != false || raise("Passed value for field obj.tag_ids is not the expected type, validation failed.")
            obj.clinical_notes&.is_a?(Array) != false || raise("Passed value for field obj.clinical_notes is not the expected type, validation failed.")
            obj.pay_to_address.nil? || CandidApiClient::Commons::Types::StreetAddressLongZip.validate_raw(obj: obj.pay_to_address)
            obj.billable_status&.is_a?(CandidApiClient::Encounters::V4::Types::BillableStatusType) != false || raise("Passed value for field obj.billable_status is not the expected type, validation failed.")
            obj.responsible_party&.is_a?(CandidApiClient::Encounters::V4::Types::ResponsiblePartyType) != false || raise("Passed value for field obj.responsible_party is not the expected type, validation failed.")
            obj.provider_accepts_assignment&.is_a?(Boolean) != false || raise("Passed value for field obj.provider_accepts_assignment is not the expected type, validation failed.")
            obj.synchronicity&.is_a?(CandidApiClient::Encounters::V4::Types::SynchronicityType) != false || raise("Passed value for field obj.synchronicity is not the expected type, validation failed.")
            obj.place_of_service_code&.is_a?(CandidApiClient::Commons::Types::FacilityTypeCode) != false || raise("Passed value for field obj.place_of_service_code is not the expected type, validation failed.")
            obj.appointment_type&.is_a?(String) != false || raise("Passed value for field obj.appointment_type is not the expected type, validation failed.")
            obj.end_date_of_service&.is_a?(Date) != false || raise("Passed value for field obj.end_date_of_service is not the expected type, validation failed.")
            obj.subscriber_primary.nil? || CandidApiClient::Individual::Types::SubscriberCreate.validate_raw(obj: obj.subscriber_primary)
            obj.subscriber_secondary.nil? || CandidApiClient::Individual::Types::SubscriberCreate.validate_raw(obj: obj.subscriber_secondary)
            obj.additional_information&.is_a?(String) != false || raise("Passed value for field obj.additional_information is not the expected type, validation failed.")
            obj.service_authorization_exception_code&.is_a?(CandidApiClient::Encounters::V4::Types::ServiceAuthorizationExceptionCode) != false || raise("Passed value for field obj.service_authorization_exception_code is not the expected type, validation failed.")
            obj.admission_date&.is_a?(Date) != false || raise("Passed value for field obj.admission_date is not the expected type, validation failed.")
            obj.discharge_date&.is_a?(Date) != false || raise("Passed value for field obj.discharge_date is not the expected type, validation failed.")
            obj.onset_of_current_illness_or_symptom_date&.is_a?(Date) != false || raise("Passed value for field obj.onset_of_current_illness_or_symptom_date is not the expected type, validation failed.")
            obj.last_menstrual_period_date&.is_a?(Date) != false || raise("Passed value for field obj.last_menstrual_period_date is not the expected type, validation failed.")
            obj.delay_reason_code&.is_a?(CandidApiClient::Commons::Types::DelayReasonCode) != false || raise("Passed value for field obj.delay_reason_code is not the expected type, validation failed.")
            obj.patient.nil? || CandidApiClient::Individual::Types::PatientUpdate.validate_raw(obj: obj.patient)
            obj.patient_authorized_release&.is_a?(Boolean) != false || raise("Passed value for field obj.patient_authorized_release is not the expected type, validation failed.")
            obj.schema_instances&.is_a?(Array) != false || raise("Passed value for field obj.schema_instances is not the expected type, validation failed.")
            obj.vitals.nil? || CandidApiClient::Encounters::V4::Types::VitalsUpdate.validate_raw(obj: obj.vitals)
            obj.existing_medications&.is_a?(Array) != false || raise("Passed value for field obj.existing_medications is not the expected type, validation failed.")
            obj.rendering_provider.nil? || CandidApiClient::EncounterProviders::V2::Types::RenderingProviderUpdate.validate_raw(obj: obj.rendering_provider)
            obj.service_facility.nil? || CandidApiClient::ServiceFacility::Types::EncounterServiceFacilityUpdate.validate_raw(obj: obj.service_facility)
            obj.guarantor.nil? || CandidApiClient::Guarantor::V1::Types::GuarantorUpdate.validate_raw(obj: obj.guarantor)
            obj.billing_provider.nil? || CandidApiClient::EncounterProviders::V2::Types::BillingProviderUpdate.validate_raw(obj: obj.billing_provider)
            obj.supervising_provider.nil? || CandidApiClient::EncounterProviders::V2::Types::SupervisingProviderUpdate.validate_raw(obj: obj.supervising_provider)
            obj.referring_provider.nil? || CandidApiClient::EncounterProviders::V2::Types::ReferringProviderUpdate.validate_raw(obj: obj.referring_provider)
            obj.initial_referring_provider.nil? || CandidApiClient::EncounterProviders::V2::Types::InitialReferringProviderUpdate.validate_raw(obj: obj.initial_referring_provider)
            obj.referral_number&.is_a?(String) != false || raise("Passed value for field obj.referral_number is not the expected type, validation failed.")
            obj.epsdt_referral.nil? || CandidApiClient::Encounters::V4::Types::EpsdtReferral.validate_raw(obj: obj.epsdt_referral)
            obj.claim_supplemental_information&.is_a?(Array) != false || raise("Passed value for field obj.claim_supplemental_information is not the expected type, validation failed.")
          end
        end
      end
    end
  end
end
