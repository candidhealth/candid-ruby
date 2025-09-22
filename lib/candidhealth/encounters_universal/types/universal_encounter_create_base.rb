# frozen_string_literal: true

require_relative "../../individual/types/patient_create"
require_relative "../../encounter_providers/v_2/types/referring_provider"
require_relative "../../encounter_providers/v_2/types/initial_referring_provider"
require_relative "../../encounter_providers/v_2/types/supervising_provider"
require_relative "../../service_facility/types/encounter_service_facility_base"
require_relative "../../individual/types/subscriber_create"
require_relative "../../encounters/v_4/types/responsible_party_type"
require_relative "../../encounters/v_4/types/clinical_note_category_create"
require_relative "../../billing_notes/v_2/types/billing_note_base"
require_relative "../../encounters/v_4/types/patient_history_category"
require_relative "../../guarantor/v_1/types/guarantor_create"
require_relative "../../claim_submission/v_1/types/external_claim_submission_create"
require_relative "../../custom_schemas/v_1/types/schema_instance"
require_relative "../../encounters/v_4/types/epsdt_referral"
require_relative "../../encounters/v_4/types/claim_supplemental_information"
require "date"
require_relative "../../encounters/v_4/types/medication"
require_relative "../../encounters/v_4/types/intervention"
require_relative "../../commons/types/street_address_long_zip"
require_relative "../../encounters/v_4/types/synchronicity_type"
require_relative "../../encounters/v_4/types/vitals"
require_relative "../../encounters/v_4/types/billable_status_type"
require_relative "../../encounters/v_4/types/service_authorization_exception_code"
require_relative "../../commons/types/delay_reason_code"
require "ostruct"
require "json"

module CandidApiClient
  module EncountersUniversal
    module Types
      class UniversalEncounterCreateBase
        # @return [CandidApiClient::Individual::Types::PatientCreate] Contains the identification information of the individual receiving medical
        #  services.
        attr_reader :patient
        # @return [CandidApiClient::EncounterProviders::V2::Types::ReferringProvider] The final provider who referred the services that were rendered.
        #  All physicians who order services or refer Medicare beneficiaries must
        #  report this data.
        attr_reader :referring_provider
        # @return [CandidApiClient::EncounterProviders::V2::Types::InitialReferringProvider] The second iteration of Loop ID-2310 on an 837P form. Use code "P3 - Primary
        #  Care Provider" in this loop to
        #  indicate the initial referral from the primary care provider or whatever
        #  provider wrote the initial referral for this patient's episode of care being
        #  billed/reported in this transaction.
        #  Not used in an 837i claim
        attr_reader :initial_referring_provider
        # @return [CandidApiClient::EncounterProviders::V2::Types::SupervisingProvider] Required when the rendering provider is supervised by a physician. If not
        #  required by this implementation guide, do not send.
        attr_reader :supervising_provider
        # @return [CandidApiClient::ServiceFacility::Types::EncounterServiceFacilityBase] Encounter Service facility is typically the location a medical service was
        #  rendered, such as a provider office or hospital. For telehealth, service
        #  facility can represent the provider's location when the service was delivered
        #  (e.g., home), or the location where an in-person visit would have taken place,
        #  whichever is easier to identify. If the provider is in-network, service facility
        #  may be defined in payer contracts. Box 32 on the CMS-1500 claim form. There is
        #  no equivalent on the paper UB-04 claim form, but this field is equivalent to
        #  Loop 2310E Service Facility Location details on an 837i form, and is used when
        #  this is different to the entity identified as the Billing Provider. Note that
        #  for an in-network claim to be successfully adjudicated, the service facility
        #  address listed
        attr_reader :service_facility
        # @return [CandidApiClient::Individual::Types::SubscriberCreate] Subscriber_primary is required when responsible_party is INSURANCE_PAY (i.e.
        #  when the claim should be billed to insurance).
        #  These are not required fields when responsible_party is SELF_PAY (i.e. when the
        #  claim should be billed to the patient).
        #  However, if you collect this for patients, even self-pay, we recommend including
        #  it when sending encounters to Candid.
        #  Note: Cash Pay is no longer a valid payer_id in v4, please use responsible party
        #  to define self-pay claims.
        attr_reader :subscriber_primary
        # @return [CandidApiClient::Individual::Types::SubscriberCreate] Please always include this when you have it, even for self-pay claims.
        attr_reader :subscriber_secondary
        # @return [CandidApiClient::Individual::Types::SubscriberCreate] Please always include this when you have it, even for self-pay claims.
        attr_reader :subscriber_tertiary
        # @return [String] Box 23 on the CMS-1500 claim form or Form Locator 63 on a UB-04 claim form.
        attr_reader :prior_authorization_number
        # @return [CandidApiClient::Encounters::V4::Types::ResponsiblePartyType] Defines the party to be billed with the initial balance owed on the claim.
        attr_reader :responsible_party
        # @return [Array<CandidApiClient::Encounters::V4::Types::ClinicalNoteCategoryCreate>] Holds a collection of clinical observations made by healthcare providers during
        #  patient encounters. Please note that medical records for appeals should be sent
        #  using the Encounter Attachments API.
        attr_reader :clinical_notes
        # @return [Array<CandidApiClient::BillingNotes::V2::Types::BillingNoteBase>] Spot to store misc, human-readable, notes about this encounter to be used
        #  in the billing process.
        attr_reader :billing_notes
        # @return [Array<CandidApiClient::Encounters::V4::Types::PatientHistoryCategory>]
        attr_reader :patient_histories
        # @return [CandidApiClient::Guarantor::V1::Types::GuarantorCreate] Personal and contact info for the guarantor of the patient responsibility.
        attr_reader :guarantor
        # @return [CandidApiClient::ClaimSubmission::V1::Types::ExternalClaimSubmissionCreate] To be included for claims that have been submitted outside of Candid.
        #  Candid supports posting remits and payments to these claims and working them
        #  in-platform (e.g. editing, resubmitting).
        attr_reader :external_claim_submission
        # @return [Array<String>] Names of tags that should be on the encounter.
        attr_reader :tag_ids
        # @return [Array<CandidApiClient::CustomSchemas::V1::Types::SchemaInstance>] Key-value pairs that must adhere to a schema created via the Custom Schema API.
        #  Multiple schema
        #  instances cannot be created for the same schema on an encounter.
        attr_reader :schema_instances
        # @return [String] Refers to REF*9F on the 837p and 837i. Value cannot be greater than 50
        #  characters.
        attr_reader :referral_number
        # @return [CandidApiClient::Encounters::V4::Types::EpsdtReferral] Refers to Box 24H on the CMS1500 form and Loop 2300 CRC - EPSDT Referral on the
        #  837P and 837i form
        attr_reader :epsdt_referral
        # @return [Array<CandidApiClient::Encounters::V4::Types::ClaimSupplementalInformation>] Refers to Loop 2300 - Segment PWK on the 837P and 837i forms. No more than 10
        #  entries are permitted.
        attr_reader :claim_supplemental_information
        # @return [String] When Medicaid is billed as the secondary payer the Carrier Code is used to
        #  identify the primary payer. This is required for certain states.
        attr_reader :secondary_payer_carrier_code
        # @return [String] A client-specified unique ID to associate with this encounter;
        #  for example, your internal encounter ID or a Dr. Chrono encounter ID.
        #  This field should not contain PHI.
        attr_reader :external_id
        # @return [Date] Date formatted as YYYY-MM-DD; eg: 2019-08-24.
        #  This date must be the local date in the timezone where the service occurred.
        #  Box 24a on the CMS-1500 claim form or Form Locator 45 on the UB-04 claim form.
        #  If service occurred over a range of dates, this should be the start date.
        #  date_of_service must be defined on either the encounter or the service lines but
        #  not both.
        #  If there are greater than zero service lines, it is recommended to specify
        #  date_of_service on the service_line instead of on the encounter to prepare for
        #  future API versions.
        attr_reader :date_of_service
        # @return [Date] Date formatted as YYYY-MM-DD; eg: 2019-08-25.
        #  This date must be the local date in the timezone where the service occurred.
        #  If omitted, the Encounter is assumed to be for a single day.
        #  Must not be temporally before the date_of_service field.
        #  If there are greater than zero service lines, it is recommended to specify
        #  end_date_of_service on the service_line instead of on the encounter to prepare
        #  for future API versions.
        attr_reader :end_date_of_service
        # @return [Boolean] Whether this patient has authorized the release of medical information
        #  for billing purpose.
        #  Box 12 on the CMS-1500 claim form  or Form Locator 52 on a UB-04 claim form.
        attr_reader :patient_authorized_release
        # @return [Boolean] Whether this patient has authorized insurance payments to be made to you,
        #  not them. If false, patient may receive reimbursement.
        #  Box 13 on the CMS-1500 claim form or Form Locator 53 on a UB-04 claim form.
        attr_reader :benefits_assigned_to_provider
        # @return [Boolean] Whether you have accepted the patient's authorization for insurance payments
        #  to be made to you, not them.
        #  Box 27 on the CMS-1500 claim form. There is no exact equivalent of this field on
        #  a UB-04 claim, however contributes to the concept of Form Locator 53.
        attr_reader :provider_accepts_assignment
        # @return [String] Human-readable description of the appointment type (ex: "Acupuncture -
        #  Headaches").
        attr_reader :appointment_type
        # @return [Array<CandidApiClient::Encounters::V4::Types::Medication>]
        attr_reader :existing_medications
        # @return [Array<CandidApiClient::Encounters::V4::Types::Intervention>]
        attr_reader :interventions
        # @return [CandidApiClient::Commons::Types::StreetAddressLongZip] Specifies the address to which payments for the claim should be sent.
        attr_reader :pay_to_address
        # @return [CandidApiClient::Encounters::V4::Types::SynchronicityType] Whether or not this was a synchronous or asynchronous encounter.
        #  Asynchronous encounters occur when providers and patients communicate online
        #  using
        #  forms, instant messaging, or other pre-recorded digital mediums.
        #  Synchronous encounters occur in live, real-time settings where the patient
        #  interacts
        #  directly with the provider, such as over video or a phone call.
        attr_reader :synchronicity
        # @return [CandidApiClient::Encounters::V4::Types::Vitals]
        attr_reader :vitals
        # @return [CandidApiClient::Encounters::V4::Types::BillableStatusType] Defines if the Encounter is to be billed by Candid to the responsible_party.
        #  Examples for when this should be set to NOT_BILLABLE include
        #  if the Encounter has not occurred yet or if there is no intention of ever
        #  billing the responsible_party.
        attr_reader :billable_status
        # @return [String] Defines additional information on the claim needed by the payer.
        #  Box 19 on the CMS-1500 claim form or Form Locator 80 on a UB-04 claim form.
        attr_reader :additional_information
        # @return [CandidApiClient::Encounters::V4::Types::ServiceAuthorizationExceptionCode] 837p Loop2300 REF*4N
        #  Required when mandated by government law or regulation to obtain authorization
        #  for specific service(s) but, for the
        #  reasons listed in one of the enum values of ServiceAuthorizationExceptionCode,
        #  the service was performed without
        #  obtaining the authorization.
        attr_reader :service_authorization_exception_code
        # @return [Date] 837p Loop2300 DTP*435, CMS-1500 Box 18 or UB-04 Form Locator 12.
        #  Required on all ambulance claims when the patient was known to be admitted to
        #  the hospital.
        #  OR
        #  Required on all claims involving inpatient medical visits.
        attr_reader :admission_date
        # @return [Date] 837p Loop2300 DTP*096, CMS-1500 Box 18 Required for inpatient claims when the
        #  patient was discharged from the facility and the discharge date is known. Not
        #  used on an institutional claim.
        attr_reader :discharge_date
        # @return [Date] 837p Loop2300 DTP*431, CMS-1500 Box 14
        #  Required for the initial medical service or visit performed in response to a
        #  medical emergency when the date is available and is different than the date of
        #  service.
        #  OR
        #  This date is the onset of acute symptoms for the current illness or condition.
        #  For UB-04 claims, this is populated separately via occurrence codes.
        attr_reader :onset_of_current_illness_or_symptom_date
        # @return [Date] 837p Loop2300 DTP*484, CMS-1500 Box 14
        #  Required when, in the judgment of the provider, the services on this claim are
        #  related to the patient's pregnancy.
        #  This field is populated separately via occurrence codes for UB-04 claim forms.
        attr_reader :last_menstrual_period_date
        # @return [CandidApiClient::Commons::Types::DelayReasonCode] 837i Loop2300, CLM-1300 Box 20
        #  Code indicating the reason why a request was delayed
        attr_reader :delay_reason_code
        # @return [OpenStruct] Additional properties unmapped to the current class definition
        attr_reader :additional_properties
        # @return [Object]
        attr_reader :_field_set
        protected :_field_set

        OMIT = Object.new

        # @param patient [CandidApiClient::Individual::Types::PatientCreate] Contains the identification information of the individual receiving medical
        #  services.
        # @param referring_provider [CandidApiClient::EncounterProviders::V2::Types::ReferringProvider] The final provider who referred the services that were rendered.
        #  All physicians who order services or refer Medicare beneficiaries must
        #  report this data.
        # @param initial_referring_provider [CandidApiClient::EncounterProviders::V2::Types::InitialReferringProvider] The second iteration of Loop ID-2310 on an 837P form. Use code "P3 - Primary
        #  Care Provider" in this loop to
        #  indicate the initial referral from the primary care provider or whatever
        #  provider wrote the initial referral for this patient's episode of care being
        #  billed/reported in this transaction.
        #  Not used in an 837i claim
        # @param supervising_provider [CandidApiClient::EncounterProviders::V2::Types::SupervisingProvider] Required when the rendering provider is supervised by a physician. If not
        #  required by this implementation guide, do not send.
        # @param service_facility [CandidApiClient::ServiceFacility::Types::EncounterServiceFacilityBase] Encounter Service facility is typically the location a medical service was
        #  rendered, such as a provider office or hospital. For telehealth, service
        #  facility can represent the provider's location when the service was delivered
        #  (e.g., home), or the location where an in-person visit would have taken place,
        #  whichever is easier to identify. If the provider is in-network, service facility
        #  may be defined in payer contracts. Box 32 on the CMS-1500 claim form. There is
        #  no equivalent on the paper UB-04 claim form, but this field is equivalent to
        #  Loop 2310E Service Facility Location details on an 837i form, and is used when
        #  this is different to the entity identified as the Billing Provider. Note that
        #  for an in-network claim to be successfully adjudicated, the service facility
        #  address listed
        # @param subscriber_primary [CandidApiClient::Individual::Types::SubscriberCreate] Subscriber_primary is required when responsible_party is INSURANCE_PAY (i.e.
        #  when the claim should be billed to insurance).
        #  These are not required fields when responsible_party is SELF_PAY (i.e. when the
        #  claim should be billed to the patient).
        #  However, if you collect this for patients, even self-pay, we recommend including
        #  it when sending encounters to Candid.
        #  Note: Cash Pay is no longer a valid payer_id in v4, please use responsible party
        #  to define self-pay claims.
        # @param subscriber_secondary [CandidApiClient::Individual::Types::SubscriberCreate] Please always include this when you have it, even for self-pay claims.
        # @param subscriber_tertiary [CandidApiClient::Individual::Types::SubscriberCreate] Please always include this when you have it, even for self-pay claims.
        # @param prior_authorization_number [String] Box 23 on the CMS-1500 claim form or Form Locator 63 on a UB-04 claim form.
        # @param responsible_party [CandidApiClient::Encounters::V4::Types::ResponsiblePartyType] Defines the party to be billed with the initial balance owed on the claim.
        # @param clinical_notes [Array<CandidApiClient::Encounters::V4::Types::ClinicalNoteCategoryCreate>] Holds a collection of clinical observations made by healthcare providers during
        #  patient encounters. Please note that medical records for appeals should be sent
        #  using the Encounter Attachments API.
        # @param billing_notes [Array<CandidApiClient::BillingNotes::V2::Types::BillingNoteBase>] Spot to store misc, human-readable, notes about this encounter to be used
        #  in the billing process.
        # @param patient_histories [Array<CandidApiClient::Encounters::V4::Types::PatientHistoryCategory>]
        # @param guarantor [CandidApiClient::Guarantor::V1::Types::GuarantorCreate] Personal and contact info for the guarantor of the patient responsibility.
        # @param external_claim_submission [CandidApiClient::ClaimSubmission::V1::Types::ExternalClaimSubmissionCreate] To be included for claims that have been submitted outside of Candid.
        #  Candid supports posting remits and payments to these claims and working them
        #  in-platform (e.g. editing, resubmitting).
        # @param tag_ids [Array<String>] Names of tags that should be on the encounter.
        # @param schema_instances [Array<CandidApiClient::CustomSchemas::V1::Types::SchemaInstance>] Key-value pairs that must adhere to a schema created via the Custom Schema API.
        #  Multiple schema
        #  instances cannot be created for the same schema on an encounter.
        # @param referral_number [String] Refers to REF*9F on the 837p and 837i. Value cannot be greater than 50
        #  characters.
        # @param epsdt_referral [CandidApiClient::Encounters::V4::Types::EpsdtReferral] Refers to Box 24H on the CMS1500 form and Loop 2300 CRC - EPSDT Referral on the
        #  837P and 837i form
        # @param claim_supplemental_information [Array<CandidApiClient::Encounters::V4::Types::ClaimSupplementalInformation>] Refers to Loop 2300 - Segment PWK on the 837P and 837i forms. No more than 10
        #  entries are permitted.
        # @param secondary_payer_carrier_code [String] When Medicaid is billed as the secondary payer the Carrier Code is used to
        #  identify the primary payer. This is required for certain states.
        # @param external_id [String] A client-specified unique ID to associate with this encounter;
        #  for example, your internal encounter ID or a Dr. Chrono encounter ID.
        #  This field should not contain PHI.
        # @param date_of_service [Date] Date formatted as YYYY-MM-DD; eg: 2019-08-24.
        #  This date must be the local date in the timezone where the service occurred.
        #  Box 24a on the CMS-1500 claim form or Form Locator 45 on the UB-04 claim form.
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
        # @param patient_authorized_release [Boolean] Whether this patient has authorized the release of medical information
        #  for billing purpose.
        #  Box 12 on the CMS-1500 claim form  or Form Locator 52 on a UB-04 claim form.
        # @param benefits_assigned_to_provider [Boolean] Whether this patient has authorized insurance payments to be made to you,
        #  not them. If false, patient may receive reimbursement.
        #  Box 13 on the CMS-1500 claim form or Form Locator 53 on a UB-04 claim form.
        # @param provider_accepts_assignment [Boolean] Whether you have accepted the patient's authorization for insurance payments
        #  to be made to you, not them.
        #  Box 27 on the CMS-1500 claim form. There is no exact equivalent of this field on
        #  a UB-04 claim, however contributes to the concept of Form Locator 53.
        # @param appointment_type [String] Human-readable description of the appointment type (ex: "Acupuncture -
        #  Headaches").
        # @param existing_medications [Array<CandidApiClient::Encounters::V4::Types::Medication>]
        # @param interventions [Array<CandidApiClient::Encounters::V4::Types::Intervention>]
        # @param pay_to_address [CandidApiClient::Commons::Types::StreetAddressLongZip] Specifies the address to which payments for the claim should be sent.
        # @param synchronicity [CandidApiClient::Encounters::V4::Types::SynchronicityType] Whether or not this was a synchronous or asynchronous encounter.
        #  Asynchronous encounters occur when providers and patients communicate online
        #  using
        #  forms, instant messaging, or other pre-recorded digital mediums.
        #  Synchronous encounters occur in live, real-time settings where the patient
        #  interacts
        #  directly with the provider, such as over video or a phone call.
        # @param vitals [CandidApiClient::Encounters::V4::Types::Vitals]
        # @param billable_status [CandidApiClient::Encounters::V4::Types::BillableStatusType] Defines if the Encounter is to be billed by Candid to the responsible_party.
        #  Examples for when this should be set to NOT_BILLABLE include
        #  if the Encounter has not occurred yet or if there is no intention of ever
        #  billing the responsible_party.
        # @param additional_information [String] Defines additional information on the claim needed by the payer.
        #  Box 19 on the CMS-1500 claim form or Form Locator 80 on a UB-04 claim form.
        # @param service_authorization_exception_code [CandidApiClient::Encounters::V4::Types::ServiceAuthorizationExceptionCode] 837p Loop2300 REF*4N
        #  Required when mandated by government law or regulation to obtain authorization
        #  for specific service(s) but, for the
        #  reasons listed in one of the enum values of ServiceAuthorizationExceptionCode,
        #  the service was performed without
        #  obtaining the authorization.
        # @param admission_date [Date] 837p Loop2300 DTP*435, CMS-1500 Box 18 or UB-04 Form Locator 12.
        #  Required on all ambulance claims when the patient was known to be admitted to
        #  the hospital.
        #  OR
        #  Required on all claims involving inpatient medical visits.
        # @param discharge_date [Date] 837p Loop2300 DTP*096, CMS-1500 Box 18 Required for inpatient claims when the
        #  patient was discharged from the facility and the discharge date is known. Not
        #  used on an institutional claim.
        # @param onset_of_current_illness_or_symptom_date [Date] 837p Loop2300 DTP*431, CMS-1500 Box 14
        #  Required for the initial medical service or visit performed in response to a
        #  medical emergency when the date is available and is different than the date of
        #  service.
        #  OR
        #  This date is the onset of acute symptoms for the current illness or condition.
        #  For UB-04 claims, this is populated separately via occurrence codes.
        # @param last_menstrual_period_date [Date] 837p Loop2300 DTP*484, CMS-1500 Box 14
        #  Required when, in the judgment of the provider, the services on this claim are
        #  related to the patient's pregnancy.
        #  This field is populated separately via occurrence codes for UB-04 claim forms.
        # @param delay_reason_code [CandidApiClient::Commons::Types::DelayReasonCode] 837i Loop2300, CLM-1300 Box 20
        #  Code indicating the reason why a request was delayed
        # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
        # @return [CandidApiClient::EncountersUniversal::Types::UniversalEncounterCreateBase]
        def initialize(patient:, responsible_party:, external_id:, patient_authorized_release:, benefits_assigned_to_provider:, provider_accepts_assignment:, billable_status:, referring_provider: OMIT, initial_referring_provider: OMIT,
                       supervising_provider: OMIT, service_facility: OMIT, subscriber_primary: OMIT, subscriber_secondary: OMIT, subscriber_tertiary: OMIT, prior_authorization_number: OMIT, clinical_notes: OMIT, billing_notes: OMIT, patient_histories: OMIT, guarantor: OMIT, external_claim_submission: OMIT, tag_ids: OMIT, schema_instances: OMIT, referral_number: OMIT, epsdt_referral: OMIT, claim_supplemental_information: OMIT, secondary_payer_carrier_code: OMIT, date_of_service: OMIT, end_date_of_service: OMIT, appointment_type: OMIT, existing_medications: OMIT, interventions: OMIT, pay_to_address: OMIT, synchronicity: OMIT, vitals: OMIT, additional_information: OMIT, service_authorization_exception_code: OMIT, admission_date: OMIT, discharge_date: OMIT, onset_of_current_illness_or_symptom_date: OMIT, last_menstrual_period_date: OMIT, delay_reason_code: OMIT, additional_properties: nil)
          @patient = patient
          @referring_provider = referring_provider if referring_provider != OMIT
          @initial_referring_provider = initial_referring_provider if initial_referring_provider != OMIT
          @supervising_provider = supervising_provider if supervising_provider != OMIT
          @service_facility = service_facility if service_facility != OMIT
          @subscriber_primary = subscriber_primary if subscriber_primary != OMIT
          @subscriber_secondary = subscriber_secondary if subscriber_secondary != OMIT
          @subscriber_tertiary = subscriber_tertiary if subscriber_tertiary != OMIT
          @prior_authorization_number = prior_authorization_number if prior_authorization_number != OMIT
          @responsible_party = responsible_party
          @clinical_notes = clinical_notes if clinical_notes != OMIT
          @billing_notes = billing_notes if billing_notes != OMIT
          @patient_histories = patient_histories if patient_histories != OMIT
          @guarantor = guarantor if guarantor != OMIT
          @external_claim_submission = external_claim_submission if external_claim_submission != OMIT
          @tag_ids = tag_ids if tag_ids != OMIT
          @schema_instances = schema_instances if schema_instances != OMIT
          @referral_number = referral_number if referral_number != OMIT
          @epsdt_referral = epsdt_referral if epsdt_referral != OMIT
          @claim_supplemental_information = claim_supplemental_information if claim_supplemental_information != OMIT
          @secondary_payer_carrier_code = secondary_payer_carrier_code if secondary_payer_carrier_code != OMIT
          @external_id = external_id
          @date_of_service = date_of_service if date_of_service != OMIT
          @end_date_of_service = end_date_of_service if end_date_of_service != OMIT
          @patient_authorized_release = patient_authorized_release
          @benefits_assigned_to_provider = benefits_assigned_to_provider
          @provider_accepts_assignment = provider_accepts_assignment
          @appointment_type = appointment_type if appointment_type != OMIT
          @existing_medications = existing_medications if existing_medications != OMIT
          @interventions = interventions if interventions != OMIT
          @pay_to_address = pay_to_address if pay_to_address != OMIT
          @synchronicity = synchronicity if synchronicity != OMIT
          @vitals = vitals if vitals != OMIT
          @billable_status = billable_status
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
          @additional_properties = additional_properties
          @_field_set = {
            "patient": patient,
            "referring_provider": referring_provider,
            "initial_referring_provider": initial_referring_provider,
            "supervising_provider": supervising_provider,
            "service_facility": service_facility,
            "subscriber_primary": subscriber_primary,
            "subscriber_secondary": subscriber_secondary,
            "subscriber_tertiary": subscriber_tertiary,
            "prior_authorization_number": prior_authorization_number,
            "responsible_party": responsible_party,
            "clinical_notes": clinical_notes,
            "billing_notes": billing_notes,
            "patient_histories": patient_histories,
            "guarantor": guarantor,
            "external_claim_submission": external_claim_submission,
            "tag_ids": tag_ids,
            "schema_instances": schema_instances,
            "referral_number": referral_number,
            "epsdt_referral": epsdt_referral,
            "claim_supplemental_information": claim_supplemental_information,
            "secondary_payer_carrier_code": secondary_payer_carrier_code,
            "external_id": external_id,
            "date_of_service": date_of_service,
            "end_date_of_service": end_date_of_service,
            "patient_authorized_release": patient_authorized_release,
            "benefits_assigned_to_provider": benefits_assigned_to_provider,
            "provider_accepts_assignment": provider_accepts_assignment,
            "appointment_type": appointment_type,
            "existing_medications": existing_medications,
            "interventions": interventions,
            "pay_to_address": pay_to_address,
            "synchronicity": synchronicity,
            "vitals": vitals,
            "billable_status": billable_status,
            "additional_information": additional_information,
            "service_authorization_exception_code": service_authorization_exception_code,
            "admission_date": admission_date,
            "discharge_date": discharge_date,
            "onset_of_current_illness_or_symptom_date": onset_of_current_illness_or_symptom_date,
            "last_menstrual_period_date": last_menstrual_period_date,
            "delay_reason_code": delay_reason_code
          }.reject do |_k, v|
            v == OMIT
          end
        end

        # Deserialize a JSON object to an instance of UniversalEncounterCreateBase
        #
        # @param json_object [String]
        # @return [CandidApiClient::EncountersUniversal::Types::UniversalEncounterCreateBase]
        def self.from_json(json_object:)
          struct = JSON.parse(json_object, object_class: OpenStruct)
          parsed_json = JSON.parse(json_object)
          if parsed_json["patient"].nil?
            patient = nil
          else
            patient = parsed_json["patient"].to_json
            patient = CandidApiClient::Individual::Types::PatientCreate.from_json(json_object: patient)
          end
          if parsed_json["referring_provider"].nil?
            referring_provider = nil
          else
            referring_provider = parsed_json["referring_provider"].to_json
            referring_provider = CandidApiClient::EncounterProviders::V2::Types::ReferringProvider.from_json(json_object: referring_provider)
          end
          if parsed_json["initial_referring_provider"].nil?
            initial_referring_provider = nil
          else
            initial_referring_provider = parsed_json["initial_referring_provider"].to_json
            initial_referring_provider = CandidApiClient::EncounterProviders::V2::Types::InitialReferringProvider.from_json(json_object: initial_referring_provider)
          end
          if parsed_json["supervising_provider"].nil?
            supervising_provider = nil
          else
            supervising_provider = parsed_json["supervising_provider"].to_json
            supervising_provider = CandidApiClient::EncounterProviders::V2::Types::SupervisingProvider.from_json(json_object: supervising_provider)
          end
          if parsed_json["service_facility"].nil?
            service_facility = nil
          else
            service_facility = parsed_json["service_facility"].to_json
            service_facility = CandidApiClient::ServiceFacility::Types::EncounterServiceFacilityBase.from_json(json_object: service_facility)
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
          if parsed_json["subscriber_tertiary"].nil?
            subscriber_tertiary = nil
          else
            subscriber_tertiary = parsed_json["subscriber_tertiary"].to_json
            subscriber_tertiary = CandidApiClient::Individual::Types::SubscriberCreate.from_json(json_object: subscriber_tertiary)
          end
          prior_authorization_number = struct["prior_authorization_number"]
          responsible_party = struct["responsible_party"]
          clinical_notes = parsed_json["clinical_notes"]&.map do |item|
            item = item.to_json
            CandidApiClient::Encounters::V4::Types::ClinicalNoteCategoryCreate.from_json(json_object: item)
          end
          billing_notes = parsed_json["billing_notes"]&.map do |item|
            item = item.to_json
            CandidApiClient::BillingNotes::V2::Types::BillingNoteBase.from_json(json_object: item)
          end
          patient_histories = parsed_json["patient_histories"]&.map do |item|
            item = item.to_json
            CandidApiClient::Encounters::V4::Types::PatientHistoryCategory.from_json(json_object: item)
          end
          if parsed_json["guarantor"].nil?
            guarantor = nil
          else
            guarantor = parsed_json["guarantor"].to_json
            guarantor = CandidApiClient::Guarantor::V1::Types::GuarantorCreate.from_json(json_object: guarantor)
          end
          if parsed_json["external_claim_submission"].nil?
            external_claim_submission = nil
          else
            external_claim_submission = parsed_json["external_claim_submission"].to_json
            external_claim_submission = CandidApiClient::ClaimSubmission::V1::Types::ExternalClaimSubmissionCreate.from_json(json_object: external_claim_submission)
          end
          tag_ids = struct["tag_ids"]
          schema_instances = parsed_json["schema_instances"]&.map do |item|
            item = item.to_json
            CandidApiClient::CustomSchemas::V1::Types::SchemaInstance.from_json(json_object: item)
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
          secondary_payer_carrier_code = struct["secondary_payer_carrier_code"]
          external_id = struct["external_id"]
          date_of_service = (Date.parse(parsed_json["date_of_service"]) unless parsed_json["date_of_service"].nil?)
          end_date_of_service = unless parsed_json["end_date_of_service"].nil?
                                  Date.parse(parsed_json["end_date_of_service"])
                                end
          patient_authorized_release = struct["patient_authorized_release"]
          benefits_assigned_to_provider = struct["benefits_assigned_to_provider"]
          provider_accepts_assignment = struct["provider_accepts_assignment"]
          appointment_type = struct["appointment_type"]
          existing_medications = parsed_json["existing_medications"]&.map do |item|
            item = item.to_json
            CandidApiClient::Encounters::V4::Types::Medication.from_json(json_object: item)
          end
          interventions = parsed_json["interventions"]&.map do |item|
            item = item.to_json
            CandidApiClient::Encounters::V4::Types::Intervention.from_json(json_object: item)
          end
          if parsed_json["pay_to_address"].nil?
            pay_to_address = nil
          else
            pay_to_address = parsed_json["pay_to_address"].to_json
            pay_to_address = CandidApiClient::Commons::Types::StreetAddressLongZip.from_json(json_object: pay_to_address)
          end
          synchronicity = struct["synchronicity"]
          if parsed_json["vitals"].nil?
            vitals = nil
          else
            vitals = parsed_json["vitals"].to_json
            vitals = CandidApiClient::Encounters::V4::Types::Vitals.from_json(json_object: vitals)
          end
          billable_status = struct["billable_status"]
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
          new(
            patient: patient,
            referring_provider: referring_provider,
            initial_referring_provider: initial_referring_provider,
            supervising_provider: supervising_provider,
            service_facility: service_facility,
            subscriber_primary: subscriber_primary,
            subscriber_secondary: subscriber_secondary,
            subscriber_tertiary: subscriber_tertiary,
            prior_authorization_number: prior_authorization_number,
            responsible_party: responsible_party,
            clinical_notes: clinical_notes,
            billing_notes: billing_notes,
            patient_histories: patient_histories,
            guarantor: guarantor,
            external_claim_submission: external_claim_submission,
            tag_ids: tag_ids,
            schema_instances: schema_instances,
            referral_number: referral_number,
            epsdt_referral: epsdt_referral,
            claim_supplemental_information: claim_supplemental_information,
            secondary_payer_carrier_code: secondary_payer_carrier_code,
            external_id: external_id,
            date_of_service: date_of_service,
            end_date_of_service: end_date_of_service,
            patient_authorized_release: patient_authorized_release,
            benefits_assigned_to_provider: benefits_assigned_to_provider,
            provider_accepts_assignment: provider_accepts_assignment,
            appointment_type: appointment_type,
            existing_medications: existing_medications,
            interventions: interventions,
            pay_to_address: pay_to_address,
            synchronicity: synchronicity,
            vitals: vitals,
            billable_status: billable_status,
            additional_information: additional_information,
            service_authorization_exception_code: service_authorization_exception_code,
            admission_date: admission_date,
            discharge_date: discharge_date,
            onset_of_current_illness_or_symptom_date: onset_of_current_illness_or_symptom_date,
            last_menstrual_period_date: last_menstrual_period_date,
            delay_reason_code: delay_reason_code,
            additional_properties: struct
          )
        end

        # Serialize an instance of UniversalEncounterCreateBase to a JSON object
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
          CandidApiClient::Individual::Types::PatientCreate.validate_raw(obj: obj.patient)
          obj.referring_provider.nil? || CandidApiClient::EncounterProviders::V2::Types::ReferringProvider.validate_raw(obj: obj.referring_provider)
          obj.initial_referring_provider.nil? || CandidApiClient::EncounterProviders::V2::Types::InitialReferringProvider.validate_raw(obj: obj.initial_referring_provider)
          obj.supervising_provider.nil? || CandidApiClient::EncounterProviders::V2::Types::SupervisingProvider.validate_raw(obj: obj.supervising_provider)
          obj.service_facility.nil? || CandidApiClient::ServiceFacility::Types::EncounterServiceFacilityBase.validate_raw(obj: obj.service_facility)
          obj.subscriber_primary.nil? || CandidApiClient::Individual::Types::SubscriberCreate.validate_raw(obj: obj.subscriber_primary)
          obj.subscriber_secondary.nil? || CandidApiClient::Individual::Types::SubscriberCreate.validate_raw(obj: obj.subscriber_secondary)
          obj.subscriber_tertiary.nil? || CandidApiClient::Individual::Types::SubscriberCreate.validate_raw(obj: obj.subscriber_tertiary)
          obj.prior_authorization_number&.is_a?(String) != false || raise("Passed value for field obj.prior_authorization_number is not the expected type, validation failed.")
          obj.responsible_party.is_a?(CandidApiClient::Encounters::V4::Types::ResponsiblePartyType) != false || raise("Passed value for field obj.responsible_party is not the expected type, validation failed.")
          obj.clinical_notes&.is_a?(Array) != false || raise("Passed value for field obj.clinical_notes is not the expected type, validation failed.")
          obj.billing_notes&.is_a?(Array) != false || raise("Passed value for field obj.billing_notes is not the expected type, validation failed.")
          obj.patient_histories&.is_a?(Array) != false || raise("Passed value for field obj.patient_histories is not the expected type, validation failed.")
          obj.guarantor.nil? || CandidApiClient::Guarantor::V1::Types::GuarantorCreate.validate_raw(obj: obj.guarantor)
          obj.external_claim_submission.nil? || CandidApiClient::ClaimSubmission::V1::Types::ExternalClaimSubmissionCreate.validate_raw(obj: obj.external_claim_submission)
          obj.tag_ids&.is_a?(Array) != false || raise("Passed value for field obj.tag_ids is not the expected type, validation failed.")
          obj.schema_instances&.is_a?(Array) != false || raise("Passed value for field obj.schema_instances is not the expected type, validation failed.")
          obj.referral_number&.is_a?(String) != false || raise("Passed value for field obj.referral_number is not the expected type, validation failed.")
          obj.epsdt_referral.nil? || CandidApiClient::Encounters::V4::Types::EpsdtReferral.validate_raw(obj: obj.epsdt_referral)
          obj.claim_supplemental_information&.is_a?(Array) != false || raise("Passed value for field obj.claim_supplemental_information is not the expected type, validation failed.")
          obj.secondary_payer_carrier_code&.is_a?(String) != false || raise("Passed value for field obj.secondary_payer_carrier_code is not the expected type, validation failed.")
          obj.external_id.is_a?(String) != false || raise("Passed value for field obj.external_id is not the expected type, validation failed.")
          obj.date_of_service&.is_a?(Date) != false || raise("Passed value for field obj.date_of_service is not the expected type, validation failed.")
          obj.end_date_of_service&.is_a?(Date) != false || raise("Passed value for field obj.end_date_of_service is not the expected type, validation failed.")
          obj.patient_authorized_release.is_a?(Boolean) != false || raise("Passed value for field obj.patient_authorized_release is not the expected type, validation failed.")
          obj.benefits_assigned_to_provider.is_a?(Boolean) != false || raise("Passed value for field obj.benefits_assigned_to_provider is not the expected type, validation failed.")
          obj.provider_accepts_assignment.is_a?(Boolean) != false || raise("Passed value for field obj.provider_accepts_assignment is not the expected type, validation failed.")
          obj.appointment_type&.is_a?(String) != false || raise("Passed value for field obj.appointment_type is not the expected type, validation failed.")
          obj.existing_medications&.is_a?(Array) != false || raise("Passed value for field obj.existing_medications is not the expected type, validation failed.")
          obj.interventions&.is_a?(Array) != false || raise("Passed value for field obj.interventions is not the expected type, validation failed.")
          obj.pay_to_address.nil? || CandidApiClient::Commons::Types::StreetAddressLongZip.validate_raw(obj: obj.pay_to_address)
          obj.synchronicity&.is_a?(CandidApiClient::Encounters::V4::Types::SynchronicityType) != false || raise("Passed value for field obj.synchronicity is not the expected type, validation failed.")
          obj.vitals.nil? || CandidApiClient::Encounters::V4::Types::Vitals.validate_raw(obj: obj.vitals)
          obj.billable_status.is_a?(CandidApiClient::Encounters::V4::Types::BillableStatusType) != false || raise("Passed value for field obj.billable_status is not the expected type, validation failed.")
          obj.additional_information&.is_a?(String) != false || raise("Passed value for field obj.additional_information is not the expected type, validation failed.")
          obj.service_authorization_exception_code&.is_a?(CandidApiClient::Encounters::V4::Types::ServiceAuthorizationExceptionCode) != false || raise("Passed value for field obj.service_authorization_exception_code is not the expected type, validation failed.")
          obj.admission_date&.is_a?(Date) != false || raise("Passed value for field obj.admission_date is not the expected type, validation failed.")
          obj.discharge_date&.is_a?(Date) != false || raise("Passed value for field obj.discharge_date is not the expected type, validation failed.")
          obj.onset_of_current_illness_or_symptom_date&.is_a?(Date) != false || raise("Passed value for field obj.onset_of_current_illness_or_symptom_date is not the expected type, validation failed.")
          obj.last_menstrual_period_date&.is_a?(Date) != false || raise("Passed value for field obj.last_menstrual_period_date is not the expected type, validation failed.")
          obj.delay_reason_code&.is_a?(CandidApiClient::Commons::Types::DelayReasonCode) != false || raise("Passed value for field obj.delay_reason_code is not the expected type, validation failed.")
        end
      end
    end
  end
end
